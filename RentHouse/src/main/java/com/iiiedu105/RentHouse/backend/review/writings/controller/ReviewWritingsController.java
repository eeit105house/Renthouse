package com.iiiedu105.RentHouse.backend.review.writings.controller;

import java.sql.Clob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu105.RentHouse.ChangeClob;
import com.iiiedu105.RentHouse.backend.customerservice.service.CSService;
import com.iiiedu105.RentHouse.backend.review.house.service.OTShelfService;
import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;
import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;

@Controller
@RequestMapping("/backstage")
public class ReviewWritingsController {
	@Autowired
	RWritingsService rservice;
	@Autowired
	OTShelfService oservice;
	@Autowired
	CSService cservice;
	@Autowired
	ChangeClob changeclob;
	//get房屋審核數量
	@ModelAttribute("hlist")
	public List<House> getHouseList(){
		List<House> list = oservice.getAllHouse();
		return list;
	}
	//get文章審核數量
	@ModelAttribute("wlist")
	public List<ForumReport> getWriteList(){
		List<ForumReport> list = rservice.getAllWritings();
		return list;
	}
	//get客服信件數量
	@ModelAttribute("maillist")
	public List<EmployeeReport> getAllMail(){
		List<EmployeeReport> list = cservice.getAllMail();
		return list;
	}
	//文章審核首頁
	@RequestMapping(value="/writingsReview")
	public String writings(Model model) {
		return "backstage/writingsReview";		
	}
	//文章通過審核
	@RequestMapping(value="/pass/{id}")
	public String updatepass(@PathVariable("id") Integer id) {
		rservice.updatePassWritings(id);
		return "redirect:/backstage/writingsReview";		
	}
	//文章下架
	@RequestMapping(value="/fail/{id}")
	public String updatefail(@PathVariable("id") Integer id) {
		rservice.updateFailWritings(id);
		return "redirect:/backstage/writingsReview";		
	}
	//文章詳情
	@RequestMapping(value="/Details/{id}")
	public String details(@PathVariable("id") Integer id,Model model) {
		Object[] list = rservice.getAllDetailWritingsById(id);
		list[2] = changeclob.ClobToString((Clob)list[2] );
		list[5] = changeclob.ClobToString((Clob)list[5]);
		model.addAttribute("olist", list);	
		return "backstage/writingsDetails";		
	}
	}

