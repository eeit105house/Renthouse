package com.iiiedu105.RentHouse.backend.review.house.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu105.RentHouse.backend.customerservice.service.CSService;
import com.iiiedu105.RentHouse.backend.review.house.service.OTShelfService;
import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;
import com.iiiedu105.RentHouse.house.controller.HouseController;
import com.iiiedu105.RentHouse.house.service.HouseService;
import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;

@Controller
@RequestMapping("/backstage")
public class ReviewHouseController {
	@Autowired
	OTShelfService oservice;
	@Autowired
	RWritingsService rservice;
	@Autowired
	CSService cservice;
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
	//房屋審核畫面
	@RequestMapping(value="")
	public String products(Model model) {
		return "backstage/houseReview";		
	}
	//通過審核
	@RequestMapping(value="/update/{id}")
	public String updateHouse(@PathVariable("id") Integer id) {
		oservice.updateHouseStatus(id);
		return "redirect:/backstage";		
		}
	//房屋下架
	@RequestMapping(value="/delete/{id}")
	public String deleteHouse(@PathVariable("id") Integer id) {
		oservice.deleteHouse(id);
		return "redirect:/backstage";		
		}
	
	}

