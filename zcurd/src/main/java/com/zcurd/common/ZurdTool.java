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
	
	public static List<Map<String, Object>> listRecord2ListMap(List<Record> listRecord) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for (Record record : listRecord) {
			list.add(record.getColumns());
		}
		return list;
	}

}
