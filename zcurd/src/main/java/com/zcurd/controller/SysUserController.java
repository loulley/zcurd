package com.zcurd.controller;

import com.zcurd.controller.BaseController;
import com.zcurd.model.SysUser;

/**
 * 用户管理
 */
public class SysUserController extends BaseController {
	
	//修改密码页面
	public void updatePasswordPage() {
		setAttr("dictDataroles", SysUser.me.getDictDataroles());
		setAttr("model", SysUser.me.findById(getSessionUser().get("id")));
		render("updatePassword.html");
	}
	
	//修改密码
	public void updatePassword() {
		SysUser model = SysUser.me.findById(getSessionUser().get("id"));
		
		if(!model.getStr("password").equals(getPara("model.old_password"))) {
			renderFailed("原始密码输入错误");
			return;
		}
		
		model.set("password", getPara("model.password"));
		model.update();
		addOpLog("[用户行为] 修改密码");
		renderSuccess();
	}
}
