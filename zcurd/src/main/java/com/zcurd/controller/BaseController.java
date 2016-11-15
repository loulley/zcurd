package com.zcurd.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.zcurd.common.Pager;
import com.zcurd.model.MenuDatarule;
import com.zcurd.model.SysOplog;
import com.zcurd.model.SysUser;

public class BaseController extends Controller {
	
	protected void renderDatagrid(Page<?> pageData) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", pageData.getList());
		datagrid.put("total", pageData.getTotalRow());
		renderJson(datagrid);
	}
	
	protected void renderDatagrid(List<?> list, int total) {
		renderDatagrid(list, total, null);
	}
	
	protected void renderDatagrid(List<?> list, int total, List<Map<String, Object>> footer) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", list);
		datagrid.put("total", total);
		if(footer != null && footer.size() > 0) {
			datagrid.put("footer", footer);
		}
		renderJson(datagrid);
	}
	
	protected void renderDatagrid(List<Record> list) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", list);
		renderJson(datagrid);
	}
	
	protected void renderSuccess(String msg) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "success");
		result.put("msg", msg);
		renderJson(result);
	}
	
	protected void renderSuccess() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "success");
		renderJson(result);
	}
	
	protected void renderFailed(String msg) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "fail");
		result.put("msg", msg);
		renderJson(result);
	}
	
	protected void renderFailed() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "fail");
		renderJson(result);
	}
	
	protected SysUser getSessionUser() {
		return getSessionAttr("sysUser");
	}
	
	protected Pager getPager() {
		Pager pager = new Pager();
		pager.setPage(getParaToInt("page", 0));
		pager.setRows(getParaToInt("rows", 0));
		return pager;
	}
	
	protected Object[] getQueryParams() {
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
	
	protected String getOrderBy() {
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

	/**
	 * 增加操作日志
	 * @param opContent 操作内容
	 */
	protected void addOpLog(String opContent) {
		SysOplog.me
			.remove("id")
			.set("user_id", getSessionUser().get("id"))
			.set("op_content", opContent)
			.set("ip", getRemoteAddress())
			.set("create_time", new Date())
			.save();
	}
	
	/**
	 * 获得ip地址
	 */
	protected String getRemoteAddress() {
		String ip = getRequest().getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = getRequest().getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = getRequest().getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = getRequest().getRemoteAddr();
		}
		return ip;
	}
}
