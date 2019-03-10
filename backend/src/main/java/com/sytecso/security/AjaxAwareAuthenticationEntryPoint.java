package com.sytecso.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

public class AjaxAwareAuthenticationEntryPoint extends LoginUrlAuthenticationEntryPoint{

	public AjaxAwareAuthenticationEntryPoint(String loginFormUrl) {
		super(loginFormUrl);
	}

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
	    if (isAjax(request)) {
	    	RequestDispatcher requestDispatcher=request.getRequestDispatcher("/login");
	    	response.setStatus(404);
	    	requestDispatcher.forward(request, response);
	    	
    } else {
        super.commence(request, response, authException);
    }
	}

	public static boolean isAjax(HttpServletRequest request) {
	    return request != null && "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	}
}
