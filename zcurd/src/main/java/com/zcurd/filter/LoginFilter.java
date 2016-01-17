package com.zcurd.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		HttpSession session = request.getSession();
		
		String currUrl = request.getRequestURI();
		//排除登陆页面和res目录
		if(!currUrl.endsWith("login") && !currUrl.startsWith(request.getContextPath() + "/res")) {
			if(session.getAttribute("sysUser") == null) {
				response.sendRedirect(request.getContextPath() + "/login");//如果session为空表示用户没有登录就重定向到login页面
				return;
			}
		}
		chain.doFilter(req, res);
	}

	@Override
	public void init(FilterConfig chain) throws ServletException {
	}

}
