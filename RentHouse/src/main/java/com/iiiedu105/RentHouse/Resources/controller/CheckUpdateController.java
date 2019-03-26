package com.iiiedu105.RentHouse.Resources.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiedu105.RentHouse.Resources.service.ResourcesService;
import com.iiiedu105.RentHouse.model.Reservation;

@Controller
public class CheckUpdateController {
	@Autowired
	ResourcesService service;
	@Autowired
	ServletContext context;

	@RequestMapping(value = "/MemberCheckUpDate/{memberId}", method = RequestMethod.GET)
	public String ReservationCheck(@PathVariable("memberId") String memberId, Model model) {
		List<Integer> houses = service.findByHId(memberId);// 用房東的memberId查詢房東名下登入的house物件
		Map<Integer, List<Reservation>> reservations = new HashMap<Integer, List<Reservation>>();
		for (Integer house : houses) {
			List<Reservation> beans = service.getReservation(house);
			reservations.put(house, beans);
		}
		model.addAttribute("reservations", reservations);
		return "login/MemberCheckUpDate";
	}

	@RequestMapping(value = "/MemberCheckUpDate/{memberId}", method = RequestMethod.POST)
	public String updateReservation(Model model,@PathVariable("memberId") String memberId, @RequestParam(value = "houseid") Integer houseid) {

		service.updateReservation(houseid);
		return "redirect:/MemberCheckUpDate/back/"+memberId;
	}
	@RequestMapping(value = "/MemberCheckUpDate/back/{memberId}")
	public String updateReservationBack(@PathVariable("memberId") String id) {
		return "redirect:/MemberCheckUpDate/"+id;
	}
}
