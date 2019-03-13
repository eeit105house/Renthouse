package com.iiiedu105.RentHouse.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {
	@RequestMapping("/")
	public String index(Model model) {
//		return "index";
		return "index";
	}
}
