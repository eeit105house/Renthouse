package com.iiiedu105.RentHouse.backend.customerservice.controller;

import java.sql.Clob;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iiiedu105.RentHouse.ChangeClob;
import com.iiiedu105.RentHouse.backend.customerservice.service.CSService;
import com.iiiedu105.RentHouse.backend.review.house.service.OTShelfService;
import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;
import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;

@Controller
@RequestMapping("/backstage")
public class CSController {
	@Autowired
	CSService cservice;
	@Autowired
	OTShelfService oservice;
	@Autowired	
	RWritingsService rservice;
	@Autowired
	ChangeClob changeType;
	
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
	@ModelAttribute("maillist")
	public List<EmployeeReport> getAllMail(){
		List<EmployeeReport> list = cservice.getAllMail();
		return list;
	}
	@RequestMapping(value="/customerservice")
	public String customerservice(Model model) {		
		return "backstage/customerservice";		

	}
	@RequestMapping(value="/getmail/{id}", method=RequestMethod.GET)
	public String getOneMailForm(@PathVariable("id") Integer id, Model model) {	
		EmployeeReport employeeReport = new EmployeeReport();
		employeeReport = cservice.getMailById(id);
		model.addAttribute("omail", employeeReport);
		String content = changeType.ClobToString(cservice.getMailById(id).getContent());
		model.addAttribute("content", content);
		
		EmployeeReport ereport = new EmployeeReport();
		model.addAttribute("ereport", ereport);
				
		return "backstage/customerservicemail";		
	}
	@RequestMapping(value="/getmail/{id}", method=RequestMethod.POST)
	public String processForm(@PathVariable("id") Integer id,HttpServletRequest request) {			
		Clob content = changeType.stringToClob(request.getParameter("content"));
		String eid = request.getParameter("ename");
//		String rid = request.getParameter("id");
		
		cservice.updateMail(eid, content, id);		
		return "redirect:/backstage/customerservice";		
	}
	
}
