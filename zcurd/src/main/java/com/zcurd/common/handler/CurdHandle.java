package com.zcurd.common.handler;

import javax.servlet.http.HttpServletRequest;

public interface CurdHandle {
	
	public void add(int headId, HttpServletRequest req);
	
	public void update(int headId, HttpServletRequest req);
	
	public void delete(int headId, HttpServletRequest req);

}
