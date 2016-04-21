package com.zcurd.controller;

import com.zcurd.common.DBTool;
import com.zcurd.common.StringUtil;

/**
 * 用来存放一些公共地址（无权限控制）的controller
 * @author 钟世云 2016.3.22
 */
public class CommonController extends BaseController {
	
	//获得字典数据
	public void getDictData() {
		Object[] queryParams = getQueryParams();
		String[] properties = (String[]) queryParams[0];
		String[] symbols = (String[]) queryParams[1];
		Object[] values = (Object[]) queryParams[2];
		
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = "id desc";
		}
		
		renderJson(DBTool.findByMultProperties("sys_dict", properties, symbols, values));
	}	
	
	//图标页面
	public void iconsPage() {
		render("common/icons.html");
	}

}
