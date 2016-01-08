package com.zcurd.controller;

import java.util.Map;

import com.jfinal.aop.Duang;
import com.zcurd.common.CommonController;
import com.zcurd.service.ZcurdService;

public class ZcurdController extends CommonController {
	
	public void listPage() {
		int headId = getParaToInt("headId");
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		Map<String, Object> metaMap = zcurdService.getMetaData(headId);
		setAttr("headId", headId);
		setAttrs(metaMap);
	}
	
	public void listData() {
		int headId = getParaToInt("headId");
		Map<String, String[]> paraMap = getParaMap();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		renderDatagrid(zcurdService.find(headId, paraMap, getParaToInt("page", 1), getParaToInt("rows", 10)));
	}
	
	//增加页面
	public void addPage() {
		int headId = getParaToInt("headId");
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		Map<String, Object> metaMap = zcurdService.getMetaData(headId);
		setAttr("headId", headId);
		setAttrs(metaMap);
	}
	
	//增加
	public void add() {
		Map<String, String[]> paraMap = getParaMap();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.add(getParaToInt("headId"), paraMap);
		renderSuccess();
	}
	
	//修改页面
	public void updatePage() {
		int headId = getParaToInt("headId");
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		Map<String, Object> metaMap = zcurdService.getMetaData(headId);
		setAttr("headId", headId);
		setAttrs(metaMap);
		setAttr("model", zcurdService.get(headId, getParaToInt("id")).getColumns());
		render("updatePage.html");
	}
	
	//修改
	public void update() {
		Map<String, String[]> paraMap = getParaMap();
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.update(getParaToInt("headId"), getParaToInt("id"), paraMap);
		renderSuccess();
	}
	
	//删除
	public void delete() {
		Integer[] ids = getParaValuesToInt("id[]");
		ZcurdService zcurdService = Duang.duang(ZcurdService.class);
		zcurdService.delete(getParaToInt("headId"), ids);
	}

}
