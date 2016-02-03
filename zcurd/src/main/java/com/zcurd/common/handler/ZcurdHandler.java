package com.zcurd.common.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;

/**
 * 表单管理url特需处理
 * 以支持/zcurd/{headId}/method格式url
 */
public class ZcurdHandler extends Handler {

	@Override
	public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
		String pre = "/zcurd/";
		if(target.startsWith(pre)) {
			String[] params = target.split("/");
			if(params.length > 3) {
				target = pre + params[3];
				//request.getParameterMap().put("headId", new String[]{params[2]});
				for (int i = 4; i < params.length; i++) {
					target += params[i];
				}
			}
		}
		nextHandler.handle(target, request, response, isHandled);
	}

}
