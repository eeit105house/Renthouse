package com.iiiedu105.RentHouse.backend.review.writings.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;
import com.iiiedu105.RentHouse.model.ForumReport;

@Controller
public class ReviewWritingsController {
	@Autowired
	RWritingsService service;
	@RequestMapping(value="/writingsReview")
	public String writings(Model model) {
		List<ForumReport> list = service.getAllWritings();
		model.addAttribute("wlist", list);
		return "backstage/writingsReview";		
	}
	@RequestMapping(value="/pass/{id}")
	public String updatepass(@PathVariable("id") Integer id) {
		service.updatePassWritings(id);
		return "redirect:/writingsReview";		
	}
	@RequestMapping(value="/fail/{id}")
	public String updatefail(@PathVariable("id") Integer id) {
		service.updateFailWritings(id);
		return "redirect:/writingsReview";		
	}
	@RequestMapping(value="/Details/{id}")
	public String details(@PathVariable("id") Integer id,Model model) {
		Object[] list = service.getAllDetailWritingsById(id);
		model.addAttribute("olist", list);
		return "backstage/writingsDetails";		
	}
	}

