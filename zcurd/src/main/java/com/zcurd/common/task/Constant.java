package com.zcurd.common.task;

import java.util.HashMap;
import java.util.Map;

public class Constant {
	
	private static Map<Integer, Object> taskMap = new HashMap<Integer, Object>();
	
	public static Map<Integer, Object> getTaskMap() {
		return taskMap;
	}

}
