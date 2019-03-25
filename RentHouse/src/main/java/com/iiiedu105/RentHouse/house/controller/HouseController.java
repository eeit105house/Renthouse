package com.iiiedu105.RentHouse.house.controller;

import java.sql.Blob;
import java.sql.Clob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iiiedu105.RentHouse.ChangeClob;
import com.iiiedu105.RentHouse.house.service.HouseService;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioCheckOutOneTime;
import allPay.payment.integration.exception.AllPayException;

@Controller
public class HouseController {
	//clt+f 下面
	String fakeM = "abc123";//假定會員
	
	@Autowired
	HouseService houseService;
	@Autowired
	ServletContext context;
	@Autowired
	ChangeClob changeClob;
//	private Integer houseId = null;
	private String returnURL = "http://211.23.128.214:5000";
	private String orderResultURL = "http://localhost:8080/RentHouse/orderFinished/";
	private List<Map<String,String>> vipProjects;


	public HouseController() {
	}
	
	//選擇修改
	@RequestMapping(value="/houseRefactSelect")
	public String houseRefactSelect(Model model) {
		String mId = fakeM;	//假定會員
		Member memberBean = houseService.getMemberById(mId);
		List<House> houseList = houseService.getHousesByMemberId(mId);
//		for(House house: houseList) {
//			System.out.println(house.getDetailBean().getTitle()+house.getDetailBean().getId());
//		}
		Collections.sort(houseList, new Comparator<House>() {   
            @Override 
            public int compare(House arg0,House arg1) { 
                return arg0.getId().compareTo(arg1.getId());
            }
        });
//		for(House house: houseList) {
//			System.out.println(house.getDetailBean().getTitle()+house.getDetailBean().getId());
//		}
//		
		model.addAttribute("houseList", houseList);
		return "House/HouseRefactSelect";
	}
	//導入房屋圖片
	@RequestMapping(value="/houseRefactPic/{hId}")
	public String houseRefactPic(Model model,@PathVariable Integer hId,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("houseId", hId);
//		houseId = hId;
		return "redirect:/houseRefactPicture";
	}
	@RequestMapping(value="/houseRefactPicture",method=RequestMethod.GET)
	public String houseRefactPictureFormGet(Model model,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		House houseBean = houseService.findById(houseId);
		List<Integer> picIds = houseService.getPicIdsByHouse(houseBean);
		model.addAttribute("picIds", picIds);
		return "House/HouseRefactPic";
	}
	@RequestMapping(value="/houseRefactPicture",method=RequestMethod.POST)
	public String houseRefactPictureFormPost(Model model,@RequestParam(value = "pic") MultipartFile file0,@RequestParam(value = "picNo") Integer picNo,HttpServletRequest request) {
		System.out.println(picNo+"張圖片");
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		if(!file0.isEmpty())   {
			HousePic housePicBean = new HousePic(null, houseId, getImageBlob(file0), picNo);
			houseService.updatePictureByHouseIdAndPicNo(housePicBean);
		}
//			else if(!file.isEmpty()) {
//			HousePic housePicBean = new HousePic(null, houseId, getImageBlob(file), picNo);
//			houseService.updatePictureByHouseIdAndPicNo(housePicBean);
//		}
		return "redirect:/houseRefactPictureSuc";
	}
	@RequestMapping(value="/houseRefactPictureSuc")
	public String houseRefactPic(Model model) {
		return "redirect:/houseRefactPicture";
	}
	
