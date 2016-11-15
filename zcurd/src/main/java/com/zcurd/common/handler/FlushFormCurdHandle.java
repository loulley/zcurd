package com.zcurd.common.handler;

import javax.servlet.http.HttpServletRequest;

/**
 * 刷新表单CurdHandle
 * @author 钟世云 2016.11.3
 */
public class FlushFormCurdHandle implements CurdHandle {

	@Override
	public void add(int headId, HttpServletRequest req) {
		System.out.println("------------------CurdHandle to add!");
		
	}

	@Override
	public void update(int headId, HttpServletRequest req) {
		System.out.println("------------------CurdHandle to update!");
		
	}

	@Override
	public void delete(int headId, HttpServletRequest req) {
		System.out.println("------------------CurdHandle to delete!");
		
	}

}
