package com.zcurd.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Record;

public class ZurdTool {
	
	/**
	 * 获得查询参数
	 */
	public static Map<String, String> getQueryPara(Map<String, String[]> paraMap) {
		Map<String, String> queryPara = new HashMap<String, String>();
		for (String paraName : paraMap.keySet()) {
			/*if(paraName.startsWith("queryParams[")) {
				String field = paraName.substring(12, paraName.length() - 1);
				String value = paraMap.get(paraName)[0];
				queryPara.put(field, value);
			}*/
			queryPara.put(paraName, paraMap.get(paraName)[0]);
		}
		return queryPara;
	}
	
	/**
	 * 转换参数map为sql语句where部分
	 * @param paraMap
	 * @param paras 用于存放参数，一般为List<Object> paras = new ArrayList<Object>();
	 * @return sqlWhere
	 */
	public static String convertParaMap2SqlWhere(Map<String, String[]> paraMap, List<Object> paras) {
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
	
	public static String convertParaMap2SqlOrderBy(Map<String, String[]> paraMap) {
		String sqlOrderBy = null;
		if(paraMap.get("sort") != null && paraMap.get("sort").length > 0) {
			String[] sort = paraMap.get("sort")[0].split(",");
			String[] order = paraMap.get("order")[0].split(",");
			sqlOrderBy = " order by " + sort[0] + " " + order[0];
			for (int i = 1; i < sort.length; i++) {
				sqlOrderBy += ", " + sort[i] + " " + order[i];
			}
		}
		return sqlOrderBy;
	}
	
	public static List<Map<String, Object>> listRecord2ListMap(List<Record> listRecord) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for (Record record : listRecord) {
			list.add(record.getColumns());
		}
		return list;
	}

}
