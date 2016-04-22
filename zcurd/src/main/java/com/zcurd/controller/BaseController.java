package com.zcurd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.zcurd.common.Pager;
import com.zcurd.model.MenuDatarule;
import com.zcurd.model.User;

public class BaseController extends Controller {
	
	public void renderDatagrid(Page<?> pageData) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", pageData.getList());
		datagrid.put("total", pageData.getTotalRow());
		renderJson(datagrid);
	}
	
	public void renderDatagrid(List<Map<String, Object>> list, int total) {
		renderDatagrid(list, total, null);
	}
	
	public void renderDatagrid(List<Map<String, Object>> list, int total, List<Map<String, Object>> footer) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", list);
		datagrid.put("total", total);
		if(footer != null && footer.size() > 0) {
			datagrid.put("footer", footer);
		}
		renderJson(datagrid);
	}
	
	public void renderDatagrid(List<Record> list) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", list);
		renderJson(datagrid);
	}
	
	public void renderSuccess(String msg) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "success");
		result.put("msg", msg);
		renderJson(result);
	}
	
	public void renderSuccess() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "success");
		renderJson(result);
	}
	
	public void renderFailed(String msg) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "fail");
		result.put("msg", msg);
		renderJson(result);
	}
	
	public void renderFailed() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "fail");
		renderJson(result);
	}
	
	public User getSessionUser() {
		return getSessionAttr("sysUser");
	}
	
	public Pager getPager() {
		Pager pager = new Pager();
		pager.setPage(getParaToInt("page", 0));
		pager.setRows(getParaToInt("rows", 0));
		return pager;
	}
	
	public Object[] getQueryParams() {
		List<String> properties = new ArrayList<String>();
		List<String> symbols = new ArrayList<String>();
		List<Object> values = new ArrayList<Object>();
		
		Map<String, String[]> paraMap = getParaMap();
		for (String paraName : paraMap.keySet()) {
			String prefix = "queryParams[";
			if(paraName.startsWith(prefix)) {
				String field = paraName.substring(prefix.length(), paraName.length() - 1);
				String symbol = "=";
				String value = paraMap.get(paraName)[0];
				
				//处理范围参数
				if(field.startsWith("_start_")) {
					field = field.replaceAll("^_start_", "");
					symbol = ">=";
				}else if(field.startsWith("_end_")) {
					field = field.replaceAll("^_end_", "");
					symbol = "<=";
				}
				
				//模糊搜索处理
				if(value.startsWith("*") && value.endsWith("*")) {
					value = "%" + value.substring(1, value.length() - 1) + "%";
					symbol = "like";
				}else if(value.startsWith("*")) {
					value = "%" + value.substring(1);
					symbol = "like";
				}else if(value.endsWith("*")) {
					value = value.substring(0, value.length() - 1) + "%";
					symbol = "like";
				}
				
				properties.add(field);
				symbols.add(symbol);
				values.add(value);
			}
		}
		//数据权限处理
		if(getAttr("menuDataruleList") != null) {
			List<MenuDatarule> menuDataruleList = getAttr("menuDataruleList");
			for (MenuDatarule menuDatarule : menuDataruleList) {
				properties.add(menuDatarule.getFieldName());
				symbols.add(menuDatarule.getSymbol());
				values.add(menuDatarule.getValue());
			}
		}
		return new Object[]{properties.toArray(new String[]{}), symbols.toArray(new String[]{}), values.toArray(new Object[]{})};
	}
	
	public String getOrderBy() {
		String sqlOrderBy = ""; 
		Map<String, String[]> paraMap = getParaMap();
		if(paraMap.get("sort") != null && paraMap.get("sort").length > 0) {
			String[] sort = paraMap.get("sort")[0].split(",");
			String[] order = paraMap.get("order")[0].split(",");
			sqlOrderBy = sort[0] + " " + order[0];
			for (int i = 1; i < sort.length; i++) {
				sqlOrderBy += ", " + sort[i] + " " + order[i];
			}
		}
		return sqlOrderBy;
	}

}
