package com.zcurd.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.ICallback;
import com.zcurd.common.DBTool;
import com.zcurd.common.DbMetaTool;
import com.zcurd.common.ZcurdTool;
import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;
import com.zcurd.service.ZcurdService;
import com.zcurd.vo.ZcurdMeta;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 表单管理
 * @author 钟世云 2016.2.5
 */
public class ZcurdHeadController extends BaseController {
	
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
		String dbSource = getPara("db_source");
		String dbName = (String) DBTool.use(dbSource).execute(new ICallback() {
			@Override
			public Object call(Connection conn) throws SQLException {
				return conn.getCatalog();
			}
		});
		String sql = "select TABLE_SCHEMA, TABLE_TYPE, a.TABLE_NAME, TABLE_COMMENT, CREATE_TIME from information_schema.TABLES a where a.TABLE_SCHEMA='" + dbName + "' order by CREATE_TIME desc";
		renderDatagrid(DBTool.use(dbSource).find(sql));
	}
	
	//生成表单
	public void genForm() {
		String tableName = getPara("tableName");
		String dbSource = getPara("db_source");
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.genForm(tableName, dbSource);
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
	
	//字段列表
	public void listField() {
		renderDatagrid(ZcurdField.me.paginate(getParaToInt("page", 1), getParaToInt("rows", 500), getParaToInt("head_id")));
	}
	
	//代码生成
	public void genCode() throws IOException, TemplateException {
		int headId =  getParaToInt("headId");
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		ZcurdMeta metaMap = zcurdService.getMetaData(headId);
		
		@SuppressWarnings("deprecation")
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\admin\\git\\zcurd\\zcurd\\src\\main\\webapp\\zcurd\\zcurd")); 
		
		Template t = cfg.getTemplate("listPage.html"); 
		t.process(ZcurdTool.convert2Map(metaMap), new OutputStreamWriter(System.out)); 
		
	}
}
