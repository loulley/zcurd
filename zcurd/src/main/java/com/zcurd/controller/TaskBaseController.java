package com.zcurd.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.zcurd.common.DBTool;
import com.zcurd.common.StringUtil;
import com.zcurd.controller.BaseController;
import com.zcurd.ext.render.csv.CsvRender;
import com.zcurd.model.TaskBase;
import com.zcurd.service.TaskService;

/**
 * 定时任务
 */
public class TaskBaseController extends BaseController {
	
	public void listPage() {
		render("list.html");
	}
	
	public void listData() {
		Object[] queryParams = getQueryParams();
		String[] properties = (String[]) queryParams[0];
		String[] symbols = (String[]) queryParams[1];
		Object[] values = (Object[]) queryParams[2];
		
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = "id desc";
		}
		
		List<Record> list = DBTool.findByMultPropertiesDbSource("zcurd_base", "task_base", properties, symbols, values, orderBy, getPager());
		
		renderDatagrid(
			list, 
			DBTool.countByMultPropertiesDbSource("zcurd_base", "task_base", properties, symbols, values)
		);
	}
	
	//增加页面
	public void addPage() {
		render("add.html");
	}
	
	//增加
	public void add() {
		TaskBase model = getModel(TaskBase.class, "model");
		model.save();
		addOpLog("[定时任务] 增加");
		
		TaskService taskService = Duang.duang(TaskService.class);
		taskService.add(model);
		renderSuccess();
	}
	
	//修改页面
	public void updatePage() {
		setAttr("model", TaskBase.me.findById(getPara("id")));
		render("update.html");
	}
	
	//修改
	public void update() {
		TaskBase model = TaskBase.me.findById(getPara("id"));
		model.setName(getPara("model.name"));
		model.setTargetType(getParaToInt("model.target_type"));
		model.setTargetValue(getPara("model.target_value"));
		model.setCron(getPara("model.cron"));
		model.setStatus(getParaToInt("model.status"));
		model.update();
		addOpLog("[定时任务] 修改");
		
		TaskService taskService = Duang.duang(TaskService.class);
		taskService.update(model);
		renderSuccess();
	}
	
	//删除
	public void delete() {
		Integer[] ids = getParaValuesToInt("id[]");
		TaskService taskService = Duang.duang(TaskService.class);
		for (Integer id : ids) {
			new TaskBase().set("id", id).delete();
			taskService.delete(id);
		}
		addOpLog("[定时任务] 删除");
		renderSuccess();
	}
	
	//详情页面
	public void detailPage() {
		TaskBase model = TaskBase.me.findById(getParaToInt("id"));
		setAttr("model", model);
		render("detail.html");
	}
	
	//导出csv
	public void exportCsv() {
		Object[] queryParams = getQueryParams();
		String[] properties = (String[]) queryParams[0];
		String[] symbols = (String[]) queryParams[1];
		Object[] values = (Object[]) queryParams[2];
		
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = "id desc";
		}
		
		List<Record> list = DBTool.findByMultPropertiesDbSource("zcurd_base", "task_base", properties, symbols, values);
		
		List<String> headers = new ArrayList<String>();
		List<String> clomuns = new ArrayList<String>();
		headers.add("名称");
		clomuns.add("name");
		headers.add("目标类型");
		clomuns.add("target_type");
		headers.add("目标值");
		clomuns.add("target_value");
		headers.add("cron表达式");
		clomuns.add("cron");
		headers.add("上次执行时间");
		clomuns.add("last_run_time");
		headers.add("上次执行耗时");
		clomuns.add("last_run_time_cost");
		headers.add("状态");
		clomuns.add("status");
		
		CsvRender csvRender = new CsvRender(headers, list);
		csvRender.clomuns(clomuns);
		csvRender.fileName("定时任务");
		
		addOpLog("[定时任务] 导出cvs");
		render(csvRender);
	}
}
