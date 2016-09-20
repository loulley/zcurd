package com.zcurd.controller;

import com.zcurd.model.User;

public class UserController extends BaseController {
	
	public void listPage() {
		render("list.html");
	}
	
	public void listData() {
		renderDatagrid(User.me.paginate(getParaMap(), getParaToInt("page", 1), getParaToInt("rows", 10)));
	}

	public void addPage() {
		render("add.html");
	}
	
	public void add() {
		getModel(User.class, "model").save();
	}
	
	public void updatePage() {
		setAttr("model", User.me.findById(getParaToInt("id")));
		render("update.html");
	}
	
	public void update() {
		User.me.findById(getParaToInt("id"))
			.put(getModel(User.class, "model")).update();
	}
	
	public void delete() {
		for (Integer id : getParaValuesToInt("id[]")) {
			User.me.deleteById(id);
		}
	}
}
