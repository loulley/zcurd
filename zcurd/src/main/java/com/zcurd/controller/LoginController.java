package com.zcurd.controller;

import java.util.List;

import com.jfinal.aop.Duang;
import com.zcurd.model.Menu;
import com.zcurd.model.SysUser;
import com.zcurd.service.LoginService;

/**
 * 登陆
 * @author 钟世云 2016.2.5
 */
public class LoginController extends BaseController {
	
	public void index() {
		render("login.html");
	}
	
	public void getMenu() {
		//admin用户拥有所有页面
		if("admin".equals(getSessionUser().get("user_name"))) {
			renderJson(Menu.me.findAll());
		}else {
			renderJson(getSessionAttr("menuList"));
		}
	}
	
	public void login() {
		LoginService loginService = Duang.duang(LoginService.class);
		List<SysUser> list = SysUser.me.findByMultiProperties(new String[]{"user_name", "password"}, 
				new Object[]{getPara("user_name"), getPara("password")});
		if(list.size() > 0) {
			setSessionAttr("sysUser", list.get(0));
			//用户菜单
			setSessionAttr("menuList", loginService.getUserMenu(getSessionUser()));
			//页面权限
			List<String> noAuthUrl = loginService.getNoAuthUrl();
			setSessionAttr("noAuthUrl", noAuthUrl);
			//按钮权限
			setSessionAttr("noAuthBtnUrl", loginService.getNoAuthBtnUrl(getSessionUser()));
			//数据权限
			setSessionAttr("noAuthDatarule", loginService.getNoAuthDatarule(getSessionUser()));
			if("admin".equals(getSessionUser().get("user_name"))) {
				setSessionAttr("noAuthUrl", null);
				setSessionAttr("noAuthBtnUrl", null);
				setSessionAttr("pageBtnMap", null);
				setSessionAttr("noAuthDatarule", null);
			}
			addOpLog("登陆系统");
			renderSuccess();
		}else {
			renderFailed("用户名或密码错误！");
		}
	}
	
	public void logout() {
		addOpLog("退出系统");
		removeSessionAttr("sysUser");
		redirect("/login");
	}
}
