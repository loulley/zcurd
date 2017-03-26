package com.zcurd.model;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.zcurd.common.util.StringUtil;

public class MenuDatarule extends Model<MenuDatarule> {
	private static final long serialVersionUID = 1L;
	public static final MenuDatarule me = new MenuDatarule();
	
	public List<MenuDatarule> findAll() {
		return find("select * from sys_menu_datarule");
	}
	
	public List<MenuDatarule> findByUser(SysUser user) {
		List<MenuDatarule> result = new ArrayList<MenuDatarule>();
		String roles = user.getStr("roles");
		if(StringUtil.isNotEmpty(roles)) {
			result = find("select distinct b.* from sys_role_datarule a join sys_menu_datarule b on a.datarule_id=b.id where a.role_id in(" + roles + ")");
		}
		return result;
	}
	
	public String getFieldName() {
		return get("field_name");
	}
	
	public String getSymbol() {
		return get("symbol");
	}
	
	public String getValue() {
		return get("value");
	}

}
