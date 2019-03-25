package com.iiiedu105.RentHouse.backend.filter;

import java.io.IOException;

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

import com.iiiedu105.RentHouse.model.Employee;
@WebFilter(urlPatterns= {"/backstage/*"})
public class LoginCheckFilter implements Filter {

	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {				
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		if(checkLogin(req)) {
			chain.doFilter(request, response);
		}else {			
			req.getRequestDispatcher("/WEB-INF/views/backstage/bslogout.jsp").forward(req, resp);
			return;
		}
		
	}
	private boolean checkLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		Employee member = (Employee) session.getAttribute("employee");
		if (member == null) {
			return false;
		} else {
			return true;
		}
	}	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
