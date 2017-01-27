package com.zcurd.controller;

import com.jfinal.plugin.activerecord.Db;
import com.zcurd.common.util.PasswordUtil;
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
		
		if(!model.getStr("password").equals(PasswordUtil.encodePassword(getPara("model.old_password")))) {
			renderFailed("原始密码输入错误");
			return;
		}
		
		model.set("password", PasswordUtil.encodePassword(getPara("model.password")));
		model.update();
		addOpLog("[用户行为] 修改密码");
		renderSuccess();
	}
	
	//重置密码
	public void resetPassword() {
		Db.update("update sys_user set password='" + PasswordUtil.encodePassword(PasswordUtil.defaultPassword) + "' where id=" + getParaToInt("id"));
		addOpLog("[系统用户] 重置密码");
		renderSuccess();
	}
}
