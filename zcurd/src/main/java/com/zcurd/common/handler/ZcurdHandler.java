package com.zcurd.common.handler;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jfinal.handler.Handler;
import com.zcurd.common.util.UrlUtil;
import com.zcurd.model.MenuDatarule;

public class ZcurdHandler extends Handler {

	@Override
	public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
		HttpSession session = request.getSession();
		
		//数据权限处理
		if(!target.startsWith("/res/")) {	//排除静态资源
			if(session.getAttribute("noAuthDatarule") != null) {
				@SuppressWarnings("unchecked")
				Map<String, List<MenuDatarule>> noAuthDatarule = (Map<String, List<MenuDatarule>>) request.getSession().getAttribute("noAuthDatarule");
				List<MenuDatarule> menuDataruleList = noAuthDatarule.get(UrlUtil.formatBaseUrl(target));
				if(menuDataruleList != null) {
					request.setAttribute("menuDataruleList", menuDataruleList);
					String authField = "";
					for (MenuDatarule menuDatarule : menuDataruleList) {
						authField += "," + menuDatarule.getFieldName();
					}
					request.setAttribute("authField", authField.replaceAll("^,", ""));
				}
			}
		}	
		
		//表单管理url特需处理。以支持/zcurd/{headId}/method格式url
		String pre = "/zcurd/";
		if(target.startsWith(pre)) {
			String[] params = target.split("/");
			if(params.length > 3) {
				target = pre + params[3];
				request.setAttribute("headId", params[2]);
				for (int i = 4; i < params.length; i++) {
					target += params[i];
				}
			}
		}
		
		nextHandler.handle(target, request, response, isHandled);
	}

}
