package com.wiyn.web.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException auth)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
	
		if(auth instanceof BadCredentialsException){
			
			String error = "1";
			request.setAttribute("error", error);
			response.sendRedirect(request.getContextPath() + "/joinus/login?error");
			
			//request.getRequestDispatcher(request.getContextPath() + "/login").forward(request, response);
			
			
		}
		
		
	
	}

}
