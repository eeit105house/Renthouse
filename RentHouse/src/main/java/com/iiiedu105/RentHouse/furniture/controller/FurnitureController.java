package com.iiiedu105.RentHouse.furniture.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iiiedu105.RentHouse.ChangeClob;
import com.iiiedu105.RentHouse.furniture.service.FurnitureServise;
import com.iiiedu105.RentHouse.model.Furniture;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.Member;

@Controller
public class FurnitureController {
	@Autowired
	FurnitureServise furnitureServise;
	@Autowired
	ServletContext context;
	@Autowired
	ChangeClob changeClob;

	public FurnitureController() {
	}

	// 選擇修改
	@RequestMapping(value = "/membercontrol/furnitureRefactSelect")
	public String furnitureRefactSelect(Model model, HttpServletRequest request) {
//			String mId = fakeM;	//假定會員
		HttpSession httpSession = request.getSession();
		Member member = (Member) httpSession.getAttribute("user");
		if (member == null)
			return "redirect:/";
//			Member memberBean = houseService.getMemberById(member.getId());
		List<Furniture> furnitureList = furnitureServise.getFurnituresByMemberId(member.getId());

		Collections.sort(furnitureList, new Comparator<Furniture>() {
			@Override
			public int compare(Furniture arg0, Furniture arg1) {
				return arg0.getId().compareTo(arg1.getId());
			}
		});
//			for(House house: houseList) {
//				System.out.println(house.getDetailBean().getTitle()+house.getDetailBean().getId());
//			}
//		for (House house : houseList) {
//			System.out.println(house.getId());
//		}
		model.addAttribute("furnitureList", furnitureList);
		return "Furniture/FurnitureRefactSelect";
	}

	@RequestMapping(value="/membercontrol/furnitureRefact/{fuId}",method=RequestMethod.GET)
	public String houseRefactDetailFormGet(Model model,HttpServletRequest request,@PathVariable Integer fuId) {
		HttpSession httpSession = request.getSession();
		Member member = (Member) httpSession.getAttribute("user");
		if(member == null)
			return "redirect:/";

		Furniture furnitureBean = furnitureServise.findById(fuId);
		if(!(furnitureBean.getMemberBean().getId().equals(member.getId())))
			return "redirect:/";
		model.addAttribute("furnitureBean", furnitureBean);
		String cStr = "";
//		try {
//			cStr =detailBean.getInfo().getSubString(1, (int) detailBean.getInfo().length());
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		cStr = changeClob.ClobToString(furnitureBean.getInfo());

		model.addAttribute("furnitureInfo", cStr);
		return "Furniture/FurnitureRefactForm";
	}
	@RequestMapping(value = "/membercontrol/furnitureRefact/{fuId}", method = RequestMethod.POST)
	public String houseRefactDetailFormPost(Model model, @ModelAttribute("furnitureBean") Furniture furnitureBean,
			HttpServletRequest request, @RequestParam(value = "pic") MultipartFile file,@PathVariable Integer fuId) {
		Map<String, String> errorMsgFu = new HashMap<String, String>();
		if (furnitureBean.getTitle() == null || furnitureBean.getTitle().trim().length() == 0)
			errorMsgFu.put("titleE", "請輸入標題");
		if (furnitureBean.getAddr() == null || furnitureBean.getAddr().trim().length() == 0)
			errorMsgFu.put("addrE", "請輸入地址");
		if (furnitureBean.getDelvery() == null || furnitureBean.getDelvery().trim().length() == 0)
			errorMsgFu.put("delveryE", "請輸入取貨方式");
		if (furnitureBean.getType() == null || furnitureBean.getType().trim().length() == 0)
			errorMsgFu.put("typeE", "請選擇類型");
		if (furnitureBean.getPrice() == null)
			errorMsgFu.put("priceE", "請輸入價格");
//			errorMsgFu.put("picNone", "必須有照片");

		if (errorMsgFu.isEmpty()) {
			String infoN = "";
			if (request.getParameter("infoN") != null && request.getParameter("infoN").trim().length() > 0)
				infoN = request.getParameter("infoN");
			furnitureBean.setInfo(changeClob.stringToClob(infoN));
			if (!file.isEmpty())
				furnitureBean.setPhoto(getImageBlob(file));

			HttpSession httpSession = request.getSession();
			Member memberbean = (Member) httpSession.getAttribute("user");
			furnitureBean.setMemberBean(memberbean);
			furnitureServise.updateFurniture(furnitureBean);
			return "redirect:/furnitureRefactSelects";
		}
		model.addAttribute("errorMsgFu", errorMsgFu);
		return "forward:/membercontrol/furnitureRefactE";
	}
	
	@RequestMapping(value = "/membercontrol/furnitureRefactE")
	public String addFurnitureRefactFormGetE(Model model) {
//		Furniture furnitureBean = new Furniture();
//		model.addAttribute("furnitureBean", furnitureBean);
		return "Furniture/FurnitureRefactForm";
	}
	
