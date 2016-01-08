package com.zcurd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.zcurd.common.StringUtil;
import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;

public class ZcurdService {
	
	public Page<Map<String, Object>> find(int headId, Map<String, String[]> paraMap, int pageNumber, int pageSize) {
		Map<String, Object> mapmeta = getMetaData(headId);
		ZcurdHead head = (ZcurdHead) mapmeta.get("head");
		@SuppressWarnings("unchecked")
		Map<String, Map<String, Object>> dictMap = (Map<String, Map<String, Object>>) mapmeta.get("dictMap");
		//System.out.println(dictMap);
		
		List<Object> paras = new ArrayList<Object>();
		String sqlWhere = convertParaMap2SqlWhere(paraMap, paras);
		
		String sqlFrom = " from " + head.getStr("table_name");
		String sqllimit = " limit " + (pageNumber - 1) * pageSize + ", " + pageSize;
		
		int rowCount = Db.queryLong("select count(*) " + sqlFrom + sqlWhere, paras.toArray()).intValue();
		List<Record> listRecord = Db.find("select * " + sqlFrom + sqlWhere + " order by " + head.getStr("id_field") + " desc " + sqllimit, paras.toArray());
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for (Record record : listRecord) {
			Map<String, Object> rowMap = record.getColumns();
			for (String fieldName : rowMap.keySet()) {
				Map<String, Object> dict = (Map<String, Object>) dictMap.get(fieldName);
				//获取字典值（存在字典，值不为空）
				if(dict != null && rowMap.get(fieldName) != null) {
					Object dictValue = dict.get(rowMap.get(fieldName).toString());
					if(dictValue != null) {
						rowMap.put(fieldName, dictValue);
					}
				}
			}
			list.add(rowMap);
		}
		
		int totalPage = rowCount / pageSize;
		if(rowCount % pageSize > 0) {
			totalPage = totalPage + 1;
		}
		return new Page<Map<String, Object>>(list, pageNumber, pageSize, totalPage, rowCount);
	}
	
	public void add(int headId, Map<String, String[]> paraMap) {
		Map<String, Object> mapmeta = getMetaData(headId);
		ZcurdHead head = (ZcurdHead) mapmeta.get("head");
		
		String sql = "insert into " + head.getStr("table_name") + " (";
		String sqlValues = "(";
		List<Object> param = new ArrayList<Object>();
		for (String fieldName : paraMap.keySet()) {
			if(fieldName.indexOf("model.") >= 0) {
				param.add(paraMap.get(fieldName)[0]);
				sql += fieldName.replace("model.", "") + ", ";
				sqlValues += "?, ";
			}
		}
		sql = sql.replaceAll(", $", "") + ")";
		sql += " values " + sqlValues.replaceAll(", $", ")");
		System.out.println(sql);
		Db.update(sql, param.toArray());
	}
	
	public void update(int headId, int id, Map<String, String[]> paraMap) {
		Map<String, Object> mapmeta = getMetaData(headId);
		ZcurdHead head = (ZcurdHead) mapmeta.get("head");
		List<ZcurdField> addFieldList = (List<ZcurdField>) mapmeta.get("addFieldList");

		Record record = get(headId, id);
		for (ZcurdField field : addFieldList) {
			String[] paramValues = paraMap.get("model." + field.getStr("field_name"));
			record.set(field.getStr("field_name"), paramValues == null ? null : paramValues[0]);
		}
		Db.update(head.getStr("table_name"), head.getStr("id_field"), record);
	}
	
	public void delete(int headId, Integer[] ids) {
		Map<String, Object> mapmeta = getMetaData(headId);
		ZcurdHead head = (ZcurdHead) mapmeta.get("head");
		
		for (Integer id : ids) {
			Db.deleteById(head.getStr("table_name"), head.getStr("id_field"), id);
		}
	}
	
	
	
	
	public Record get(int headId, int id) {
		Map<String, Object> mapmeta = getMetaData(headId);
		ZcurdHead head = (ZcurdHead) mapmeta.get("head");
		
		Record record = Db.findById(head.getStr("table_name"), head.getStr("id_field"), id);
		return record;
	}
	
	public Map<String, Object> getDictData(String dictSql) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Record> listRecord = Db.find("select 'key', 'text' union all " + dictSql);
		for (int i = 1; i < listRecord.size(); i++) {
			Record record = listRecord.get(i);
			map.put(record.getStr("key"), record.getStr("text"));
		}
		return map;
	}
	
	public Map<String, Object> getMetaData(int headId) {
		ZcurdHead head = ZcurdHead.me.findById(headId);
		List<ZcurdField> fieldList = ZcurdField.me.findByHeadId(head.getLong("id").intValue());
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Map<String, Object>> dictMap = new HashMap<String, Map<String, Object>>();
		for (ZcurdField zcurdField : fieldList) {
			if(StringUtil.isNotEmpty(zcurdField.getStr("dict_sql"))) {
				dictMap.put(zcurdField.getStr("field_name"), getDictData(zcurdField.getStr("dict_sql")));
				zcurdField.put("dict", getDictData(zcurdField.getStr("dict_sql")));
			}
		}
		List<ZcurdField> addFieldList = new ArrayList<ZcurdField>();
		List<ZcurdField> updateFieldList = new ArrayList<ZcurdField>();
		for (ZcurdField zcurdField : fieldList) {
			if(!zcurdField.getStr("field_name").equals(head.getStr("id_field"))) {
				if(zcurdField.getInt("is_allow_add") == 1) {
					addFieldList.add(zcurdField);
				}
				if(zcurdField.getInt("is_allow_update") == 1) {
					updateFieldList.add(zcurdField);
				}
			}
		}
		map.put("head", head);
		map.put("fieldList", fieldList);
		map.put("dictMap", dictMap);
		map.put("addFieldList", addFieldList);
		map.put("updateFieldList", updateFieldList);
		return map;
	}
	
	public ZcurdHead getHead(int headId) {
		return ZcurdHead.me.findById(headId);
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
	
	public void genForm(String tableName) {
		String sqlHead = "select * from information_schema.TABLES a where a.TABLE_SCHEMA='zcurd' and a.table_name=?";
		Record dbHead = Db.findFirst(sqlHead, new String[]{tableName});
		ZcurdHead head = new ZcurdHead().set("table_name", dbHead.getStr("TABLE_NAME")).set("form_name", dbHead.getStr("TABLE_COMMENT"));
		if(StringUtil.isEmpty(head.getStr("form_name"))) {
			head.set("form_name", head.getStr("table_name"));
		}
		head.save();
		
		String sql = "select * from information_schema.columns a where a.`TABLE_SCHEMA`='zcurd' and a.table_name=?";
		List<Record> fieldList = Db.find(sql, new String[]{tableName});
		for (Record record : fieldList) {
			String column_name = record.getStr("COLUMN_COMMENT");
			if(StringUtil.isEmpty(column_name)) {
				column_name = record.getStr("COLUMN_NAME");
			}
			//主键
			if("PRI".equals(record.getStr("COLUMN_KEY"))) {
				head.set("id_field", record.getStr("COLUMN_NAME")).update();
			}
			new ZcurdField()
				.set("head_id", head.getLong("id").intValue())
				.set("field_name", record.getStr("COLUMN_NAME"))
				.set("column_name", column_name)
				.set("data_type", record.getStr("DATA_TYPE"))
				.save();
		}
	}

}
