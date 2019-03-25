package com.iiiedu105.RentHouse.membercenter.controller;

import java.sql.Clob;
import java.util.List;

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
	//客服填寫問題表單
	@RequestMapping(value="/memberservice/{mid}" ,method= RequestMethod.GET)
	public String memberService(Model model) {
		EmployeeReport employeeReport = new EmployeeReport();
		model.addAttribute("employeeReport",employeeReport);
		model.addAttribute("member", new Member());
		return "login/MemberService";	
	}

	//客服表單處理
	@RequestMapping(value="/memberservice/{mid}" ,method= RequestMethod.POST)
	public String processMemberService(@PathVariable("mid") String mid,@ModelAttribute("employeeReport")EmployeeReport employeeReport,HttpServletRequest request ) {	
		String content = request.getParameter("content1");
		Clob clob = changeClob.stringToClob(content);
		employeeReport.setContent(clob);
		employeeReport.setMemberBean(memberService.findMemberById(mid));
		memberService.addEmployeeReport(employeeReport);
		return "redirect:/membercontrol/memberservice/"+mid;	
	}
	//預定導向預約中心
	@RequestMapping(value="/reservationservice")
	public String getAllReservation(Model model) {
				return "backstage/bsindex";
	}
	//客服中心回覆信件
	@RequestMapping(value="/cservicereport")
	public String getAllEmployeeReport(Model model) {
		List<EmployeeReport> list = memberService.getAllMail();
		model.addAttribute("allmail",list);
		model.addAttribute("member", new Member());
		return "login/MemberServiceReport";
	}
}