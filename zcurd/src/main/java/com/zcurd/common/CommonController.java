package com.zcurd.common;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class CommonController extends Controller {
	
	public void renderDatagrid(Page<?> pageData) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", pageData.getList());
		datagrid.put("total", pageData.getTotalRow());
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

}
