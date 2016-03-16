package com.zcurd.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Record;
import com.zcurd.vo.ZcurdMeta;

public class ZcurdTool {
	
	/**
	 * 获得查询参数
	 */
	public static Map<String, String> getQueryPara(Map<String, String[]> paraMap) {
		Map<String, String> queryPara = new HashMap<String, String>();
		for (String paraName : paraMap.keySet()) {
			queryPara.put(paraName, paraMap.get(paraName)[0]);
		}
		return queryPara;
	}
	
	/**
	 * 获得DataGrid查询参数
	 */
	public static Map<String, String> getDataGridQueryPara(Map<String, String[]> paraMap) {
		Map<String, String> queryPara = new HashMap<String, String>();
		for (String paraName : paraMap.keySet()) {
			if(paraName.startsWith("queryParams[")) {
				String field = paraName.substring(12, paraName.length() - 1);
				String value = paraMap.get(paraName)[0];
				queryPara.put(field, value);
			}
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
	
	/**
	 * 替换成字典中的值
	 */
	public static Map<String, Object> replaceDict(Map<String, Object> dict, Map<String, Object> row, String fieldName) {
		//获取字典值（存在字典，值不为空）
		if(dict != null && row.get(fieldName) != null) {
			String fieldValue = row.get(fieldName).toString();
			Object dictValue = dict.get(fieldValue);
			if(dictValue != null) {
				row.put(fieldName, dictValue);
			}else {
				//数组情况
				if(StringUtil.isNotEmpty(fieldValue)) {
					String dictValues = "";
					for (String str : fieldValue.split(",")) {
						dictValues += "," + dict.get(str);
					}
					row.put(fieldName, dictValues.replaceAll("^,", ""));
				}
			}
		}
		return row;
	}
	
	/**
	 * 替换成字典中的值
	 */
	public static Map<String, Object> replaceDict(int headId, Map<String, Object> row) {
		ZcurdMeta mapmeta = DbMetaTool.getMetaData(headId);
		Map<String, Map<String, Object>> dictMap = mapmeta.getDictMap();
		
		for (String fieldName : dictMap.keySet()) {
			Map<String, Object> dict = (Map<String, Object>) dictMap.get(fieldName);
			//替换成字典中的值
			ZcurdTool.replaceDict(dict, row, fieldName);
		}
		return row;
	}
	
	/**
	 * 替换成字典中的值
	 */
	public static List<Map<String, Object>> replaceDict(int headId, List<Record> list) {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		for (Record record : list) {
			result.add(replaceDict(headId, record.getColumns()));
		}
		return result;
	}
	
	public static Map<String, Object> convert2Map(ZcurdMeta zcurdMeta) {
		Map<String, Object> metaData = new HashMap<String, Object>();
		metaData.put("head", zcurdMeta.getHead());
		metaData.put("fieldList", zcurdMeta.getFieldList());
		metaData.put("dictMap", zcurdMeta.getDictMap());
		metaData.put("addFieldList", zcurdMeta.getAddFieldList());
		metaData.put("updateFieldList", zcurdMeta.getUpdateFieldList());
		metaData.put("btnList", zcurdMeta.getBtnList());
		metaData.put("topList", zcurdMeta.getTopList());
		metaData.put("lineList", zcurdMeta.getLineList());
		metaData.put("jsList", zcurdMeta.getJsList());
		return metaData;
	}
	
	/**
	 * 获得数据源名称
	 */
	public static String getDbSource(String dbSource) {
		if(StringUtil.isEmpty(dbSource)) {
			dbSource = "zcurd";
		}
		return dbSource;
	}

}
