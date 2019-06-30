package com.liuliu.com.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class SystemAdminFilter implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO 对管理员用户进行登录拦截
    	if(request.getSession().getAttribute("systemAdmin")!=null) {
    		//要保证错误界面和后台管理页面能够直接进入
    		return true;  //放行
    	}else {
    		response.sendRedirect("/publicpage/adminlogin");
    		return false;
    	}
	}
}
