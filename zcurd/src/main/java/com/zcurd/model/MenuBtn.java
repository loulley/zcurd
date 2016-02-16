package com.zcurd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class MenuBtn extends Model<MenuBtn> {
	private static final long serialVersionUID = 1L;
	public static final MenuBtn me = new MenuBtn();
	
	public List<MenuBtn> findAll() {
		return find("select * from sys_menu_btn");
	}
	
	public List<MenuBtn> findByUserId(int userId) {
		String sql = "select c.* from sys_user_role a " + 
					 "left join sys_role_btn b on a.role_id=b.role_id " + 
					 "left join sys_menu_btn c on b.btn_id=c.id " + 
				 "where a.user_id=?";
		return find(sql, userId);
	}

}
