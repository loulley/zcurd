package com.zcurd.controller;

import com.zcurd.common.CommonController;
import com.zcurd.model.Menu;

public class MenuController extends CommonController {
	
	public void listAll() {
		renderJson(Menu.me.find("select * from sys_menu"));
	}

	public void list() {
		render("list.html");
	}
	
	public void addPage() {
		render("add.html");
	}
	
	public void add() {
		if(getModel(Menu.class, "model").save()) {
			renderSuccess();
		}else {
			renderFailed();
		}
	}
	
	public void updatePage() {
		setAttr("model", Menu.me.findById(getParaToInt("id")));
		render("update.html");
	}
	
	public void update() {
		if(getModel(Menu.class, "model").update()) {
			renderSuccess();
		}else {
			renderFailed();
		}
	}
	
	public void delete() {
		Integer[] ids = getParaValuesToInt("id[]");
		for (Integer id : ids) {
			Menu.me.deleteById(id);
		}
		renderSuccess();
	}
}
