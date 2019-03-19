package com.iiiedu105.RentHouse.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu105.RentHouse.model.Member;

@Controller
public class HomePageController {
	@RequestMapping({"/","/return_index"})
	public String index(Model model) {
//		return "index";
		model.addAttribute("member", new Member());
		return "Renthouse_index";
	}
}
