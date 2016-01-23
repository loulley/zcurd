package com.zcurd.controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.ICallback;
import com.jfinal.plugin.activerecord.Page;
import com.zcurd.common.CommonController;
import com.zcurd.common.DbMetaTool;
import com.zcurd.common.ZurdTool;
import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;
import com.zcurd.service.ZcurdService;

public class ZcurdHeadController extends CommonController {
	
	//主页
	public void main() {
		render("main.html");
	}
	
	//表单列表
	public void list() {
		render("head/list.html");
	}
	
	//列表页面数据
	public void listData() {
		Map<String, String[]> paraMap = getParaMap();
		renderDatagrid(ZcurdHead.me.paginate(paraMap, getParaToInt("page", 1), getParaToInt("rows", 10)));
	}

	//修改页面
	public void updatePage() {
		setAttr("model", ZcurdHead.me.findById(getParaToInt("id")));
		render("head/update.html");
	}
	
	//修改
	public void update() {
		final String fields = getPara("rowsStr");
		final JSONArray jsonObjs = JSONObject.parseArray(fields);
		Db.tx(new IAtom(){
			@SuppressWarnings("unchecked")
			public boolean run() throws SQLException {
				ZcurdHead zcurdHead = getModel(ZcurdHead.class, "model");
				zcurdHead.update();
				final Long headId = zcurdHead.getLong("id");
				Db.update("delete from zcurd_field where head_id=" + headId);
				if(jsonObjs.size() > 0) {
					for (Object object : jsonObjs) {
						ZcurdField field = new ZcurdField();
						field.set("head_id", headId);
						field.setAttrs((Map<String, Object>)object);
						field.save();
					}
				}
				DbMetaTool.updateMetaData(headId.intValue());
				return true; 
			}
		});
		renderSuccess("保存成功！");
	}
	
	//生成表单页面
	public void genFormPage() {
		render("head/genForm.html");
	}
	
	//生成表单页面
	public void genFormData() {
		String dbName = (String) Db.execute(new ICallback() {
			@Override
			public Object call(Connection conn) throws SQLException {
				return conn.getCatalog();
			}
		});
		String sql = "select TABLE_SCHEMA, TABLE_TYPE, a.TABLE_NAME, TABLE_COMMENT, CREATE_TIME, ifnull(formCount, 0) as 'formCount' from information_schema.TABLES a left join (" +
						"select table_name, count(*) as 'formCount' from zcurd_head group by table_name " + 
					 ") b on a.table_name=b.table_name where a.TABLE_SCHEMA='" + dbName + "' order by formCount";
		renderDatagrid(Db.find(sql));
	}
	
	//生成表单
	public void genForm() {
		String tableName = getPara("tableName");
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.genForm(tableName);
		renderSuccess();
	}
	
	//删除
	public void delete() {
		Integer[] ids = getParaValuesToInt("id[]");
		for (Integer id : ids) {
			ZcurdHead.me.deleteById(id);
			Db.update("delete from zcurd_field where head_id=?", id);
			DbMetaTool.updateMetaData(id);
		}
		renderSuccess();
	}
	
	public void listField() {
		renderDatagrid(ZcurdField.me.paginate(getParaToInt("page", 1), getParaToInt("rows", 500), getParaToInt("head_id")));
	}
}
