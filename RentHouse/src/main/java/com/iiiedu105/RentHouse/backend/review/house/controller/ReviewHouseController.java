package com.iiiedu105.RentHouse.backend.review.house.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu105.RentHouse.backend.review.house.service.OTShelfService;
import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;
import com.iiiedu105.RentHouse.house.controller.HouseController;
import com.iiiedu105.RentHouse.house.service.HouseService;
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
	HouseService houseService;
	@Autowired
	HouseController houseController;
	
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
	
	@RequestMapping(value="/houseReview")
	public String products(Model model) {
		return "backstage/houseReview";		
	}
	@RequestMapping(value="/update/{id}")
	public String updateHouse(@PathVariable("id") Integer id) {
		oservice.updateHouseStatus(id);
		return "redirect:/backstage/houseReview";		
		}
	@RequestMapping(value="/delete/{id}")
	public String deleteHouse(@PathVariable("id") Integer id) {
		oservice.deleteHouse(id);
		return "redirect:/backstage/houseReview";		
		}
	
	}

