package com.iiiedu105.RentHouse.login;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(urlPatterns= {"/membercontrol/","/insertPicPage"})
public class SignFilter implements Filter {
	HttpSession session;
	
	private static final Set<String> ALLOWED_PATHS = Collections.unmodifiableSet(new HashSet<>(
	        Arrays.asList("", "/login", "/")));
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletResponse resp = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;
        
        String path = req.getRequestURI().substring(req.getContextPath().length()).replaceAll("[/]+$", ""); 
        session = req.getSession();
        boolean loggedIn = (session != null && session.getAttribute("user") != null);
        boolean allowedPath = ALLOWED_PATHS.contains(path);
         
         if(loggedIn||allowedPath) {
     		chain.doFilter(req, resp);
     	}else {
//     		resp.sendRedirect("http://yahoo.com.tw");
     		resp.sendRedirect(req.getContextPath() + "/");
     	}
	}	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
