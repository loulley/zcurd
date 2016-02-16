package com.zcurd.model;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class Menu extends Model<Menu> {
	private static final long serialVersionUID = 1L;
	public static final Menu me = new Menu();
	
	private List<Menu> subMenuList = new ArrayList<Menu>();
	
	public List<Menu> findAll() {
		return find("select * from sys_menu order by order_num asc");
	}
	
	public List<Menu> findByUserId(int userId) {
		String sql = "select c.* from sys_user_role a " + 
				"join sys_role_menu b on a.role_id=b.role_id " + 
				"join sys_menu c on b.menu_id=c.id " + 
			"where a.user_id=? order by c.order_num";
		return find(sql, userId);
	}
	
	public List<Menu> getSubMenuList() {
		return subMenuList;
	}

	public void setSubMenuList(List<Menu> subMenuList) {
		this.subMenuList = subMenuList;
	}
}
