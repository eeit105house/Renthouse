package com.iiiedu105.RentHouse.backend.review.house.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiedu105.RentHouse.backend.review.house.service.OTShelfService;
import com.iiiedu105.RentHouse.model.House;

@Controller
public class ReviewHouseController {
	@Autowired
	OTShelfService service;
	@RequestMapping(value="/houseReview")
	public String products(Model model) {
		List<Object[]> list = service.getAllHouse();
		model.addAttribute("hlist", list);
		return "houseReview";		
	}
	@RequestMapping(value="/update/{id}")
	public String updateHouse(@PathVariable("id") Integer id) {
		service.updateHouseStatus(id);;
		return "redirect:/houseReview";		
		}
	@RequestMapping(value="/delete/{id}")
	public String deleteHouse(@PathVariable("id") Integer id) {
		service.deleteHouse(id);
		return "redirect:/houseReview";		
		}
	}

