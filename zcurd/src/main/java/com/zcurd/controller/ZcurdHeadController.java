package com.zcurd.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Page;
import com.zcurd.common.CommonController;
import com.zcurd.common.zurdTool;
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
				final long headId = zcurdHead.getLong("id");
				Db.update("delete from zcurd_field where head_id=" + headId);
				if(jsonObjs.size() > 0) {
					for (Object object : jsonObjs) {
						ZcurdField field = new ZcurdField();
						field.set("head_id", headId);
						field.setAttrs((Map<String, Object>)object);
						field.save();
					}
				}
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
		int pageNumber = getParaToInt("page", 1);
		int pageSize = getParaToInt("rows", 10);
		
		String sqlWhere = " where 1=1 and a.TABLE_SCHEMA='zcurd' ";
		int rowCount = Db.queryLong("select count(*) from information_schema.TABLES a" + sqlWhere).intValue();
		
		String sqllimit = " limit " + (pageNumber - 1) * pageSize + ", " + pageSize;
		List<Map<String, Object>> list = zurdTool.listRecord2ListMap(Db.find("select * from information_schema.TABLES a " + sqlWhere + " order by a.CREATE_TIME desc " + sqllimit));
		
		int totalPage = rowCount / pageSize;
		if(rowCount % pageSize > 0) {
			totalPage = totalPage + 1;
		}
		renderDatagrid(new Page<Map<String, Object>>(list, pageNumber, pageSize, totalPage, rowCount));
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
		}
		renderSuccess();
	}
	
	public void listField() {
		renderDatagrid(ZcurdField.me.paginate(getParaToInt("page", 1), getParaToInt("rows", 500), getParaToInt("head_id")));
	}
}
