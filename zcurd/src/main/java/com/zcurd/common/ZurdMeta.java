package com.zcurd.common;

import java.util.List;

import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;

public class ZurdMeta {
	
	private ZcurdHead head;
	private List<ZcurdField> fieldList;
	
	public ZcurdHead getHead() {
		return head;
	}
	public void setHead(ZcurdHead head) {
		this.head = head;
	}
	public List<ZcurdField> getFieldList() {
		return fieldList;
	}
	public void setFieldList(List<ZcurdField> fieldList) {
		this.fieldList = fieldList;
	}
	

}
