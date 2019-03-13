package com.iiiedu105.RentHouse.backend.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping(value="/")
	public String bsindex() {
		return "bsindex";		
	}
	@RequestMapping(value="/bslogout")
	public String login() {
		return "bslogout";		
	}

	@RequestMapping(value="/chart")
	public String chart() {
		return "chart";		
	}
	@RequestMapping(value="/customerservice")
	public String customerservice() {
		return "customerservice";		
	}
}
