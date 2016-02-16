package com.zcurd.controller;

import com.jfinal.core.Controller;
import com.zcurd.model.Menu;

/**
 * 角色权限
 * @author 钟世云 2016.2.5
 */
public class RoleController extends Controller {
	
	
	
	//编辑权限页面
	public void editAuthPage() {
		render("editAuth.html");
	}
	
	//所有菜单
	public void getAllMenu() {
		renderJson(Menu.me.findAll());
	}

}
