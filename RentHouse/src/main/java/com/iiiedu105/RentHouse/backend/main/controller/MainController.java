package com.iiiedu105.RentHouse.backend.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu105.RentHouse.backend.review.house.service.OTShelfService;
import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;

@Controller
public class MainController {

	@Autowired
	OTShelfService oservice;
	@Autowired
	RWritingsService rservice;
	
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

	@RequestMapping(value="/backstage")
	public String bsindex(Model model) {
		return "backstage/bsindex";		
	}
	@RequestMapping(value="/bslogout")
	public String login(Model model) {
		
		return "backstage/bslogout";		
	}

	@RequestMapping(value="/chart")
	public String chart(Model model) {

		return "backstage/chart";		
	}
	
}
