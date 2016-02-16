package com.zcurd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.zcurd.common.CommonController;
import com.zcurd.model.Menu;
import com.zcurd.service.RoleService;

/**
 * 角色权限
 * @author 钟世云 2016.2.5
 */
public class RoleController extends CommonController {
	
	//编辑权限页面
	public void editAuthPage() {
		int roleId = getParaToInt("roleId");
		setAttr("roleId", roleId);
		List<Record> btnIds = Db.find("select b.menu_id, b.id from sys_role_btn a join sys_menu_btn b on a.btn_id=b.id where role_id=?", roleId);
		setAttr("btnIds", btnIds);
		render("editAuth.html");
	}
	
	//编辑权限
	public void editAuth() {
		String menuIds = getPara("menuIds");
		String btnIds = getPara("btnIds");
		int roleId = getParaToInt("roleId");
		RoleService roleService = Duang.duang(RoleService.class);
		roleService.saveAuth(menuIds, btnIds, roleId);
		renderSuccess();
	}
	
	//所有菜单
	public void getAllMenu() {
		int roleId = getParaToInt("roleId", 0);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("menuIds", Db.find("select * from sys_role_menu where role_id=?", roleId));
		result.put("menuList", Menu.me.findAll());
		renderJson(result);
	}
}
