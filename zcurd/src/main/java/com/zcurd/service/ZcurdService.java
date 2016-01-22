package com.zcurd.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.ICallback;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.zcurd.common.StringUtil;
import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;
import com.zcurd.model.ZcurdHeadBtn;
import com.zcurd.model.ZcurdHeadJs;

public class ZcurdService {
	
	public Page<Map<String, Object>> find(int headId, Map<String, String[]> paraMap, int pageNumber, int pageSize) {
		Map<String, Object> mapmeta = getMetaData(headId);
		ZcurdHead head = (ZcurdHead) mapmeta.get("head");
		@SuppressWarnings("unchecked")
		Map<String, Map<String, Object>> dictMap = (Map<String, Map<String, Object>>) mapmeta.get("dictMap");
		
		List<Object> paras = new ArrayList<Object>();
		String sqlWhere = convertParaMap2SqlWhere(paraMap, paras);
		
		String sqlFrom = " from " + head.getStr("table_name");
		String sqllimit = " limit " + (pageNumber - 1) * pageSize + ", " + pageSize;
		String sqlOrderBy = " order by " + head.getStr("id_field") + " desc ";
		
		if(paraMap.get("sort") != null && paraMap.get("sort").length > 0) {
			String[] sort = paraMap.get("sort")[0].split(",");
			String[] order = paraMap.get("order")[0].split(",");
			sqlOrderBy = " order by " + sort[0] + " " + order[0];
			for (int i = 1; i < sort.length; i++) {
				sqlOrderBy += ", " + sort[i] + " " + order[i];
			}
		}
		
		int rowCount = Db.queryLong("select count(*) " + sqlFrom + sqlWhere, paras.toArray()).intValue();
		List<Record> listRecord = Db.find("select * " + sqlFrom + sqlWhere + sqlOrderBy + sqllimit, paras.toArray());
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
		List<Record> listRecord = Db.find("select 'key', 'text' union all select * from (" + dictSql + ") a");
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
		List<ZcurdHeadBtn> btnList = ZcurdHeadBtn.me.findByHeadId(headId);
		List<ZcurdHeadBtn> topList = new ArrayList<ZcurdHeadBtn>(); 
		List<ZcurdHeadBtn> lineList = new ArrayList<ZcurdHeadBtn>(); 
		for (ZcurdHeadBtn btn : btnList) {
			if(btn.getInt("location") == 1) {
				topList.add(btn);
			}else if(btn.getInt("location") == 2) {
				lineList.add(btn);
			}
		}
		for (ZcurdHeadBtn btn : btnList) {
			if(btn.getInt("action") == 1) {
				head.set("form_type", 2); //设置表单类型为主从
				break;
			}
		}
		List<ZcurdHeadJs> jsList = ZcurdHeadJs.me.findByHeadId(headId);
		
		map.put("head", head);
		map.put("fieldList", fieldList);
		map.put("dictMap", dictMap);
		map.put("addFieldList", addFieldList);
		map.put("updateFieldList", updateFieldList);
		map.put("btnList", btnList);
		map.put("topList", topList);
		map.put("lineList", lineList);
		map.put("jsList", jsList);
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
	
	/**
	 * jdbc方式获取结构信息（关系数据库通用）。有个问题，获取不到表的注释
	 */
	public void genFormByMetaData(final String tableName) {
		Db.execute(new ICallback() {
			@Override
			public Object call(Connection conn) throws SQLException {
				DatabaseMetaData metaData = conn.getMetaData();
				System.out.println(conn.getCatalog());
				ResultSet tableRet = metaData.getTables(null, "%", tableName, new String[]{"TABLE"}); 
				while (tableRet.next())
					System.out.println(tableRet.getString("REMARKS"));

				String columnName;
				String columnType;
				ResultSet colRet = metaData.getColumns(null, "%", tableName, "%");
				while (colRet.next()) {
					columnName = colRet.getString("COLUMN_NAME");
					columnType = colRet.getString("TYPE_NAME");
					int datasize = colRet.getInt("COLUMN_SIZE");
					int digits = colRet.getInt("DECIMAL_DIGITS");
					int nullable = colRet.getInt("NULLABLE");
					System.out.println(columnName + " " + columnType + " "
							+ datasize + " " + digits + " " + nullable + " " + colRet.getString("REMARKS"));
				}
				
				ResultSet pkRSet = metaData.getPrimaryKeys(null, null, tableName);
				while (pkRSet.next()) {
					System.err.println("****** Comment ******");
					System.err.println("TABLE_CAT : " + pkRSet.getObject(1));
					System.err.println("TABLE_SCHEM: " + pkRSet.getObject(2));
					System.err.println("TABLE_NAME : " + pkRSet.getObject(3));
					System.err.println("COLUMN_NAME: " + pkRSet.getObject(4));
					System.err.println("KEY_SEQ : " + pkRSet.getObject(5));
					System.err.println("PK_NAME : " + pkRSet.getObject(6));
					System.err.println("****** ******* ******");
				}
				
				ZcurdHead head = new ZcurdHead();
				head.set("table_name", tableName);
				
				return null;
			}
		});
	}
	
	public void genForm(String tableName) {
		String sqlHead = "select * from information_schema.TABLES a where a.TABLE_SCHEMA='zcurd' and a.table_name=?";
		Record dbHead = Db.findFirst(sqlHead, new String[]{tableName});
		ZcurdHead head = new ZcurdHead().set("table_name", dbHead.getStr("TABLE_NAME")).set("form_name", dbHead.getStr("TABLE_COMMENT"));
		if(StringUtil.isEmpty(head.getStr("form_name"))) {
			head.set("form_name", head.getStr("table_name"));
		}
		head.save();
		
		String dbName = (String) Db.execute(new ICallback() {
			@Override
			public Object call(Connection conn) throws SQLException {
				return conn.getCatalog();
			}
		});
		String sql = "select * from information_schema.columns a where a.TABLE_SCHEMA=? and a.table_name=?";
		List<Record> fieldList = Db.find(sql, new String[]{dbName, tableName});
		for (Record record : fieldList) {
			String column_name = record.getStr("COLUMN_COMMENT");
			if(StringUtil.isEmpty(column_name)) {
				column_name = record.getStr("COLUMN_NAME");
			}
			//主键
			if("PRI".equals(record.getStr("COLUMN_KEY"))) {
				head.set("id_field", record.getStr("COLUMN_NAME")).update();
			}
			ZcurdField field = new ZcurdField()
				.set("head_id", head.getLong("id").intValue())
				.set("field_name", record.getStr("COLUMN_NAME"))
				.set("column_name", column_name)
				.set("data_type", record.getStr("DATA_TYPE"));
			//不允许为空
			if("NO".equals(record.getStr("IS_NULLABLE"))) {
				field.set("is_allow_null", 0);
			}
			field.save();
		}
	}

}
