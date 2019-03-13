package com.iiiedu105.RentHouse.backend.review.writings.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;

@Controller
public class ReviewWritingsController {
	@Autowired
	RWritingsService service;
	@RequestMapping(value="/writingsReview")
	public String products(Model model) {

		return "backstage/writingsReview";		
	}
//	@RequestMapping(value="/update/{id}")
//	public String updateHouse(@PathVariable("id") Integer id) {
//		service.updateHouseStatus(id);;
//		return "redirect:/houseReview";		
//		}
//	@RequestMapping(value="/delete/{id}")
//	public String deleteHouse(@PathVariable("id") Integer id) {
//		service.deleteHouse(id);
//		return "redirect:/houseReview";		
//		}
	}

