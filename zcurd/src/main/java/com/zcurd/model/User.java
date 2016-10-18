package com.zcurd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

public class User extends Model<User> {
	private static final long serialVersionUID = 1L;
	public static final User me = new User();
	
	public List<User> findByMultiProperties(String[] properties, Object[] values) {
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
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Class<? extends Model> getUsefulClass() {
		Class c = getClass();
		return c.getName().indexOf("EnhancerByCGLIB") == -1 ? c : c.getSuperclass();	// com.demo.blog.Blog$$EnhancerByCGLIB$$69a17158
	}
}
