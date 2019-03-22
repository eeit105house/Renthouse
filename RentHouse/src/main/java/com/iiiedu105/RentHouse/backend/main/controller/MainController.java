package com.iiiedu105.RentHouse.backend.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iiiedu105.RentHouse.backend.main.service.LoginService;
import com.iiiedu105.RentHouse.backend.review.house.service.OTShelfService;
import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;
import com.iiiedu105.RentHouse.model.Employee;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;

@Controller
public class MainController {
	@Autowired
	OTShelfService oservice;
	@Autowired
	RWritingsService rservice;
	@Autowired
	LoginService loginService;
	@ModelAttribute("hlist")
	public List<House> getHouseList(){
		List<House> list = oservice.getAllHouse();
		return list;
	}
	@ModelAttribute("wlist")
	public List<ForumReport> getWriteList(){
		List<ForumReport> list = rservice.getAllWritings();
		return list;
	}
	@RequestMapping(value="/backlogin/login")
	public String backLogin(HttpServletRequest request) {	
//		HttpSession session = request.getSession();
//		String login = null;
//		if(session.getAttribute("employee")!=null) {
//			login = "backstage/bsindex";
//		}else {
//			login = "backstage/bslogout";
//		}
		return "backstage/bslogout";		
	}
	@RequestMapping(value="/backlogin/processLogin" ,method = RequestMethod.POST)
	public String processBackLogin(Model model ,HttpServletRequest request) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		String str = null;
		HttpSession session = request.getSession();
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		List<Employee> list = loginService.getOneEmployee(user,pwd);
		if(list.size()!=0) {
			for(Employee employee: list) {
				session.setAttribute("employee", employee);	
			}		
			str = "redirect:/backstage/backindex";
		}else {
			errorMsg.put("error", "帳號或密碼錯誤");
			model.addAttribute("errorMsg",errorMsg);
			str = "backstage/bslogout";
		}
		return str;		
	}
	
	@RequestMapping(value="/backstage/backindex")
	public String backindex() {
		return "backstage/bsindex";
	}
	@RequestMapping(value="/backlogin/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("employee")!=null) {			
			session.removeAttribute("employee");
		}
		return "redirect:/backlogin/login";		
	}

	@RequestMapping(value="/backstage/chart")
	public String chart(Model model) {

		return "backstage/chart";		
	}
	
}
