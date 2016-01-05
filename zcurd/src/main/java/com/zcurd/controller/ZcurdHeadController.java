package com.zcurd.controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.ICallback;
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
		final String[] fields = getParaValues("rowsStr[]");
		Db.tx(new IAtom(){
			public boolean run() throws SQLException {
				ZcurdHead zcurdHead = getModel(ZcurdHead.class, "model");
				zcurdHead.update();
				final long headId = zcurdHead.getLong("id");
				if(fields != null) {
					Db.execute(new ICallback() {
						@Override
						public Object call(Connection conn) throws SQLException {
							Statement st = conn.createStatement();
							st.execute("delete from zcurd_field where head_id=" + headId);
							for (String string : fields) {
								st.execute("insert into zcurd_field" + string);
							}
							return true;
						}
					});
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
