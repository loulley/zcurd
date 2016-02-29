package com.zcurd.controller;

import java.util.Map;

import com.jfinal.aop.Duang;
import com.zcurd.common.CommonController;
import com.zcurd.common.DBTool;
import com.zcurd.common.DbMetaTool;
import com.zcurd.common.StringUtil;
import com.zcurd.common.ZurdTool;
import com.zcurd.model.ZcurdHead;
import com.zcurd.service.ZcurdService;

/**
 * 在线表单
 * @author 钟世云 2016.2.5
 */
public class ZcurdController extends CommonController {
	
	public void listPage() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		Map<String, Object> metaMap = zcurdService.getMetaData(headId);
		setAttr("headId", headId);
		setAttrs(metaMap);
		setAttr("queryPara", ZurdTool.getQueryPara(getParaMap()));
	}
	
	public void listData() {
		int headId = getHeadId();
		Map<String, Object> mapmeta = DbMetaTool.getMetaData(headId);
		ZcurdHead head = (ZcurdHead) mapmeta.get("head");
		
		Object[] queryParams = getQueryParams();
		String[] properties = (String[]) queryParams[0];
		String[] symbols = (String[]) queryParams[1];
		Object[] values = (Object[]) queryParams[2];
		
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = head.getIdField() + " desc";
		}
		
		renderDatagrid(
				ZurdTool.replaceDict(headId, DBTool.findByMultProperties(head.getTableName(), properties, symbols, values, orderBy, getPager())), 
				DBTool.countByMultProperties(head.getTableName(), properties, symbols, values));
	}
	
	//增加页面
	public void addPage() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		Map<String, Object> metaMap = zcurdService.getMetaData(headId);
		setAttr("headId", headId);
		setAttrs(metaMap);
		setAttr("queryPara", ZurdTool.getQueryPara(getParaMap()));
	}
	
	//增加
	public void add() {
		Map<String, String[]> paraMap = getParaMap();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.add(getHeadId(), paraMap);
		renderSuccess();
	}
	
	//修改页面
	public void updatePage() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		Map<String, Object> metaMap = zcurdService.getMetaData(headId);
		setAttr("headId", headId);
		setAttrs(metaMap);
		setAttr("model", zcurdService.get(headId, getParaToInt("id")).getColumns());
		render("updatePage.html");
	}
	
	//修改
	public void update() {
		Map<String, String[]> paraMap = getParaMap();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.update(getHeadId(), getParaToInt("id"), paraMap);
		renderSuccess();
	}
	
	//删除
	public void delete() {
		Integer[] ids = getParaValuesToInt("id[]");
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.delete(getHeadId(), ids);
	}
	
	//详情页面
	public void detailPage() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		Map<String, Object> metaMap = zcurdService.getMetaData(headId);
		Map<String, Object> row = zcurdService.get(headId, getParaToInt("id")).getColumns();
		setAttr("headId", headId);
		setAttrs(metaMap);
		setAttr("model", ZurdTool.replaceDict(headId, row));
		render("detailPage.html");
	}
	
	
	/**
	 * 从url中获取headId
	 */
	private int getHeadId() {
		String headId = getAttr("headId");
		return Integer.parseInt(headId);
	}


}
