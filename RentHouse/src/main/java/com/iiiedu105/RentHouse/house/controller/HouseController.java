package com.iiiedu105.RentHouse.house.controller;

import java.sql.Blob;
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
import com.iiiedu105.RentHouse.model.Furniture;
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
//	String fakeM = "abc123";//假定會員
	
	///newHouse
	//membercontrol
	@Autowired
	HouseService houseService;
	@Autowired
	ServletContext context;
	@Autowired
	ChangeClob changeClob;
//	private Integer houseId = null;
	private String  returnURL = "http://211.23.128.214:5000";
//	private String orderResultURL = "http://localhost:8080/RentHouse/orderFinished/";
	private String orderResultURL = "http://eeit105house.southeastasia.cloudapp.azure.com:8080/RentHouse/orderFinished/";
	private List<Map<String,String>> vipProjects = theVipProject();


	public HouseController() {
	}
	
	//選擇修改
	@RequestMapping(value="/membercontrol/houseRefactSelect")
	public String houseRefactSelect(Model model,HttpServletRequest request) {
//		String mId = fakeM;	//假定會員
		HttpSession httpSession = request.getSession();
		Member member = (Member) httpSession.getAttribute("user");
		if(member == null)
			return "redirect:/";
//		Member memberBean = houseService.getMemberById(member.getId());
		List<House> houseList = houseService.getHousesByMemberId(member.getId());
		System.out.println(member.getId()+"/mid");
		Collections.sort(houseList, new Comparator<House>() {   
            @Override 
            public int compare(House arg0,House arg1) { 
                return arg0.getId().compareTo(arg1.getId());
            }
        });
//		for(House house: houseList) {
//			System.out.println(house.getDetailBean().getTitle()+house.getDetailBean().getId());
//		}
		for(House house: houseList) {
			System.out.println(house.getId());
		}
		model.addAttribute("houseList", houseList);
		return "House/HouseRefactSelect";
	}
	//重新上架房屋
	@RequestMapping(value="/membercontrol/houseRePost/{hId}")
	public String houseRePost(Model model,@PathVariable Integer hId,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("houseId", hId);
		return "redirect:/newHouse/houseOrder";
	}
	//下架房屋
	@RequestMapping(value="/membercontrol/houseDontPost/{hId}")
	public String houseDontPost(Model model,@PathVariable Integer hId,HttpServletRequest request) {
		houseService.dontPostHouseById(hId);
		return "redirect:/membercontrol/houseRefactSelect";
	}
	//導入房屋圖片
	@RequestMapping(value="/membercontrol/houseRefactPic/{hId}")
	public String houseRefactPic(Model model,@PathVariable Integer hId,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("houseId", hId);
//		houseId = hId;
		return "redirect:/membercontrol/houseRefactPicture";
	}

	@RequestMapping(value="/membercontrol/houseRefactPicture",method=RequestMethod.GET)
	public String houseRefactPictureFormGet(Model model,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		House houseBean = houseService.findById(houseId);
		
		Member member = (Member) httpSession.getAttribute("user");
		if(member == null)
			return "redirect:/";
		if(!(houseBean.getMemberBean().getId().equals(member.getId())))
			return "redirect:/";
		List<Integer> picIdsList = houseService.getPicIdsByHouse(houseBean);
		if(picIdsList.isEmpty()) {
			return "redirect://newHouse/housePic";
		}
		Map<Integer, Integer> picIds = houseService.getPicNumberWithIdByIds(picIdsList);
		model.addAttribute("picIds", picIds);
		model.addAttribute("picId0", picIds.get(0));
		return "House/HouseRefactPic";
	}
	@RequestMapping(value="/membercontrol/houseRefactPicture",method=RequestMethod.POST)
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
		httpSession.removeAttribute("houseId");
		return "redirect:/membercontrol/houseRefactPictureSuc";
	}
	@RequestMapping(value="/membercontrol/houseRefactPictureSuc")
	public String houseRefactPic(Model model) {
		return "redirect:/membercontrol/houseRefactPicture";
	}
	
	//導入房屋詳細
	@RequestMapping(value="/membercontrol/houseRefactDet/{hId}")
	public String houseRefactDetail(Model model,@PathVariable Integer hId,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("houseId", hId);
//		houseId = hId;
		return "redirect:/membercontrol/houseRefactDetail";
	}

	@RequestMapping(value="/membercontrol/houseRefactDetail",method=RequestMethod.GET)
	public String houseRefactDetailFormGet(Model model,HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		HouseDetail detailBean = houseService.findById(houseId).getDetailBean();
		Member member = (Member) httpSession.getAttribute("user");
		if(detailBean == null) {
			detailBean = new HouseDetail();
			model.addAttribute("detailBean", detailBean);
			return "redirect:/newHouse/houseDetail";
		}
		if(member == null)
			return "redirect:/";
		if(!(detailBean.getHouseBean().getMemberBean().getId().equals(member.getId())))
			return "redirect:/";
		
		model.addAttribute("detailBean", detailBean);
		model.addAttribute("movingInStr", getStringBySqlDate(detailBean.getMovingIn(),"MM/dd/YYYY"));
		model.addAttribute("shortestN", detailBean.getShortest().substring(0, detailBean.getShortest().length()-1));
		model.addAttribute("defaultShortestN", detailBean.getShortest().substring(detailBean.getShortest().length()-1));
		model.addAttribute("defaultLe", detailBean.getLe());
		String cStr = "";
		try {
			cStr =detailBean.getInfo().getSubString(1, (int) detailBean.getInfo().length());
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		cStr =changeClob.ClobToString(detailBean.getInfo());
//		cStr = detailBean.getInfo().getSubString(1, (int) detailBean.getInfo().length());
	;	System.out.println(cStr);
		model.addAttribute("houseInfo", cStr);
		return "House/HouseRefactDetail";
	}
	@RequestMapping(value="/membercontrol/houseRefactDetailE")
	public String houseRefactDetailFormGetE(Model model) {
		return "House/HouseRefactDetail";
	}
	
	@RequestMapping(value="/membercontrol/houseRefactDetail",method=RequestMethod.POST)
	public String houseRefactDetailFormPost(Model model, @ModelAttribute("detailBean") HouseDetail detailBean,HttpServletRequest request) throws ParseException {
//		House houseBean = houseService.findById(houseId);
//		detailBean.setId(houseBean.getDetailBean().getId());
//		detailBean.setHouseBean(houseBean);
		Map<String, String> errorMsg = new HashMap<String, String>();
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		House houseBean = houseService.findById(houseId);
		detailBean.setHouseBean(houseBean);
		if(detailBean.getTitle()==null || detailBean.getTitle().trim().length()==0)
			errorMsg.put("titleE", "必須有標題");
		if(request.getParameter("movingInN")==null ||request.getParameter("movingInN").trim().length()==0)
			errorMsg.put("movingInNE", "請選擇日期！");
		if(detailBean.getPrice()==null)
			errorMsg.put("priceE", "請輸入租金！");
		if(detailBean.getShortest()==null || detailBean.getShortest().trim().length()==0)
			errorMsg.put("shortestE", "請輸入最短租期！");
		if(detailBean.getHoaFee()==null)
			detailBean.setHoaFee(0);
		
		if (errorMsg.isEmpty()) {
			String infoN ="";
			if(request.getParameter("infoN")!=null && request.getParameter("infoN").trim().length()>0) 
				infoN =request.getParameter("infoN");
			detailBean.setInfo(changeClob.stringToClob(infoN));
			String movingInN = request.getParameter("movingInN");
			detailBean.setMovingIn(getSqlDateByString(movingInN,"MM/dd/YYYY"));
			String shortestN =request.getParameter("shortestN");
			detailBean.setShortest(detailBean.getShortest()+shortestN);

			houseService.updateHouseDetail(detailBean,houseId);
			httpSession.removeAttribute("houseId");
			return "redirect:/membercontrol/houseRefactSelect";
		} else {
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/membercontrol/houseRefactDetailE";
		}
	}
	
	
	//====檢視 House=======
	@RequestMapping(value="/houseView/{shId}")
	public String viewHousePage(Model model,@PathVariable Integer shId) {
		House houseBean = houseService.findById(shId);
		Member memberBean = houseBean.getMemberBean();
		HouseDetail detailBean = houseBean.getDetailBean();
		List<Integer> picIds = houseService.getPicIdsByHouse(houseBean);
		model.addAttribute("houseBean", houseBean);
		model.addAttribute("memberBean", memberBean);
		model.addAttribute("member", new Member());//註冊用
		model.addAttribute("detailBean", detailBean);
		model.addAttribute("picIds", picIds);
		String cStr = "";
//		try {
//			cStr =detailBean.getInfo().getSubString(1, (int) detailBean.getInfo().length());
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		cStr =changeClob.ClobToString(detailBean.getInfo());

		model.addAttribute("houseInfo", cStr);
		String movingInStr = getStringBySqlDate(detailBean.getMovingIn(),"YYYY年MM月dd日");
		model.addAttribute("movingInStr", movingInStr);
		String fakeName = memberBean.getName().substring(0, 1);
		if(memberBean.getSex()==null)
			fakeName += "**";
		else {
			if(memberBean.getSex().equalsIgnoreCase("MALE"))
				fakeName += "先生";
			else if(memberBean.getSex().equalsIgnoreCase("FEMALE"))
				fakeName += "小姐";
			else
				fakeName += "**";			
		}
		model.addAttribute("fakeName", fakeName);
		if(detailBean.getAppliance()!=null && detailBean.getAppliance().trim().length()>0) {
			List<String> appliance = Arrays.asList(detailBean.getAppliance().split(";"));
			model.addAttribute("applianceList", appliance);
		} else {
			model.addAttribute("applianceList", "無提供設備");
		}
		if(detailBean.getFurniture()!=null && detailBean.getFurniture().trim().length()>0) {
			List<String> furniture = Arrays.asList(detailBean.getFurniture().split(";"));
			model.addAttribute("furnitureList", furniture);
		} else {
			model.addAttribute("furnitureList", "無提供家具");
		}
		if(detailBean.getInclude()!=null && detailBean.getInclude().trim().length()>0) {
			String includeList = detailBean.getInclude().replace(";", "、");
			List<String> include = Arrays.asList(detailBean.getInclude().split(";"));
			model.addAttribute("includeList", includeList);
		} else {
			model.addAttribute("includeList", "無包含其餘費用");
		}
		if(detailBean.getLe()!=null && detailBean.getLe().trim().length()>0) {
			List<String> le = Arrays.asList(detailBean.getLe().split(";"));
			model.addAttribute("leList", le);
		} else {
			model.addAttribute("leList", "無");
		}
		if(detailBean.getIndetity()!=null && detailBean.getIndetity().trim().length()>0) {
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
		String filePath = "/NoImage.jpg";
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
	@RequestMapping(value = "/newHouse/house", method = RequestMethod.GET)
	public String getAddNewHouseForm(Model model,HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession();
		Member user = (Member) httpSession.getAttribute("user");
		if (user == null || user.getActive()==null)
			return "redirect:/";
		if (!user.getActive().equals("已驗證"))
			return "redirect:/membercontrol/"+user.getId();
		House houseBean = new House();
		model.addAttribute("houseBean", houseBean);
		return "House/HouseForm";
	}

	@RequestMapping(value = "/newHouse/houseE")
	public String getAddNewHouseFormE(Model model) {
		House houseBean = new House();
		model.addAttribute("houseBean", houseBean);
		return "House/HouseForm";
	}

	@RequestMapping(value = "/newHouse/house", method = RequestMethod.POST)
	public String addNewHouse(Model model, @ModelAttribute("houseBean") House houseBean, BindingResult br,HttpServletRequest request) {
		
		Map<String, String> errorMsg = new HashMap<String, String>();
		if (houseBean.getAddr()==null || houseBean.getAddr().trim().length() == 0 || houseBean.getCity()==null
				|| houseBean.getCity().trim().length() == 0 || houseBean.getBoroughs()==null
				|| houseBean.getBoroughs().trim().length() == 0) {
			errorMsg.put("addrE", "地址未輸入完成！");
		}
		if (houseBean.getSqft() == null || houseBean.getSqft() == 0)
			errorMsg.put("sqftE", "坪數未輸入完成！");
		if (houseBean.getBuild()==null || houseBean.getBuild().trim().length() == 0)
			errorMsg.put("buildE", "建築型態未選擇完成！");
		if (houseBean.getType()==null || houseBean.getType().trim().length() == 0)
			errorMsg.put("typeE", "住房類型未選擇完成！");
		if (houseBean.getFloor() == null || houseBean.getFloor() == 0)
			errorMsg.put("floorE", "樓層未輸入完成！");
		if (houseBean.getTopFloor() == null || houseBean.getTopFloor() < 0)
			errorMsg.put("topfloorE", "頂樓樓層未輸入完成！");
		if (houseBean.getLayout()==null || houseBean.getLayout().trim().length() == 0)
			errorMsg.put("layoutE", "格局未輸入完成！(例：3房2廳，樓中樓......");
		if (errorMsg.isEmpty()) {
			HttpSession httpSession = request.getSession();
			Member member = (Member) httpSession.getAttribute("user");
			houseBean.setMemberId(member.getId());//假定會員
			houseBean.setStatus("填寫中");

			houseService.insertHouse(houseBean);
			httpSession.setAttribute("houseId", houseBean.getId());
//			houseId = houseBean.getId();
			return "redirect:/newHouse/houseDetail";
		} else {
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/newHouse/houseE";
		}
	}

	@RequestMapping(value = "/newHouse/houseDetail", method = RequestMethod.GET)
	public String getAddNewHouseFormDetail(Model model) {
		HouseDetail detailBean = new HouseDetail();
		model.addAttribute("detailBean", detailBean);
		return "House/HouseFormDetail";
	}
	@RequestMapping(value = "/newHouse/houseDetailE")
	public String getAddNewHouseFormDetailE(Model model) {
		HouseDetail detailBean = new HouseDetail();
		model.addAttribute("detailBean", detailBean);
		return "House/HouseFormDetail";
	}

	@RequestMapping(value = "/newHouse/houseDetail", method = RequestMethod.POST)
	public String addNewHouseFormDetail(Model model, @ModelAttribute("detailBean") HouseDetail detailBean,
			HttpServletRequest request) throws ParseException {
		Map<String, String> errorMsg = new HashMap<String, String>();
		String infoN = "";
		HttpSession httpSession = request.getSession();
		House houseBean = houseService.findById((Integer) httpSession.getAttribute("houseId"));
		detailBean.setHouseBean(houseBean);
		if(detailBean.getTitle()==null || detailBean.getTitle().trim().length()==0)
			errorMsg.put("titleE", "必須有標題");
		if(request.getParameter("movingInN")==null ||request.getParameter("movingInN").trim().length()==0)
			errorMsg.put("movingInNE", "請選擇日期！");
		if(detailBean.getPrice()==null)
			errorMsg.put("priceE", "請輸入租金！");
		if(detailBean.getShortest()==null || detailBean.getShortest().trim().length()==0)
			errorMsg.put("shortestE", "請輸入最短租期！");
		if(detailBean.getHoaFee()==null)
			detailBean.setHoaFee(0);
		List<Integer> picIdsList = houseService.getPicIdsByHouse(houseBean);

		if (errorMsg.isEmpty() && picIdsList.isEmpty()) {
			if(request.getParameter("infoN")!=null && request.getParameter("infoN").trim().length()>0) 
				infoN=request.getParameter("infoN");
			detailBean.setInfo(changeClob.stringToClob(infoN));
			String movingInN = request.getParameter("movingInN");
			detailBean.setMovingIn(getSqlDateByString(movingInN,"MM/dd/YYYY"));
			String shortestN =request.getParameter("shortestN");
			detailBean.setShortest(detailBean.getShortest()+shortestN);
			
			houseService.insertDetail(detailBean);
			return "redirect:/newHouse/housePic";
		} else if (errorMsg.isEmpty() && !picIdsList.isEmpty()){
			if(request.getParameter("infoN")==null && request.getParameter("infoN").trim().length()>0) 
				infoN=request.getParameter("infoN");
			detailBean.setInfo(changeClob.stringToClob(infoN));
			String movingInN = request.getParameter("movingInN");
			detailBean.setMovingIn(getSqlDateByString(movingInN,"MM/dd/YYYY"));
			String shortestN =request.getParameter("shortestN");
			detailBean.setShortest(detailBean.getShortest()+shortestN);
			
			houseService.insertDetail(detailBean);
			houseService.dontPostHouseById(houseBean.getId());
			return "redirect:/membercontrol/houseRefactSelect";
		} else {
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/newHouse/houseDetailE";
		}
	}
//	houseService.dontPostHouseById(houseId);

	@RequestMapping(value = "/newHouse/housePic", method = RequestMethod.GET)
	public String getAddNewHouseFormPic(Model model) {
		return "House/HouseFormPic";
	}
	@RequestMapping(value = "/newHouse/housePicE")
	public String getAddNewHouseFormPicE(Model model) {
		return "House/HouseFormPic";
	}

	@RequestMapping(value = "/newHouse/housePic", method = RequestMethod.POST)
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
//		List<HousePic> picBeans = new LinkedList<HousePic>();
		for (MultipartFile mf : file) {
			if (!mf.isEmpty()) {

				// 获得文件类型（可以判断如果不是图片，禁止上传）
				contentType = mf.getContentType();
				if(!contentType.equals("image/jpeg")){
					errorMsg.put("typeE", "請上傳jpeg檔");
					break;
				}
				HousePic housePicBean = null;
				 blob = getImageBlob(mf);
				housePicBean = new HousePic(null, houseId, blob, i);
//				housePicBean.setHouseBean(houseBean);
				houseService.insertPicture(housePicBean);

				// 获得文件后缀名称

//				picBeans.add(housePicBean);
				imageName = contentType.substring(contentType.indexOf("/") + 1);
				i += 1;
			}
			if (i == 10)
				break;
		}
		if(errorMsg.isEmpty() && houseBean.getDetailBean()!=null) {
			houseService.dontPostHouseById(houseId);
			return "redirect:/newHouse/houseOrder";
		} else if(errorMsg.isEmpty() && houseBean.getDetailBean()==null) {
			return "redirect:/membercontrol/houseRefactSelect";
		}
		return "forward:/newHouse/housePicE";
	}

	@RequestMapping(value = "/newHouse/houseOrder", method = RequestMethod.GET)
	public String getAddNewHouseOrderForm(Model model) {
//		theVipProject();
		Object command = new Object();
		model.addAttribute("VipProjects", vipProjects);
		model.addAttribute("command", command);
		return "House/HouseFormOrder";
	}
	@RequestMapping(value = "/newHouse/houseOrder", method = RequestMethod.POST)
	public String postAddNewHouseOrderForm(Model model,@RequestParam String vip) {		
		if(vip!=null || vip.trim().length()>0) {
			for(Map<String,String> vipProject:vipProjects) {
				if(vipProject.get("pNumber").equals(vip)) {
					return "redirect:/newHouse/houseOrderSelect/"+vip;
				}
			}
		}
		Map<String, String> errorMsg = new HashMap<String, String>();
		errorMsg.put("orderE", "請由此選擇方案");
		return "forward:/houseOrderE";
	}
	@RequestMapping(value = "/newHouse/houseOrderE")
	public String getAddNewHouseOrderFormE(Model model) {
		return "House/HouseFormOrder";
	}
	@RequestMapping(value = "/oneClickPost/{pay}")
	public String oneClickPost(Model model,HttpServletRequest request,@PathVariable Integer pay) {
		HttpSession httpSession = request.getSession();
		Integer houseId = (Integer) httpSession.getAttribute("houseId");
		houseService.orderFinishied(houseId, new Timestamp(new java.util.Date().getTime()), pay);
		httpSession.removeAttribute("houseId");
		return "redirect:/membercontrol/houseRefactSelect";
	}
	
	
	@RequestMapping(value = "/newHouse/houseOrderSelect/{vip}",produces="text/html;charset=UTF-8")
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
		aio.setItemName(tradeDesc);
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
//		httpSession.setAttribute("houseId", "");
		httpSession.removeAttribute("houseId");
		return "redirect:/membercontrol/houseRefactSelect";
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
	
	private List<Map<String,String>> theVipProject() {
		List<Map<String,String>> vipProjects =new  LinkedList<Map<String,String>>();
		Map<String,String> normal = new HashMap<>();
		normal.put("pName", "銅牌刊登");
		normal.put("pPrice", "500");
		normal.put("pNumber", "0");
		normal.put("pInfo", "普通刊登");
		vipProjects.add(normal);
		Map<String,String> vip = new HashMap<>();
		vip.put("pName", "白銀刊登");
		vip.put("pPrice", "1000");
		vip.put("pNumber", "1");
		vip.put("pInfo", "可享有優先搜尋");
		vipProjects.add(vip);
		Map<String,String> superVip = new HashMap<>();
		superVip.put("pName", "黃金刊登");
		superVip.put("pPrice", "2000");
		superVip.put("pNumber", "2");
		superVip.put("pInfo", "可享有優先搜尋及登上精選推薦輪播牆");
		vipProjects.add(superVip);
		return vipProjects;
	}
}
