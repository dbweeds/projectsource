package com.company.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session != null) {
			String adminId = (String) session.getAttribute("admin");
			if (adminId != null) {
				return true;// 세션값이 있다면 사용자가 요청한 컨트롤러 진입
			}
		}
		
		// 세션값이 없으면 로그인 페이지로 돌려보내기
		response.sendRedirect("/");
		return false;
	}
}
