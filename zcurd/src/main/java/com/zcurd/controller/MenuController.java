package com.zcurd.controller;

import com.zcurd.common.CommonController;
import com.zcurd.model.Menu;

public class MenuController extends CommonController {
	
	public void listAll() {
		renderJson(Menu.me.find("select * from sys_menu"));
	}

}
