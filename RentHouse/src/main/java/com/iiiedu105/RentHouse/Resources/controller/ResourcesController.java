package com.iiiedu105.RentHouse.Resources.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String processAddNewProductForm(@RequestParam(value = "time")String dat,
			@RequestParam(value = "status")String status,
			@RequestParam(value = "confirm")String confirm,
			@RequestParam(value = "readStatus")String readStatus,
			@RequestParam(value = "houseIdRv")Integer houseIdRv,
			HttpServletRequest request) throws ParseException {
		String mId ="abc123";//假定會員
//		Integer hId = 1;//假定房屋物件
		Reservation bb = new Reservation();
		bb.setStatus(status);
		bb.setConfirm(confirm);
		bb.setReadStatus(readStatus);
		bb.setHouseId(houseIdRv);

		HttpSession httpSession =request.getSession();
//		House houseBean= service.findById(hId);
		House houseBean= service.findById(houseIdRv);
//		Member memberBean = service.getMemberById(mId);
		Member memberBean = (Member) httpSession.getAttribute("user");
		System.out.println(dat);
		Timestamp rDT= getStringBySqlDate(dat);
		bb.setDatetime(rDT);
		bb.setHouseBean(houseBean);
		bb.setMemberBean(memberBean);
		service.addResources(bb);
		return "redirect:/houseView/"+houseIdRv;
	}//新增一筆預約資訊
	private Timestamp getStringBySqlDate(String ddMMYYYY) throws ParseException{
		SimpleDateFormat sDF = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		sDF.setLenient(false);
		Timestamp rDT= new Timestamp(sDF.parse(ddMMYYYY).getTime());
//		Date date = new Date(sDF.parse(ddMMYYYY).getTime());
		return rDT;
	}//將傳入資料庫內的字串轉為時間格式
	
	
//	@RequestMapping(value = "/Resources/add", method = RequestMethod.POST)
//	public String processAddNewProductForm(@ModelAttribute("Reservation") Reservation bb,@RequestParam(value = "time")String dat) throws ParseException {
//		String mId ="abc123";//假定會員
//		Integer hId = 1;//假定房屋物件
//		House houseBean= service.findById(hId);
//		Member memberBean = service.getMemberById(mId);
//		
//		Timestamp rDT= getStringBySqlDate(dat);
//		bb.setDatetime(rDT);
//		bb.setHouseBean(houseBean);
//		bb.setMemberBean(memberBean);
//		service.addResources(bb);
//		return "Resonrces/ReservationButton";
//	}//新增一筆預約資訊
//	private Timestamp getStringBySqlDate(String ddMMYYYY) throws ParseException{
//		SimpleDateFormat sDF = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
//		sDF.setLenient(false);
//		Timestamp rDT= new Timestamp(sDF.parse(ddMMYYYY).getTime());
////		Date date = new Date(sDF.parse(ddMMYYYY).getTime());
//		return rDT;
//	}//將傳入資料庫內的字串轉為時間格式
//	
}
