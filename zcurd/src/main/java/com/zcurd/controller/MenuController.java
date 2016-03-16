package com.zcurd.controller;

import com.zcurd.model.Menu;

public class MenuController extends CommonController {
	
	public void listAll() {
		renderJson(Menu.me.findAll());
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
