package com.iiiedu105.RentHouse.deal.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.io.*;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
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
import org.springframework.web.multipart.MultipartFile;
import com.iiiedu105.RentHouse.deal.service.HouseDealService;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDeal;

@Controller
@RequestMapping("/deal")
public class DealController {

	@Autowired
	HouseDealService service;

	@Autowired
	ServletContext context;

	public DealController() {
	}
//	@RequestMapping("/Test")
//	public String test() {
//		return "/deal/Test";
//	}
	//查詢單一房子所有歷年成交資訊
	@RequestMapping("/AllHouseDealForAnHouse/{houseId}")
	public String AllHouseDealForAMember(Model model,HttpServletRequest req,@PathVariable("houseId") Integer houseId) {
		List<HouseDeal> allHouseDeal = service.getHouseDealByHouseId(houseId);
		model.addAttribute("allHouseDeal",allHouseDeal);
		return "deal/AllHouseDealForAnHouse";
	}

	@RequestMapping(value="/MemberAllHouse")
	public String MemberAllHouse(Model model,HttpServletRequest req) {
//		Member member = req.getSession().getAttribute("user");
		String memberId = "abc123";
		List<House> houseList = service.getAllHouseByMemberId(memberId);
		model.addAttribute("houseList",houseList);
		return "deal/MemberAllHouse";
	}
	
	@RequestMapping(value = "/insertPage/{houseId}", method = RequestMethod.POST)
	public String AddNewHouseDeal(Model model, @PathVariable("houseId") Integer houseId,HttpServletRequest req,@RequestParam("file") MultipartFile file) {
		HouseDeal houseDeal = new HouseDeal();
		String from="",to="";
		int dealPrice=0;
		String path = "redirect:/membercontrol/houseRefactSelect";
		if(req != null) {
			from = req.getParameter("from");
			to = req.getParameter("to");
			dealPrice = Integer.valueOf(req.getParameter("dealPrice"));
		}
				
		String[] fromdata = from.split("/");
		String newfrom = fromdata[2] + "/" + fromdata[0] + "/" + fromdata[1];
		
		String[] todata = to.split("/");
		String newto = todata[2] + "/" + todata[0] + "/" + todata[1];
		House house = service.getHouseByHouseId(houseId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		try {
			Date dealDate = new Date(sdf.parse(newfrom).getTime());
			Date leaseDate = new Date(sdf.parse(newto).getTime());
			if(file.getOriginalFilename() !="") {
				String fileName = file.getOriginalFilename();			
				houseDeal.setPdf(fileToBlob(file));				
				houseDeal.setFileName(fileName);
				
			}
			houseDeal.setHouseBean(house);
			houseDeal.setDealDate(dealDate);
			houseDeal.setDealPrice(dealPrice);
			houseDeal.setLeaseDate(leaseDate);
			service.addHouseDeal(houseDeal);
		} catch (ParseException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}	catch (SQLException e) {
			e.printStackTrace();
		}			
		return path;
	}

	@RequestMapping(value = "/updatePage/{houseDealId}", method = RequestMethod.POST)
	public String processAddNewHouseDeal(@PathVariable("houseDealId") Integer houseDealId,
			 HttpServletRequest req, @RequestParam MultipartFile file) {
		HouseDeal hd = service.getHouseDealById(houseDealId);
		Integer id = hd.getHouseBean().getId();
		String path = "redirect:/deal/AllHouseDealForAnHouse/"+id;
		String from="",to="";
		int dealPrice=0;
		if(req != null) {
			from = req.getParameter("from");
			to = req.getParameter("to");
			dealPrice = Integer.valueOf(req.getParameter("dealPrice"));
		}
		String[] fromdata = from.split("/");
		String newfrom = "";
		String newto ="";
		if(fromdata.length>1) {
			newfrom = fromdata[2] + "/" + fromdata[0] + "/" + fromdata[1];
		}else {
			
			newfrom = from.replace("-", "/");
		}	
		String[] todata = to.split("/");
		if(todata.length>1) {
			newto = todata[2] + "/" + todata[0] + "/" + todata[1];
		}else {
			newto = to.replace("-", "/");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		try {
			Date dealDate = new Date(sdf.parse(newfrom).getTime());
			Date leaseDate = new Date(sdf.parse(newto).getTime());
			hd.setDealDate(dealDate);
			hd.setLeaseDate(leaseDate);
			hd.setDealPrice(dealPrice);
			if(file.getOriginalFilename() != "") {
				String fileName = file.getOriginalFilename();
				hd.setFileName(fileName);
				hd.setPdf(fileToBlob(file));
			}else {
				hd.setFileName(hd.getFileName());
				hd.setPdf(hd.getPdf());
			}				
			service.updateHouseDeal(hd);

		} catch (ParseException e) {
			System.out.println(e.getMessage());
		} catch (IOException io) {
			System.out.println(io.getMessage());
		} catch (SQLException io) {
			System.out.println(io.getMessage());
		}		
		return path;
	}
	
	public static Blob fileToBlob(MultipartFile file) throws IOException, SQLException, SQLException {
		byte[] b = file.getBytes();
		SerialBlob sb = null;
		sb = new SerialBlob(b);
		return sb;
	}
	
	@RequestMapping(value = "/getPdf/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "\\img\\NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		HouseDeal houseDeal = service.getHouseDealById(id);
		if (houseDeal != null) {
			Blob blob = houseDeal.getPdf();
			String fileName = houseDeal.getFileName();
			filename = "\\pdf\\"+fileName;
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
				} catch (SQLException e) {
					throw new RuntimeException("getpdf()發生SQLException: " + e.getMessage());
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