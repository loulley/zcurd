package com.busi.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.busi.model.StockHistoryLog;
import com.zcurd.common.DBTool;
import com.zcurd.common.DbMetaTool;
import com.zcurd.common.StringUtil;
import com.zcurd.common.ZcurdTool;
import com.zcurd.controller.BaseController;
import com.zcurd.ext.render.csv.CsvRender;
import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;
import com.zcurd.vo.ZcurdMeta;

/**
 * 股票历史数据
 */
public class StockHistoryLogController extends BaseController {
	
	public void listPage() {
		render("list.html");
	}
	
	public void listData() {
		Object[] queryParams = getQueryParams();
		String[] properties = (String[]) queryParams[0];
		String[] symbols = (String[]) queryParams[1];
		Object[] values = (Object[]) queryParams[2];
		
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = "id desc";
		}
		
		renderDatagrid(
			DBTool.findByMultPropertiesDbSource("bus1", "stock_history_log", properties, symbols, values, orderBy, getPager()), 
			DBTool.countByMultPropertiesDbSource("bus1", "stock_history_log", properties, symbols, values)
		);
	}
	
	//增加页面
	public void addPage() {
		render("add.html");
	}
	
	//增加
	public void add() {
		getModel(StockHistoryLog.class, "model").save();
		renderSuccess();
	}
	
	//修改页面
	public void updatePage() {
		setAttr("model", StockHistoryLog.me.findById(getPara("id")));
		render("update.html");
	}
	
	//修改
	public void update() {
		StockHistoryLog model = StockHistoryLog.me.findById(getPara("model.id"));
		model.set("dt", getPara("model.dt"));
		model.set("code", getPara("model.code"));
		model.set("name", getPara("model.name"));
		model.set("closing_price", getPara("model.closing_price"));
		model.set("top_price", getPara("model.top_price"));
		model.set("minimum_price", getPara("model.minimum_price"));
		model.set("opening_price", getPara("model.opening_price"));
		model.set("pre", getPara("model.pre"));
		model.set("change_amount", getPara("model.change_amount"));
		model.set("change_ratio", getPara("model.change_ratio"));
		model.set("turnover_volume", getPara("model.turnover_volume"));
		model.update();
		renderSuccess();
	}
	
	//删除
	public void delete() {
	}
	
	//详情页面
	public void detailPage() {
		render("detail.html");
	}
	
	//导出csv
	public void exportCsv() {
	}
}
