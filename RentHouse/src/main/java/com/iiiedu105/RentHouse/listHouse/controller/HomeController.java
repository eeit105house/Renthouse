package com.iiiedu105.RentHouse.listHouse.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.iiiedu105.RentHouse.listHouse.service.SearchHouseByConditionService;
import com.iiiedu105.RentHouse.model.HousePic;

@Controller
public class HomeController {

	@Autowired
	SearchHouseByConditionService service;

	@Autowired
	ServletContext context;
	
	// 條列商品首頁
	@RequestMapping("/search/searchPage_sessionStorage")
	public String searchPage(Model model) {
		List<Object[]> Objectlist = service.getAllhouse();
		model.addAttribute("biggestPage",Math.ceil(Objectlist.size()/5));
		return "search/searchPage_sessionStorage";
	}
	
	// Map商品首頁
	@RequestMapping("/search/searchByMap")
	public String searchByMap() {
		return "search/searchByMap";
	}
	
	// 全商品Google Map
	@RequestMapping(value = "/search/searchPage_Json_start" ,produces="application/json")
	public ResponseEntity<List<Object[]>> searchPageJsonstart() {
		 List<Object[]> Objectlist = service.getAllhouse();	
		 ResponseEntity<List<Object[]>> re  = new ResponseEntity<>(Objectlist, HttpStatus.OK);			
		return re;
	}
		
	// 條件Google Map
	@RequestMapping(value = "/search/searchPage_Json_criteria" ,produces="application/json")
	public ResponseEntity<List<Object[]>> searchPageJsoncriteria(@RequestParam("Searchcriteria") String Searchcriteria) {
		 List<Object[]> Objectlist = service.getHouseByCriteria(Searchcriteria);
		 ResponseEntity<List<Object[]>> re  = new ResponseEntity<>(Objectlist, HttpStatus.OK);			
		return re;
	}
	
	
	// 輪播牆
	@RequestMapping("/search/searchPage_carousel")
	public String searchPageCarouselData(Model model) {
		List<Object[]> Objectlist = service.getAllVipHouse();
		
		int totalList = Objectlist.size(); //全部vip
		double carPage = Math.ceil(totalList/5.0);	//算共幾頁輪播
		model.addAttribute("carPage",carPage);
		for(int j =0 ; j <carPage;j++) {				
			List<Object[]> Newlist = new ArrayList<>();
			for(int i =j*5 ; i<j*5+5;i++) {			//每頁輪播5筆
				if(i>=totalList) break;
				Newlist.add(Objectlist.get(i));
			}		
			String listName = "Newlist"+j;
			model.addAttribute(listName,Newlist);
		}		
		return "search/searchPage_carousel";
	}
	// 輪播牆
	@RequestMapping("/search/searchPage_carousel_criteria")
	public String searchCarouselcriteriaData(Model model,@RequestParam("Searchcriteria") String Searchcriteria) {
		List<Object[]> Objectlist = service.getAllhouse();
		model.addAttribute("Objectlists", Objectlist);
		return "search/searchPage_carousel";
	}
	
	// 全產品分頁1
	@RequestMapping("/search/searchPage_start")
	public String searchPageStartData(Model model) {
		List<Object[]> Objectlist = service.getAllhouse();	
		int totalList = Objectlist.size();
		int pageListNum = 5;
		double biggestPage =Math.ceil(totalList/pageListNum);
		
		model.addAttribute("pageListNum", pageListNum);
		model.addAttribute("biggestPage", biggestPage);
		model.addAttribute("totalList", totalList);
		model.addAttribute("Objectlists", Objectlist);
		return "search/searchPage_start";
	}
	
	// 全產品分頁
	@RequestMapping("/search/searchPage_start_page")
	public String searchPageStartWithPagData(Model model,@RequestParam("page") int page) {
		List<Object[]> Objectlist = service.getAllhouse();	
		List<Object[]> NewList = new ArrayList<Object[]>();
		int minNum = (page-1)*5;
		int maxNum = page*5;
		for(int i = minNum;i<maxNum;i++) {
			NewList.add(Objectlist.get(i));
		}	
		int totalList = Objectlist.size();
		int pageListNum = 5;
		double biggestPage =Math.ceil(totalList/pageListNum);
		model.addAttribute("pageListNum", pageListNum);
		model.addAttribute("biggestPage", biggestPage);
		model.addAttribute("totalList", totalList);
		model.addAttribute("NewList", NewList);
		return "search/searchPage_start_page";
	}
	
	// 條件分頁1
	@RequestMapping("/search/searchPage_criteria")
	public String searchPageByCriteria(Model model, @RequestParam("Searchcriteria") String Searchcriteria) {
		List<Object[]> Objectlist = service.getHouseByCriteria(Searchcriteria);
		int totalList = Objectlist.size();
		int pageListNum = 5;
		double biggestPage =Math.ceil(totalList/pageListNum);
		
		model.addAttribute("pageListNum", pageListNum);
		model.addAttribute("biggestPage", biggestPage);
		model.addAttribute("totalList", totalList);
		model.addAttribute("Objectlists", Objectlist);
		return "search/searchPage_start";
	}
	
	// 條件分頁
	@RequestMapping("/search/searchPage_criteria_page")
	public String searchByCriteriaWithPagData(Model model, @RequestParam("Searchcriteria") String Searchcriteria,@RequestParam("page") int page) {
		List<Object[]> Objectlist = service.getHouseByCriteria(Searchcriteria);
		List<Object[]> NewList = new ArrayList<Object[]>();
		int minNum = (page-1)*5;
		int maxNum = page*5;
		for(int i = minNum;i<maxNum;i++) {
			NewList.add(Objectlist.get(i));
		}	
		int totalList = Objectlist.size();
		int pageListNum = 5;
		double biggestPage =Math.ceil(totalList/pageListNum);
		model.addAttribute("pageListNum", pageListNum);
		model.addAttribute("biggestPage", biggestPage);
		model.addAttribute("totalList", totalList);
		model.addAttribute("NewList", NewList);
		return "search/searchPage_start_page";
	}
	
	//	關鍵字查詢
	@RequestMapping("/search/searchPage_Msg")
	public String searchPageByMsg(Model model, @RequestParam("msg") String msg) {
		List<Object[]> Objectlist = service.getHouseByMsg(msg);
		model.addAttribute("Objectlists", Objectlist);
		return "search/searchPage_start";
	}

	@RequestMapping(value = "/getPicture/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		HousePic bean = service.getHousePicById(id);
		if (bean != null) {

			Blob blob = bean.getPic();
			filename = "\\images\\HousePic0.jpg";
			if (blob != null) {

				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {

				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {

			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		String root = context.getRealPath("/");
		String filelocation = root.substring(0, root.length() - 1) + filepath;
		byte[] b = null;
		try {
			File file = new File(filelocation);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
}
