package com.zcurd.model;

import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;
import com.zcurd.common.DbMetaTool;

public class SysUser extends Model<SysUser> {
	private static final long serialVersionUID = 1L;
	public static final SysUser me = new SysUser();
	
	public List<SysUser> findByMultiProperties(String[] properties, Object[] values) {
		StringBuffer sql = new StringBuffer("select * from " + getTable().getName() + " where 1=1");
		if(properties != null) {
			for (String property : properties) {
				sql.append(" and " + property + "=?");
			}
		}
		if(values == null) {
			values = new Object[]{};
		}
		return find(sql.toString(), values);
	}
	
	private Table getTable() {
		return TableMapping.me().getTable(getUsefulClass());
	}
	
	public Map<String, Object> getDictDataroles() {
		return DbMetaTool.getDictData("select id, role_name from sys_role");
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Class<? extends Model> getUsefulClass() {
		Class c = getClass();
		return c.getName().indexOf("EnhancerByCGLIB") == -1 ? c : c.getSuperclass();	// com.demo.blog.Blog$$EnhancerByCGLIB$$69a17158
	}
}
