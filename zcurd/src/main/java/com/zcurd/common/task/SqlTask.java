package com.zcurd.common.task;

import java.util.Date;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.cron4j.ITask;
import com.zcurd.model.TaskBase;
import com.zcurd.model.TaskLog;

public class SqlTask implements ITask {
	private int id;
	private String sql;

	public SqlTask(String sql) {
		this.sql = sql;
	}
	
	public SqlTask(int id, String sql) {
		this.id = id;
		this.sql = sql;
	}
	
	@Override
	public void run() {
		TaskLog log = new TaskLog();
		Date startDate = new Date();
		log.setTaskId(id).setStartTime(startDate).save();
		
		String result = "成功";
		try {
			System.out.println(Db.find(sql));
		} catch (Exception e) {
			e.printStackTrace();
			result = "失败";
			log.setRemark(e.getMessage());
		}
		
		Date endDate = new Date();
		int costTime = (int) (endDate.getTime() - startDate.getTime());
		log.setResult(result);
		log.setEndTime(endDate);
		log.setCostTime(costTime);
		log.update();
		
		//更新任务运行信息
		if(id > 0) {
			TaskBase.me.findById(id).setLastRunTime(startDate)
				.setLastRunTimeCost(costTime).update();
		}
	}

	@Override
	public void stop() {
		System.out.println("top");
	}

}
