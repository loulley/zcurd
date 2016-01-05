package com.zcurd.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class ZcurdHead extends Model<ZcurdHead> {
	private static final long serialVersionUID = 1L;
	public static final ZcurdHead me = new ZcurdHead();
	
	public Page<ZcurdHead> paginate(Map<String, String[]> paraMap, int pageNumber, int pageSize) {
		List<Object> paras = new ArrayList<Object>();
		String where = convertParaMap2SqlWhere(paraMap, paras);
		String orderBy = " order by id desc";
		
		return paginate(pageNumber, pageSize, "select *", "from zcurd_head " + where + orderBy, paras.toArray());
	}
	
	/**
	 * 转换参数map为sql语句where部分
	 * @param paraMap
	 * @param paras 用于存放参数，一般为List<Object> paras = new ArrayList<Object>();
	 * @return sqlWhere
	 */
	public String convertParaMap2SqlWhere(Map<String, String[]> paraMap, List<Object> paras) {
		StringBuilder sb = new StringBuilder(" where 1=1");
		for (String paraName : paraMap.keySet()) {
			if(paraName.startsWith("queryParams[")) {
				String field = paraName.substring(12, paraName.length() - 1);
				String value = paraMap.get(paraName)[0];
				String symbols = "=";
				
				//处理范围参数
				if(field.startsWith("_start_")) {
					field = field.replaceAll("^_start_", "");
					symbols = ">=";
				}else if(field.startsWith("_end_")) {
					field = field.replaceAll("^_end_", "");
					symbols = "<=";
				}
				
				sb.append(" and " + field + "" + symbols + "?");
				paras.add(value);
			}
		}
		return sb.toString();
	}
	
}
