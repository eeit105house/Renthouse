package com.iiiedu105.RentHouse.backend.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping(value="/")
	public String bsindex() {
		return "backstage/bsindex";		
	}
	@RequestMapping(value="/bslogout")
	public String login() {
		return "backstage/bslogout";		
	}

	@RequestMapping(value="/chart")
	public String chart() {
		return "backstage/chart";		
	}
	@RequestMapping(value="/customerservice")
	public String customerservice() {
		return "backstage/customerservice";		
	}
}
