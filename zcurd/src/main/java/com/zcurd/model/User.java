package com.zcurd.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;
import com.zcurd.common.StringUtil;
import com.zcurd.common.ZurdTool;

public class User extends Model<User> {
	private static final long serialVersionUID = 1L;
	public static final User me = new User();
	
	public Page<Map<String, Object>> paginate(Map<String, String[]> paraMap, int pageNumber, int pageSize) {
		List<Object> paras = new ArrayList<Object>();
		String sqlWhere = ZurdTool.convertParaMap2SqlWhere(paraMap, paras);
		
		String sqlFrom = " from sys_user";
		String sqllimit = " limit " + (pageNumber - 1) * pageSize + ", " + pageSize;
		String sqlOrderBy = ZurdTool.convertParaMap2SqlOrderBy(paraMap);
		if(StringUtil.isEmpty(sqlOrderBy)) {
			sqlOrderBy = " order by id desc ";
		}
		
		int rowCount = Db.queryLong("select count(*) " + sqlFrom + sqlWhere, paras.toArray()).intValue();
		List<Record> listRecord = Db.find("select * " + sqlFrom + sqlWhere + sqlOrderBy + sqllimit, paras.toArray());
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for (Record record : listRecord) {
			Map<String, Object> rowMap = record.getColumns();
			list.add(rowMap);
		}
		
		int totalPage = rowCount / pageSize;
		if(rowCount % pageSize > 0) {
			totalPage = totalPage + 1;
		}
		return new Page<Map<String, Object>>(list, pageNumber, pageSize, totalPage, rowCount);
	}
	
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
