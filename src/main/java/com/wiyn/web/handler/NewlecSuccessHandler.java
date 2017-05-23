package com.wiyn.web.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class NewlecSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler  {

	  @Override
	    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, 
	    	Authentication authentication) throws ServletException, IOException {
		  
		  HttpSession session = request.getSession();

		  System.out.println(request.getHeader("referer"));
	        if (session != null) {
	            String redirectUrl = (String) request.getHeader("referer");
	            if (redirectUrl != null) {
	                session.removeAttribute("prevPage");
	                getRedirectStrategy().sendRedirect(request, response, redirectUrl);
	            } else {
	                super.onAuthenticationSuccess(request, response, authentication);
	            }
	        } else {
	            super.onAuthenticationSuccess(request, response, authentication);
	        }
	    }



}
