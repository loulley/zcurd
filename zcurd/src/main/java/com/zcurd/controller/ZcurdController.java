package com.zcurd.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.zcurd.common.DBTool;
import com.zcurd.common.DbMetaTool;
import com.zcurd.common.StringUtil;
import com.zcurd.common.ZcurdTool;
import com.zcurd.common.handler.CurdHandle;
import com.zcurd.ext.render.csv.CsvRender;
import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;
import com.zcurd.service.ZcurdService;
import com.zcurd.vo.ZcurdMeta;

/**
 * 在线表单
 * @author 钟世云 2016.2.5
 */
public class ZcurdController extends BaseController {
	
	//列表页面
	public void listPage() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		ZcurdMeta metaData = zcurdService.getMetaData(headId);
		flushDictData(metaData);
		
		setAttr("headId", headId);
		setAttrs(metaData.toMap());
		setAttr("queryPara", ZcurdTool.getQueryPara(getParaMap()));
		render("listPage.html");
	}
	
	//列表数据
	public void listData() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		ZcurdMeta metaData = DbMetaTool.getMetaData(headId);
		ZcurdHead head = metaData.getHead();
		
		Object[] queryParams = getQueryParams();
		String[] properties = (String[]) queryParams[0];
		String[] symbols = (String[]) queryParams[1];
		Object[] values = (Object[]) queryParams[2];
		
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = head.getIdField() + " desc";
		}
		
		renderDatagrid(
				ZcurdTool.replaceDict(metaData, DBTool.findByMultPropertiesDbSource(head.getDbSource(), head.getTableName(), properties, symbols, values, orderBy, getPager())), 
				DBTool.countByMultPropertiesDbSource(head.getDbSource(), head.getTableName(), properties, symbols, values), 
				zcurdService.getFooter(metaData, properties, symbols, values));
	}
	
	//增加页面
	public void addPage() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		ZcurdMeta metaData = zcurdService.getMetaData(headId);
		flushDictData(metaData);
		
		setAttr("headId", headId);
		setAttrs(metaData.toMap());
		setAttr("queryPara", ZcurdTool.getQueryPara(getParaMap()));
	}
	
	//增加
	public void add() {
		int headId = getHeadId();
		ZcurdMeta metaData = DbMetaTool.getMetaData(headId);
		ZcurdHead head = metaData.getHead();
		/*try {
			CurdHandle ch = (CurdHandle) Class.forName("com.zcurd.common.handler.FlushFormCurdHandle").newInstance();
			ch.add(headId, getRequest());
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		Map<String, String[]> paraMap = getParaMap();
		zcurdService.add(getHeadId(), paraMap);
		
		addOpLog("[" + head.getFormName() + "] 增加");
		renderSuccess();
	}
	
	//修改页面
	public void updatePage() {
		int headId = getHeadId();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		ZcurdMeta metaData = zcurdService.getMetaData(headId);
		flushDictData(metaData);
		
		setAttr("headId", headId);
		setAttrs(metaData.toMap());
		setAttr("model", zcurdService.get(headId, getParaToInt("id")).getColumns());
		render("updatePage.html");
	}
	
	//修改
	public void update() {
		int headId = getHeadId();
		ZcurdMeta metaData = DbMetaTool.getMetaData(headId);
		ZcurdHead head = metaData.getHead();
		
		Map<String, String[]> paraMap = getParaMap();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.update(getHeadId(), getParaToInt("id"), paraMap);
		
		addOpLog("[" + head.getFormName() + "] 修改");
		renderSuccess();
	}
	
	//删除
	public void delete() {
		int headId = getHeadId();
		ZcurdMeta metaData = DbMetaTool.getMetaData(headId);
		ZcurdHead head = metaData.getHead();
		
		Integer[] ids = getParaValuesToInt("id[]");
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.delete(getHeadId(), ids);
		
		addOpLog("[" + head.getFormName() + "] 删除");
		renderSuccess();
	}
	
	//详情页面
	public void detailPage() {
		int headId = getHeadId();
		ZcurdMeta metaData = DbMetaTool.getMetaData(headId);
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		
		Record row = zcurdService.get(headId, getParaToInt("id"));
		setAttr("headId", headId);
		setAttrs(metaData.toMap());
		setAttr("model", ZcurdTool.replaceDict(metaData, row));
		render("detailPage.html");
	}
	
	//导出csv
	public void exportCsv() {
		int headId = getHeadId();
		ZcurdMeta metaData = DbMetaTool.getMetaData(headId);
		ZcurdHead head = metaData.getHead();
		List<ZcurdField> fieldList = metaData.getFieldList();
		flushDictData(metaData);
		
		Object[] queryParams = getQueryParams();
		String[] properties = (String[]) queryParams[0];
		String[] symbols = (String[]) queryParams[1];
		Object[] values = (Object[]) queryParams[2];
		
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = head.getIdField() + " desc";
		}
		
		List<Record> list = ZcurdTool.replaceDict(headId, 
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
		
		addOpLog("[" + head.getFormName() + "] 导出cvs");
		render(csvRender);
	}
	
	/**
	 * 获得表单id
	 */
	private int getHeadId() {
		String headId = getAttr("headId");
		return Integer.parseInt(headId);
	}

	/**
	 * 刷新字典数据
	 */
	private void flushDictData(ZcurdMeta metaData) {
		for (ZcurdField zcurdField : metaData.getFieldList()) {
			String dictSql = zcurdField.getStr("dict_sql");
			if(StringUtil.isNotEmpty(dictSql)) {
				Map<String, Object> dictData = DbMetaTool.getDictData(dictSql);
				metaData.getDictMap().put(zcurdField.getStr("field_name"), dictData);
				zcurdField.put("dict", dictData);
			}
		}
	}

}
