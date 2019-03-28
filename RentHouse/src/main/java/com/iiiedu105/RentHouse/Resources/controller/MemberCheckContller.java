package com.iiiedu105.RentHouse.Resources.controller;

import java.util.List;
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
public class MemberCheckContller {
	@Autowired
	ResourcesService service;
	@Autowired
	ServletContext context;
	@RequestMapping(value="/MemberCheckReservation/{memberId}",method=RequestMethod.GET)
	public String memberCheck(@PathVariable("memberId") String memberId, Model model) {
		List <Reservation> reservations = service.getReservationMember(memberId);
		model.addAttribute("reservations", reservations);
		return "login/MemberCheck";
		
	}
	@RequestMapping(value="/MemberCheckReservation/{memberId}",method=RequestMethod.POST)
	public String updateReservationScore(Model model,@PathVariable("memberId") String memberId, @RequestParam(value = "score") Integer score,@RequestParam(value = "reservationId") Integer id) {

		service.updateScore(id,score);
		return "redirect:/MemberCheckReservation/back/"+memberId;
	}
	@RequestMapping(value = "/MemberCheckReservation/back/{memberId}")
	public String updateReservationBack(@PathVariable("memberId") String id) {
		return "redirect:/MemberCheckReservation/"+id;
	}




}