	//導入房屋詳細
	@RequestMapping(value="/houseRefactDet/{hId}")
	public String houseRefactDetail(Model model,@PathVariable Integer hId,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("houseId", hId);
//		houseId = hId;
		return "redirect:/houseRefactDetail";
	}
	@RequestMapping(value="/houseRefactDetail",method=RequestMethod.GET)
	public String houseRefactDetailFormGet(Model model,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		HouseDetail detailBean = houseService.findById(houseId).getDetailBean();
		model.addAttribute("detailBean", detailBean);
		model.addAttribute("movingInStr", getStringBySqlDate(detailBean.getMovingIn(),"dd/MM/YYYY"));
		model.addAttribute("shortestN", detailBean.getShortest().substring(0, detailBean.getShortest().length()-1));
		model.addAttribute("defaultShortestN", detailBean.getShortest().substring(detailBean.getShortest().length()-1));
		model.addAttribute("defaultLe", detailBean.getLe());
		String cStr = "";
		try {
			cStr =detailBean.getInfo().getSubString(1, (int) detailBean.getInfo().length());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("houseInfo", cStr);
		return "House/HouseRefactDetail";
	}
	@RequestMapping(value="/houseRefactDetailE")
	public String houseRefactDetailFormGetE(Model model) {
		return "House/HouseRefactDetail";
	}
	
	@RequestMapping(value="/houseRefactDetail",method=RequestMethod.POST)
	public String houseRefactDetailFormPost(Model model, @ModelAttribute("detailBean") HouseDetail detailBean,HttpServletRequest request) throws ParseException {
//		House houseBean = houseService.findById(houseId);
//		detailBean.setId(houseBean.getDetailBean().getId());
//		detailBean.setHouseBean(houseBean);
		Map<String, String> errorMsg = new HashMap<String, String>();
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		House houseBean = houseService.findById(houseId);
		detailBean.setHouseBean(houseBean);
		if(detailBean.getTitle().equals(null) || detailBean.getTitle().length()==0)
			errorMsg.put("titleE", "必須有標題");
		if(request.getParameter("movingInN").equals(null) ||request.getParameter("movingInN").length()==0)
			errorMsg.put("movingInNE", "請選擇日期！");
		if(detailBean.getPrice()==null)
			errorMsg.put("priceE", "請輸入租金！");
		if(detailBean.getShortest().equals(null) || detailBean.getShortest().length()==0)
			errorMsg.put("shortestE", "請輸入最短租期！");
		if(detailBean.getHoaFee()==null)
			detailBean.setHoaFee(0);
		
		if (errorMsg.isEmpty()) {
			String infoN ="";
			if(!request.getParameter("infoN").equals(null) && request.getParameter("infoN").length()>0) 
				infoN =request.getParameter("infoN");
			detailBean.setInfo(changeClob.stringToClob(infoN));
			String movingInN = request.getParameter("movingInN");
			detailBean.setMovingIn(getSqlDateByString(movingInN,"dd/MM/YYYY"));
			String shortestN =request.getParameter("shortestN");
			detailBean.setShortest(detailBean.getShortest()+shortestN);

			houseService.updateHouseDetail(detailBean,houseId);
			return "redirect:/houseRefactSelect";
		} else {
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/houseRefactDetailE";
		}
	}
	
	
	//====View House=======
	@RequestMapping(value="/houseView/{shId}")
	public String viewHousePage(Model model,@PathVariable Integer shId) {
		House houseBean = houseService.findById(shId);
		Member memberBean = houseBean.getMemberBean();
		HouseDetail detailBean = houseBean.getDetailBean();
		List<Integer> picIds = houseService.getPicIdsByHouse(houseBean);
		model.addAttribute("houseBean", houseBean);
		model.addAttribute("memberBean", memberBean);
		model.addAttribute("detailBean", detailBean);
		model.addAttribute("picIds", picIds);
		String cStr = "";
		try {
			cStr =detailBean.getInfo().getSubString(1, (int) detailBean.getInfo().length());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("houseInfo", cStr);
		String movingInStr = getStringBySqlDate(detailBean.getMovingIn(),"YYYY年MM月dd日");
		model.addAttribute("movingInStr", movingInStr);
		String fakeName = memberBean.getName().substring(0, 1);
		if(memberBean.getSex().equalsIgnoreCase("MALE"))
			fakeName += "先生";
		else if(memberBean.getSex().equalsIgnoreCase("FEMALE"))
			fakeName += "小姐";
		else
			fakeName += "**";
		model.addAttribute("fakeName", fakeName);
		if(!detailBean.getAppliance().equals(null) && detailBean.getAppliance().length()>0) {
			List<String> appliance = Arrays.asList(detailBean.getAppliance().split(";"));
			model.addAttribute("applianceList", appliance);
		} else {
			model.addAttribute("applianceList", "無提供設備");
		}
		if(!detailBean.getFurniture().equals(null) && detailBean.getFurniture().length()>0) {
			List<String> furniture = Arrays.asList(detailBean.getFurniture().split(";"));
			model.addAttribute("furnitureList", furniture);
		} else {
			model.addAttribute("furnitureList", "無提供家具");
		}
		if(!detailBean.getInclude().equals(null) && detailBean.getInclude().length()>0) {
			String includeList = detailBean.getInclude().replace(";", "、");
			List<String> include = Arrays.asList(detailBean.getInclude().split(";"));
			model.addAttribute("includeList", includeList);
		} else {
			model.addAttribute("includeList", "無包含其餘費用");
		}
		if(!detailBean.getLe().equals(null) && detailBean.getLe().length()>0) {
			List<String> le = Arrays.asList(detailBean.getLe().split(";"));
			model.addAttribute("leList", le);
		} else {
			model.addAttribute("leList", "無");
		}
		if(!detailBean.getIndetity().equals(null) && detailBean.getIndetity().length()>0) {
			List<String> indetity = Arrays.asList(detailBean.getIndetity().split(";"));
			model.addAttribute("indetityList", indetity);
		} else {
			model.addAttribute("indetityList", "無身分限制");
		}

		return "House/HouseView";
	}

	//Get Picture
	@RequestMapping(value="/houseView/hPic/{picId}", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, @PathVariable Integer picId) {
		String filePath = "/WEB-INF/views/images/NoImage.jpg";
		HousePic housePicBean = houseService.getPicById(picId);
	    byte[] media = null;
	    HttpHeaders headers = new HttpHeaders();
	    String filename = "";
	    int len = 0;
	    if(housePicBean !=null) {
	    	
	    	Blob blob = housePicBean.getPic();
	    	if(blob!=null) {
		    	try {
		    		len=(int) blob.length();
		    		media=blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController.getImage()發生SQLException："+e.getMessage());
				}
	    	} else {
//	    		media=toByteArray(filePath);
//		    	filename=filePath;
	    	}
	    	
	    } else {
//	    	media=toByteArray(filePath);
//	    	filename=filePath;
	    }
	    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf("image/jpeg");
//		System.out.println("Media Type = "+mimeType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = 
				new ResponseEntity<>(media,headers,HttpStatus.OK);
		
		return responseEntity;
	}
//	
	//=====新增房屋=====
	@RequestMapping(value = "/house", method = RequestMethod.GET)
	public String getAddNewHouseForm(Model model) {
		House houseBean = new House();
		model.addAttribute("houseBean", houseBean);
		return "House/HouseForm";
	}

	@RequestMapping(value = "/houseE")
	public String getAddNewHouseFormE(Model model) {
		House houseBean = new House();
		model.addAttribute("houseBean", houseBean);
		return "House/HouseForm";
	}

	@RequestMapping(value = "/house", method = RequestMethod.POST)
	public String addNewHouse(Model model, @ModelAttribute("houseBean") House houseBean, BindingResult br,HttpServletRequest request) {
		Map<String, String> errorMsg = new HashMap<String, String>();
			houseBean.setMemberId(fakeM);//假定會員
		if (houseBean.getAddr().equals(null) || houseBean.getAddr().length() == 0 || houseBean.getCity().equals(null)
				|| houseBean.getCity().length() == 0 || houseBean.getBoroughs().equals(null)
				|| houseBean.getBoroughs().length() == 0) {
			errorMsg.put("addrE", "地址未輸入完成！");
		}
		if (houseBean.getSqft() == null || houseBean.getSqft() == 0)
			errorMsg.put("sqftE", "坪數未輸入完成！");
		if (houseBean.getBuild().equals(null) || houseBean.getBuild().length() == 0)
			errorMsg.put("buildE", "建築型態未選擇完成！");
		if (houseBean.getType().equals(null) || houseBean.getType().length() == 0)
			errorMsg.put("typeE", "住房類型未選擇完成！");
		if (houseBean.getFloor() == null || houseBean.getFloor() == 0)
			errorMsg.put("floorE", "樓層未輸入完成！");
		if (houseBean.getTopFloor() == null || houseBean.getTopFloor() < 0)
			errorMsg.put("topfloorE", "頂樓樓層未輸入完成！");
		if (houseBean.getLayout().equals(null) || houseBean.getLayout().length() == 0)
			errorMsg.put("layoutE", "格局未輸入完成！(例：3房2廳，樓中樓......");
		if (errorMsg.isEmpty()) {
			houseService.insertHouse(houseBean);
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("houseId", houseBean.getId());
//			houseId = houseBean.getId();
			return "redirect:/houseDetail";
		} else {
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/houseE";
		}
	}

	@RequestMapping(value = "/houseDetail", method = RequestMethod.GET)
	public String getAddNewHouseFormDetail(Model model) {
		HouseDetail detailBean = new HouseDetail();
		model.addAttribute("detailBean", detailBean);
		return "House/HouseFormDetail";
	}
	@RequestMapping(value = "/houseDetailE")
	public String getAddNewHouseFormDetailE(Model model) {
		HouseDetail detailBean = new HouseDetail();
		model.addAttribute("detailBean", detailBean);
		return "House/HouseFormDetail";
	}

	@RequestMapping(value = "/houseDetail", method = RequestMethod.POST)
	public String addNewHouseFormDetail(Model model, @ModelAttribute("detailBean") HouseDetail detailBean,
			HttpServletRequest request) throws ParseException {
		Map<String, String> errorMsg = new HashMap<String, String>();
		String infoN = "";
		HttpSession httpSession = request.getSession();
		House houseBean = houseService.findById((Integer) httpSession.getAttribute("houseId"));
		detailBean.setHouseBean(houseBean);
		if(detailBean.getTitle().equals(null) || detailBean.getTitle().length()==0)
			errorMsg.put("titleE", "必須有標題");
		if(request.getParameter("movingInN").equals(null) ||request.getParameter("movingInN").length()==0)
			errorMsg.put("movingInNE", "請選擇日期！");
		if(detailBean.getPrice()==null)
			errorMsg.put("priceE", "請輸入租金！");
		if(detailBean.getShortest().equals(null) || detailBean.getShortest().length()==0)
			errorMsg.put("shortestE", "請輸入最短租期！");
		if(detailBean.getHoaFee()==null)
			detailBean.setHoaFee(0);

		if (errorMsg.isEmpty()) {
			if(!request.getParameter("infoN").equals(null) && request.getParameter("infoN").length()>0) 
				infoN=request.getParameter("infoN");
			detailBean.setInfo(changeClob.stringToClob(infoN));
			String movingInN = request.getParameter("movingInN");
			detailBean.setMovingIn(getSqlDateByString(movingInN,"dd/MM/YYYY"));
			String shortestN =request.getParameter("shortestN");
			detailBean.setShortest(detailBean.getShortest()+shortestN);
			
			houseService.insertDetail(detailBean);
			return "redirect:/housePic";
		} else {
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/houseDetailE";
		}
	}

	@RequestMapping(value = "/housePic", method = RequestMethod.GET)
	public String getAddNewHouseFormPic(Model model) {
		return "House/HouseFormPic";
	}
	@RequestMapping(value = "/housePicE")
	public String getAddNewHouseFormPicE(Model model) {
		return "House/HouseFormPic";
	}

	@RequestMapping(value = "/housePic", method = RequestMethod.POST)
	public String addNewHouseFormPic(Model model, @RequestParam(value = "pic0") MultipartFile file0,
			@RequestParam(value = "pics") MultipartFile[] file,HttpServletRequest request) {
		Map<String, String> errorMsg = new HashMap<String, String>();
//		House houseBean = houseService.findById(houseId);
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		House houseBean = houseService.findById(houseId);
		if(file0.isEmpty()) {
			errorMsg.put("pic0None", "必須有封面");
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/housePicE";
		}
		String contentType= file0.getContentType();
		System.out.println("upload："+contentType);
		if(!contentType.equals("image/jpeg")){
			errorMsg.put("typeE", "請上傳jpeg檔");
		}
		String imageName;
		Blob blob;
		blob = getImageBlob(file0);
		HousePic housePicBean0 = new HousePic(null, houseId, blob, 0);
		housePicBean0.setHouseBean(houseBean);
		houseService.insertPicture(housePicBean0);
		int i = 1;
		List<HousePic> picBeans = new LinkedList<HousePic>();
		for (MultipartFile mf : file) {
			if (!mf.isEmpty()) {

				// 获得文件类型（可以判断如果不是图片，禁止上传）
				contentType = mf.getContentType();
				if(!contentType.equals("image/jpeg")){
					errorMsg.put("typeE", "請上傳jpeg檔");
					break;
				}
				// 获得文件后缀名称
				blob = getImageBlob(file0);
				HousePic housePicBean = new HousePic(null, houseId, blob, i);
				housePicBean.setHouseBean(houseBean);
				picBeans.add(housePicBean);
				imageName = contentType.substring(contentType.indexOf("/") + 1);
				i += 1;
			}
			if (i == 10)
				break;
		}
		if(errorMsg.isEmpty()) {
			for(HousePic housePicBean:picBeans) {
				houseService.insertPicture(housePicBean);
			}
			return "redirect:/houseOrder";
		}
		return "forward:/housePicE";
	}

	@RequestMapping(value = "/houseOrder", method = RequestMethod.GET)
	public String getAddNewHouseOrderForm(Model model) {
		theVipProject();
		Object command = new Object();
		model.addAttribute("VipProjects", vipProjects);
		model.addAttribute("command", command);
		return "House/HouseFormOrder";
	}
	@RequestMapping(value = "/houseOrder", method = RequestMethod.POST)
	public String postAddNewHouseOrderForm(Model model,@RequestParam String vip) {		
		if(!vip.equals(null) || vip.length()!=0) {
			for(Map<String,String> vipProject:vipProjects) {
				if(vipProject.get("pNumber").equals(vip)) {
					return "redirect:/houseOrderSelect/"+vip;
				}
			}
		}
		Map<String, String> errorMsg = new HashMap<String, String>();
		errorMsg.put("orderE", "請由此選擇方案");
		return "forward:/houseOrderE";
	}
	@RequestMapping(value = "/houseOrderE")
	public String getAddNewHouseOrderFormE(Model model) {
		return "House/HouseFormOrder";
	}
	@RequestMapping(value = "/houseOrderSelect/{vip}",produces="text/html;charset=UTF-8")
	public @ResponseBody String toAllPay(Model model, @PathVariable String vip) {
		AioCheckOutOneTime aio = new AioCheckOutOneTime();
		AllInOne all = new AllInOne("");
		System.out.println(aio.getRemark());
//		InvoiceObj invoice = new InvoiceObj();
		String itemName = null,totalAmount = null,tradeDesc = null;
		for(Map<String,String> vipProject:vipProjects) {
			if(vipProject.get("pNumber").equals(vip)) {
				itemName=vipProject.get("pNumber");
				totalAmount=vipProject.get("pPrice");
				tradeDesc=vipProject.get("pName")+"："+vipProject.get("pInfo");
			}
		}
		//模擬不開發票
//		invoice = null;
		//廠商系統自行產生
		SimpleDateFormat sdf = new SimpleDateFormat();
		java.util.Date date = new java.util.Date();
		
		sdf.applyPattern("yyyyMMdd");
		aio.setMerchantTradeNo("EEIT105RH"+sdf.format(date)+UUID.randomUUID().toString().replaceAll("-", "").substring(0, 3));
		//廠商可自行決定交易時間
		sdf.applyPattern("yyyy/MM/dd hh:mm:ss");
		aio.setMerchantTradeDate(sdf.format(date));
		//從廠商DB撈出的商品資訊
		aio.setItemName(itemName);
		aio.setTotalAmount(totalAmount);
		aio.setTradeDesc(tradeDesc);
		//廠商可自行決定是否延遲撥款
		aio.setHoldTradeAMT("0");
		//後端設定付款完成通知回傳網址
		aio.setReturnURL(returnURL);
		aio.setOrderResultURL(orderResultURL+vip);
		try{
			String html = all.aioCheckOut(aio);
			System.out.println(html);
			return html;
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
//		return "";
	}
	
	@RequestMapping(value = "/orderFinished/{pay}", method = RequestMethod.POST)
	public String orderFinishedPage(Model model, HttpServletRequest request,@PathVariable Integer pay) throws ParseException {
		int rtnCode  = Integer.parseInt(request.getParameter("RtnCode"));
		String rtnMsg = request.getParameter("RtnMsg"),
				tradeDate  = request.getParameter("TradeDate");
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		if(rtnCode==1 && rtnMsg.equals("Succeeded") ) {
			Timestamp timestamp = getTimestampByString(tradeDate,"yyyy/MM/dd HH:mm:ss");
			houseService.orderFinishied(houseId, timestamp,pay);
		}
		System.out.println(rtnCode+"\n"+rtnMsg+"\n"+tradeDate);
		return "redirect:/houseRefactSelect";
	}
	
	//Extra Code
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

	
	private Timestamp getTimestampByString(String dateStr,String dateFormat) throws ParseException {
		SimpleDateFormat sDF = new SimpleDateFormat(dateFormat);
		sDF.setLenient(false);
		Timestamp timestamp = new Timestamp(sDF.parse(dateStr).getTime());
		return timestamp;
	}
	
	private Date getSqlDateByString(String dateStr,String dateFormat) throws ParseException {
		SimpleDateFormat sDF = new SimpleDateFormat(dateFormat);
//		SimpleDateFormat sDF = new SimpleDateFormat("dd/MM/YYYY");
		sDF.setLenient(false);
		Date date = new Date(sDF.parse(dateStr).getTime());
		return date;
	}
	
	private String getStringBySqlDate(Date date,String dateFormat) {
		java.util.Date javaDate = new java.util.Date(date.getTime());
		SimpleDateFormat sDF = new SimpleDateFormat(dateFormat);
		sDF.setLenient(false);
		String yYYYMMdd = sDF.format(javaDate);
		return yYYYMMdd;
	}
	
	private void theVipProject() {
		vipProjects =new  LinkedList<Map<String,String>>();
		Map<String,String> normal = new HashMap<>();
		normal.put("pName", "普通刊登");
		normal.put("pPrice", "500");
		normal.put("pNumber", "0");
		normal.put("pInfo", "普通刊登");
		vipProjects.add(normal);
		Map<String,String> vip = new HashMap<>();
		vip.put("pName", "高級刊登");
		vip.put("pPrice", "1000");
		vip.put("pNumber", "1");
		vip.put("pInfo", "可享有優先搜尋");
		vipProjects.add(vip);
		Map<String,String> superVip = new HashMap<>();
		superVip.put("pName", "超高級刊登");
		superVip.put("pPrice", "2000");
		superVip.put("pNumber", "2");
		superVip.put("pInfo", "可享有優先搜尋及輪播牆");
		vipProjects.add(superVip);
	}
}