	@ModelAttribute(name="typeList")
	public List<String> typeList(){
		List<String> typeList = new ArrayList<>();
		typeList.add("電器");
		typeList.add("桌椅");
		typeList.add("櫃子");
		typeList.add("床具");
		typeList.add("其它");
		return typeList;
	}
	// ====檢視=======
	@RequestMapping(value = "/furnitureViewAll")
	public String viewAllFurniturePages(Model model) {
		model.addAttribute("member", new Member());
		model.addAttribute("furnitureList", furnitureServise.getFurnituresOrderbyId());
		return "Furniture/FurnitureSelectList";
	}
	@RequestMapping(value = "/furnitureViewByType")
	public String viewTypeFurniturePages(Model model,@RequestParam String types) {
		model.addAttribute("member", new Member());
		model.addAttribute("furnitureMap", furnitureServise.getFurnituresOrderbyTypes(types));
//		for(String ty:typeList()) {
//			for(Furniture typeList:furnitureServise.getFurnituresOrderbyTypes(types).get(ty))
//			System.out.println(typeList.getTitle()  + typeList.getType());
//		}
		return "Furniture/FurnitureSelectList";
	}
	@RequestMapping(value = "/furnitureView/{fuId}")
	public String viewFurniturePage(Model model, @PathVariable Integer fuId) {
		Furniture furnitureBean = furnitureServise.findById(fuId);
		Member memberBean = furnitureBean.getMemberBean();
//		List<Integer> picIds = furnitureServise.getPicIdsByHouse(houseBean);
		model.addAttribute("furnitureBean", furnitureBean);
		model.addAttribute("memberBean", memberBean);
		model.addAttribute("member", new Member());
//		model.addAttribute("picIds", picIds);
		String cStr = "";
//			try {
//				cStr =detailBean.getInfo().getSubString(1, (int) detailBean.getInfo().length());
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
		cStr = changeClob.ClobToString(furnitureBean.getInfo());

		model.addAttribute("furnitureInfo", cStr);
//		String movingInStr = getStringBySqlDate(detailBean.getMovingIn(), "YYYY年MM月dd日");
//		model.addAttribute("movingInStr", movingInStr);
		String fakeName = memberBean.getName().substring(0, 1);
		if (memberBean.getSex().equalsIgnoreCase("MALE"))
			fakeName += "先生";
		else if (memberBean.getSex().equalsIgnoreCase("FEMALE"))
			fakeName += "小姐";
		else
			fakeName += "**";
		model.addAttribute("fakeName", fakeName);
		return "Furniture/FurnitureView";
	}

	// Get Picture
	@RequestMapping(value = "/furnitureView/fuPic/{fuId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, @PathVariable Integer fuId) {
		String filePath = "/WEB-INF/views/images/NoImage.jpg";
		Furniture furnitureBean = furnitureServise.findById(fuId);
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		if (furnitureBean != null) {

			Blob blob = furnitureBean.getPhoto();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController.getImage()發生SQLException：" + e.getMessage());
				}
			} else {
//		    		media=toByteArray(filePath);
//			    	filename=filePath;
			}
		} else {
//		    	media=toByteArray(filePath);
//		    	filename=filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//			String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf("image/jpeg");
//			System.out.println("Media Type = "+mimeType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		return responseEntity;
	}
	//

	// 新增
	@RequestMapping(value = "/newFurniture", method = RequestMethod.GET)
	public String addFurnitureFormGet(Model model, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		Member member = (Member) httpSession.getAttribute("user");
		if (member == null)
			return "redirect:/furnitureRefactSelect";
		Furniture furnitureBean = new Furniture();
		model.addAttribute("furnitureBean", furnitureBean);
		return "Furniture/FurnitureForm";
	}

	@RequestMapping(value = "/newFurniture/furnitureE")
	public String addFurnitureFormGetE(Model model) {
//		Furniture furnitureBean = new Furniture();
//		model.addAttribute("furnitureBean", furnitureBean);
		return "Furniture/FurnitureForm";
	}

	@RequestMapping(value = "/newFurniture", method = RequestMethod.POST)
	public String addFurnitureFormPost(Model model, @ModelAttribute("furnitureBean") Furniture furnitureBean,
			HttpServletRequest request, @RequestParam(value = "pic") MultipartFile file) {
		Map<String, String> errorMsgFu = new HashMap<String, String>();
		if (furnitureBean.getTitle() == null || furnitureBean.getTitle().trim().length() == 0)
			errorMsgFu.put("titleE", "請輸入標題");
		if (furnitureBean.getAddr() == null || furnitureBean.getAddr().trim().length() == 0)
			errorMsgFu.put("addrE", "請輸入地址");
		if (furnitureBean.getDelvery() == null || furnitureBean.getDelvery().trim().length() == 0)
			errorMsgFu.put("delveryE", "請輸入取貨方式");
		if (furnitureBean.getType() == null || furnitureBean.getType().trim().length() == 0)
			errorMsgFu.put("typeE", "請選擇類型");
		if (furnitureBean.getPrice() == null)
			errorMsgFu.put("priceE", "請輸入價格");
		if (file.isEmpty())
			errorMsgFu.put("picNone", "必須有照片");

		if (errorMsgFu.isEmpty()) {
			String infoN = "";
			if (request.getParameter("infoN") != null && request.getParameter("infoN").trim().length() > 0)
				infoN = request.getParameter("infoN");
			furnitureBean.setInfo(changeClob.stringToClob(infoN));
			furnitureBean.setPhoto(getImageBlob(file));

			HttpSession httpSession = request.getSession();
			Member memberbean = (Member) httpSession.getAttribute("user");
			furnitureBean.setMemberBean(memberbean);
			furnitureServise.insertFurniture(furnitureBean);
			return "redirect:/";
		}
		model.addAttribute("errorMsgFu", errorMsgFu);
		return "forward:/newFurniture/furnitureE";
	}

	// Extra Code
	private Blob getImageBlob(MultipartFile mf) {
		Blob blob;
		try {
			byte b[] = mf.getBytes();
			blob = new SerialBlob(b);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("上船異常：" + e.getMessage());
			throw new RuntimeException(e);
		}
		return blob;
	}

}
