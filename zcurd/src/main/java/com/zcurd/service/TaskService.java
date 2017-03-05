package com.zcurd.service;

import java.util.List;

import com.jfinal.plugin.cron4j.Cron4jPlugin;
import com.jfinal.plugin.cron4j.ITask;
import com.zcurd.common.task.Constant;
import com.zcurd.common.task.SqlTask;
import com.zcurd.common.task.UrlTask;
import com.zcurd.model.TaskBase;

public class TaskService {
	
	public void start() {
		List<TaskBase> taskList = TaskBase.me.find("select * from task_base");
		for (TaskBase taskBase : taskList) {
			System.out.println(taskBase.getName());
			Cron4jPlugin cp = new Cron4jPlugin();
			cp.addTask(taskBase.getCron(), createTask(taskBase));
			Constant.getTaskMap().put(taskBase.getId(), cp);
			cp.start();
		}
	}
	
	public void add(TaskBase task) {
		Cron4jPlugin cp = new Cron4jPlugin();
		cp.addTask(task.getCron(), createTask(task));
		cp.start();
		Constant.getTaskMap().put(task.getId(), cp);
	}
	
	public void update(TaskBase taskBase) {
		Cron4jPlugin cp = (Cron4jPlugin) Constant.getTaskMap().get(taskBase.getId());
		cp.stop();
		cp = new Cron4jPlugin();
		cp.addTask(taskBase.getCron(), createTask(taskBase));
		cp.start();
		Constant.getTaskMap().put(taskBase.getId(), cp);
	}
	
	public void delete(Integer id) {
		Cron4jPlugin cp = (Cron4jPlugin) Constant.getTaskMap().get(id);
		cp.stop();
		cp = null;
		Constant.getTaskMap().remove(id);
	}
	
	/**
	 * 立即执行
	 */
	public void runAtOnce(TaskBase taskBase) {
		createTask(taskBase).run();
	}
	
	private ITask createTask(TaskBase taskBase) {
		ITask task = null;
		if(taskBase.getTargetType() == 1) {
			task = new UrlTask(taskBase.getId(), taskBase.getTargetValue());
		}else if(taskBase.getTargetType() == 2) {
			task = new SqlTask(taskBase.getId(), taskBase.getTargetValue());
		}
		return task;
	}

}
