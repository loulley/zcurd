package com.zcurd.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.zcurd.common.CommonController;
import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;

public class ZcurdHeadController extends CommonController {
	
	public void main() {
		render("index.html");
	}
	
	public void list() {
		render("datagrid.html");
	}
	
	public void listPage() {
		ZcurdHead head = ZcurdHead.me.findById(1);
		List<ZcurdField> fieldList = ZcurdField.me.findByHeadId(head.getLong("id").intValue());
		setAttr("head", head);
		setAttr("fieldList", fieldList);
	}
	
	public void listData() {
		Map<String, String[]> paraMap = getParaMap();
		renderDatagrid(ZcurdHead.me.paginate(paraMap, getParaToInt("page", 1), getParaToInt("rows", 10)));
	}

	public void add() {
		setAttr("model", ZcurdHead.me.findById(getParaToInt("id")));
		render("form.html");
	}
	
	public void save() {
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
	
	public void listField() {
		renderDatagrid(ZcurdField.me.paginate(getParaToInt("page", 1), getParaToInt("rows", 100), getParaToInt("head_id")));
	}
}
