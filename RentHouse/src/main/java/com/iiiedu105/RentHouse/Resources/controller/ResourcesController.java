package com.iiiedu105.RentHouse.Resources.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiedu105.RentHouse.Resources.service.ResourcesService;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.Member;
import com.iiiedu105.RentHouse.model.Reservation;

@Controller
public class ResourcesController {
	@Autowired
	ResourcesService service;
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/Resources/add", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		Reservation bb = new Reservation();
		model.addAttribute("Reservation", bb);
		
		return "Resonrces/ReservationButton";
	}
//	ReservtionButton GET

	@RequestMapping(value = "/Resources/add", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("Reservation") Reservation bb,@RequestParam(value = "time")String dat) throws ParseException {
		String mId ="abc123";//假定會員
		Integer hId = 1;//假定房屋物件
		House houseBean= service.findById(hId);
		Member memberBean = service.getMemberById(mId);
		
		Timestamp rDT= getStringBySqlDate(dat);
		bb.setDatetime(rDT);
		bb.setHouseBean(houseBean);
		bb.setMemberBean(memberBean);
		service.addResources(bb);
		return "Resonrces/ReservationButton";
	}//新增一筆預約資訊
	
	@RequestMapping("/ReservationCheck/{memberId}")
	public String ReservationCheck(@PathVariable("memberId") String memberId, Model model) {
		 List<House> houses = service.findByHId(memberId);
		 Map<Integer,List<Reservation>> reservations = new HashMap<Integer, List<Reservation>>();
		 for(House house:houses) {
			 List<Reservation> beans = service.getReservation(house.getId());
			 reservations.put(house.getId(), beans);
		 }
		 model.addAttribute("reservations", reservations);
		return "ReservationCheck";
	}
	
	private Timestamp getStringBySqlDate(String ddMMYYYY) throws ParseException{
		SimpleDateFormat sDF = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		sDF.setLenient(false);
		Timestamp rDT= new Timestamp(sDF.parse(ddMMYYYY).getTime());
//		Date date = new Date(sDF.parse(ddMMYYYY).getTime());
		return rDT;
	}//將傳入資料庫內的字串轉為時間格式
	
}
