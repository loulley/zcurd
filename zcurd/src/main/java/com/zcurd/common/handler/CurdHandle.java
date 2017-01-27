package com.zcurd.common.handler;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface CurdHandle {
	
	public void add(int headId, HttpServletRequest req, Map<String, String[]> paraMap);
	
	public void update(int headId, HttpServletRequest req, Map<String, String[]> paraMap);
	
	public void delete(int headId, HttpServletRequest req, Map<String, String[]> paraMap);

}
