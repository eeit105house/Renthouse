package com.iiiedu105.RentHouse.backend.review.writings.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu105.RentHouse.backend.review.house.service.OTShelfService;
import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;

@Controller
public class ReviewWritingsController {
	@Autowired
	RWritingsService rservice;
	@Autowired
	OTShelfService oservice;
	@RequestMapping(value="/writingsReview")
	public String writings(Model model) {
		List<ForumReport> list = rservice.getAllWritings();
		model.addAttribute("wlist", list);
		List<House> list1 = oservice.getAllHouse();
		model.addAttribute("hlist", list1);
		return "backstage/writingsReview";		
	}
	@RequestMapping(value="/pass/{id}")
	public String updatepass(@PathVariable("id") Integer id) {
		rservice.updatePassWritings(id);
		return "redirect:/writingsReview";		
	}
	@RequestMapping(value="/fail/{id}")
	public String updatefail(@PathVariable("id") Integer id) {
		rservice.updateFailWritings(id);
		return "redirect:/writingsReview";		
	}
	@RequestMapping(value="/Details/{id}")
	public String details(@PathVariable("id") Integer id,Model model) {
		Object[] list = rservice.getAllDetailWritingsById(id);
		model.addAttribute("olist", list);
		List<House> list1 = oservice.getAllHouse();
		model.addAttribute("hlist", list1);
		List<ForumReport> list3 = rservice.getAllWritings();
		model.addAttribute("wlist", list3);
		return "backstage/writingsDetails";		
	}
	}

