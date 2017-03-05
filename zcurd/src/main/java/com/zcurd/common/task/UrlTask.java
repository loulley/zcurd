package com.zcurd.common.task;

import com.jfinal.plugin.cron4j.Cron4jPlugin;
import com.jfinal.plugin.cron4j.ITask;
import com.zcurd.common.util.UrlUtil;

public class UrlTask implements ITask {
	private int id;
	private String url;

	public UrlTask(String url) {
		this.url = url;
	}
	
	public UrlTask(int id, String url) {
		this.id = id;
		this.url = url;
	}

	@Override
	public void run() {
		//增加日志
		String content = UrlUtil.getAsText(url);
		System.out.println(content);
		//增加日志
	}

	@Override
	public void stop() {
		System.out.println("stop");
	}

	
	
	
	
	public static void main(String[] args) throws InterruptedException {
		Cron4jPlugin cp = new Cron4jPlugin();
		cp.addTask("*/1 * * * *", new UrlTask("https://www.baidu.com"), false, true);
		cp.start();
		Thread.sleep(1000 * 60 * 2);
		cp.stop();

		//System.out.println(UrlUtil.getAsText("https://www.taobao.com"));
	}

}
