package com.zcurd.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Duang;
import com.zcurd.common.DBTool;
import com.zcurd.common.DbMetaTool;
import com.zcurd.common.StringUtil;
import com.zcurd.common.ZcurdTool;
import com.zcurd.ext.render.csv.CsvRender;
import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;
import com.zcurd.service.ZcurdService;
import com.zcurd.vo.ZcurdMeta;

/**
 * 在线表单
 * @author 钟世云 2016.2.5
 */
public class ZcurdController extends CommonController {
	
	public void listPage() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		ZcurdMeta metaMap = zcurdService.getMetaData(headId);
		setAttr("headId", headId);
		setAttrs(ZcurdTool.convert2Map(metaMap));
		setAttr("queryPara", ZcurdTool.getQueryPara(getParaMap()));
	}
	
	public void listData() {
		int headId = getHeadId();
		ZcurdMeta mapmeta = DbMetaTool.getMetaData(headId);
		ZcurdHead head = mapmeta.getHead();
		
		Object[] queryParams = getQueryParams();
		String[] properties = (String[]) queryParams[0];
		String[] symbols = (String[]) queryParams[1];
		Object[] values = (Object[]) queryParams[2];
		
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = head.getIdField() + " desc";
		}
		
		renderDatagrid(
				ZcurdTool.replaceDict(headId, DBTool.findByMultPropertiesDbSource(head.getDbSource(), head.getTableName(), properties, symbols, values, orderBy, getPager())), 
				DBTool.countByMultPropertiesDbSource(head.getDbSource(), head.getTableName(), properties, symbols, values));
	}
	
	//增加页面
	public void addPage() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		ZcurdMeta metaMap = zcurdService.getMetaData(headId);
		setAttr("headId", headId);
		setAttrs(ZcurdTool.convert2Map(metaMap));
		setAttr("queryPara", ZcurdTool.getQueryPara(getParaMap()));
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
		ZcurdMeta metaMap = zcurdService.getMetaData(headId);
		setAttr("headId", headId);
		setAttrs(ZcurdTool.convert2Map(metaMap));
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
		ZcurdMeta metaMap = zcurdService.getMetaData(headId);
		Map<String, Object> row = zcurdService.get(headId, getParaToInt("id")).getColumns();
		setAttr("headId", headId);
		setAttrs(ZcurdTool.convert2Map(metaMap));
		setAttr("model", ZcurdTool.replaceDict(headId, row));
		render("detailPage.html");
	}
	
	//导出csv
	public void exportCsv() {
		int headId = getHeadId();
		ZcurdMeta mapmeta = DbMetaTool.getMetaData(headId);
		ZcurdHead head = mapmeta.getHead();
		List<ZcurdField> fieldList = mapmeta.getFieldList();
		
		Object[] queryParams = getQueryParams();
		String[] properties = (String[]) queryParams[0];
		String[] symbols = (String[]) queryParams[1];
		Object[] values = (Object[]) queryParams[2];
		
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = head.getIdField() + " desc";
		}
		
		List<Map<String, Object>> list = ZcurdTool.replaceDict(headId, 
				DBTool.findByMultPropertiesDbSource(ZcurdTool.getDbSource(head.getDbSource()), head.getTableName(), properties, symbols, values));
		List<String> headers = new ArrayList<String>();
		List<String> clomuns = new ArrayList<String>();
		for (ZcurdField zcurdField : fieldList) {
			if(zcurdField.getInt("is_show_list") == 1) {
				headers.add(zcurdField.getStr("column_name"));
				clomuns.add(zcurdField.getStr("field_name"));
			}
		}
		CsvRender csvRender = new CsvRender(headers, list);
		csvRender.clomuns(clomuns);
		csvRender.fileName(head.getStr("form_name"));
		render(csvRender);
	}
	
	/**
	 * 从url中获取headId
	 */
	private int getHeadId() {
		String headId = getAttr("headId");
		return Integer.parseInt(headId);
	}


}
