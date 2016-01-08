package com.zcurd.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Record;

public class ZurdTool {
	
	public static List<Map<String, Object>> listRecord2ListMap(List<Record> listRecord) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for (Record record : listRecord) {
			list.add(record.getColumns());
		}
		return list;
	}

}
