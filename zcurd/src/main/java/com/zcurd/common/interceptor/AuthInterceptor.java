package com.zcurd.common.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.zcurd.common.util.UrlUtil;

/**
 * 权限处理拦截器
 * @author 钟世云 2016.2.5
 */
public class AuthInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		//TODO 注解标识不拦截
		//Annotation[] as = inv.getMethod().getAnnotations();
		//System.out.println("********Annotation: " + as.length);
		
		Controller c = inv.getController();
		HttpServletRequest request = c.getRequest();
		
		int contextLength = request.getContextPath().length();
		String currUrl = request.getRequestURI().substring(contextLength);
		System.out.println(UrlUtil.formatBaseUrl(currUrl));
		
		List<String> noAuthUrl = c.getSessionAttr("noAuthUrl");
		if(noAuthUrl != null) {
			//页面权限处理，拦截action/method链接的所有/action/*页面
			for (String url : noAuthUrl) {
				if(UrlUtil.formatBaseUrl(currUrl).equals(UrlUtil.formatBaseUrl(url))) {
					c.renderText("没有权限访问该页面！");
					return;
				}
			}
			//按钮权限
			Map<String, Object> authBtn = c.getSessionAttr("noAuthBtnUrl");
			List<String> noAuthBtnUrl = (List<String>) authBtn.get("btnUrlList");
			Map<String, String> noAuthBtnMap = (Map<String, String>) authBtn.get("pageBtnMap");
			request.setAttribute("noAuthBtn", noAuthBtnMap.get(currUrl));
			for (String btnUrl : noAuthBtnUrl) {
				if(currUrl.equals(btnUrl)) {
					c.renderText("没有权限访问该页面！");
					return;
				}
			}
		}
		inv.invoke();
	}
}
