package com.iiiedu105.RentHouse.membercenter.controller;

import java.sql.Clob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iiiedu105.RentHouse.ChangeClob;
import com.iiiedu105.RentHouse.membercenter.service.MemberCenterService;
import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.Member;
import com.iiiedu105.RentHouse.model.Reservation;


@Controller
@RequestMapping("/membercontrol")
public class MemberCenterController {
	@Autowired
	MemberCenterService memberService;
	@Autowired
	ServletContext context;
	@Autowired
	ChangeClob changeClob;
	//=========會員中心===================	
	
	//客服與預約通知
	@ModelAttribute
	public void getReservation(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		if(member!=null) {
		List<Reservation> list = memberService.getUnreadReservation(member.getId());
		model.addAttribute("getReservation",list);
		List<EmployeeReport> list1 = memberService.getUnreadEmployeeReport(member.getId());
		model.addAttribute("getEmployeeReport",list1);
		}else {
			model.addAttribute("getReservation","");
			model.addAttribute("getEmployeeReport","");
		}
			
	}
	//客服中心
	//客服填寫問題表單
	@RequestMapping(value="/memberservice/serviceform" ,method= RequestMethod.GET)
	public String memberServiceajax(Model model) {
		EmployeeReport employeeReport = new EmployeeReport();
		model.addAttribute("employeeReport",employeeReport);
		
		return "login/MemberService";	
	}

	//客服表單處理
	@RequestMapping(value="/memberservice/serviceform" ,method= RequestMethod.POST)
	public String processMemberService(@ModelAttribute("employeeReport")EmployeeReport employeeReport,HttpServletRequest request ) {	
		HttpSession session = request.getSession();
		String content = request.getParameter("content1");
		Member member = (Member)session.getAttribute("user");
		Clob clob = changeClob.stringToClob(content);
		employeeReport.setContent(clob);
		employeeReport.setMemberBean(memberService.findMemberById(member.getId()));
		memberService.addEmployeeReport(employeeReport);
		return "redirect:/membercontrol/memberservice/serviceform";	
	}
	//預定導向預約中心
	@RequestMapping(value="/reservationservice")
	public String getAllReservation(Model model) {
				return "backstage/bsindex";
	}
	//客服中心回覆信件(ajax)
	@RequestMapping(value="/memberservice/cservicereport")
	public String getAllEmployeeReport(Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session==null) {
			return "redirect:/";
		}else {
		Member member = (Member)session.getAttribute("user");
		List<EmployeeReport> list = memberService.getAllMail(member.getId());
		model.addAttribute("allmail",list);
		model.addAttribute("member", new Member());
		return "login/MemberServiceReport";
		}
	}

		//客服中心詳細回覆
		@RequestMapping(value="/memberservice/memberservicedetail/{rid}")
		public String MemberService(@PathVariable("rid") Integer id,Model model) {
			if(id==null) {
				return "redirect:/";
			}else {
			EmployeeReport employeeReport = memberService.getMailById(id);
			String content = changeClob.ClobToString(employeeReport.getContent());
			String reply = changeClob.ClobToString(employeeReport.getReply());
			Map<String,String> map = new HashMap<>();
			map.put("content", content);
			map.put("reply", reply);
			model.addAttribute("mailDetail",employeeReport);
			model.addAttribute("strmap",map);
			return "login/Reportdetail";
			}
		}
}