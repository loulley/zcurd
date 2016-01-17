package com.zcurd.controller;

import java.util.List;

import com.zcurd.common.CommonController;
import com.zcurd.model.User;

public class LoginController extends CommonController {
	
	public void index() {
		render("login.html");
	}
	
	public void login() {
		List<User> list = User.me.findByMultiProperties(new String[]{"user_name", "password"}, new Object[]{getPara("user_name"), getPara("password")});
		if(list.size() > 0) {
			setSessionAttr("sysUser", list.get(0));
			renderSuccess();
		}else {
			renderFailed("用户名或密码错误！");
		}
	}
	
	public void logout() {
		removeSessionAttr("sysUser");
		redirect("/login");
	}
}
