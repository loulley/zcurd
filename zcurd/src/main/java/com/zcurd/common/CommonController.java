package com.zcurd.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.zcurd.model.User;

public class CommonController extends Controller {
	
	public void renderDatagrid(Page<?> pageData) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", pageData.getList());
		datagrid.put("total", pageData.getTotalRow());
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

}
