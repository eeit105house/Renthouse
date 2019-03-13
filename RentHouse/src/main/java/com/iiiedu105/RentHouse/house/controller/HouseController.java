package com.iiiedu105.RentHouse.house.controller;

import java.sql.Blob;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iiiedu105.RentHouse.house.service.HouseService;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

@Controller
public class HouseController {
	@Autowired
	HouseService houseService;
	@Autowired
	ServletContext context;
	private Integer houseId = null;

	public HouseController() {
	}
	
	

	@RequestMapping(value="/houseView/{shId}")
	public String viewHousePage(Model model,@PathVariable Integer shId) {
		House houseBean = houseService.findById(shId);
		Member memberBean = houseBean.getMemberBean();
		HouseDetail detailBean = houseBean.getDetailBean();
		Set<HousePic> picBeans = houseBean.getPictureBean();
		model.addAttribute("houseBean", houseBean);
		model.addAttribute("memberBean", memberBean);
		model.addAttribute("detailBean", detailBean);
		model.addAttribute("picBeans", picBeans);
		String movingInStr = getStringBySqlDate(detailBean.getMovingIn());
		model.addAttribute("movingInStr", movingInStr);
		String fakeName = memberBean.getName().substring(0, 1);
		if(memberBean.getSex().equalsIgnoreCase("MALE"))
			fakeName += "先生";
		else
			fakeName += "小姐";
		model.addAttribute("fakeName", fakeName);
		if(detailBean.getAppliance()!=null || detailBean.getAppliance().length()>0) {
			List<String> appliance = Arrays.asList(detailBean.getAppliance().split(";"));
			model.addAttribute("applianceList", appliance);
		} else {
			model.addAttribute("applianceList", "無提供設備");
		}
		if(detailBean.getFurniture()!=null || detailBean.getFurniture().length()>0) {
			List<String> furniture = Arrays.asList(detailBean.getFurniture().split(";"));
			model.addAttribute("furnitureList", furniture);
		} else {
			model.addAttribute("furnitureList", "無提供家具");
		}
		if(detailBean.getInclude()!=null || detailBean.getInclude().length()>0) {
			List<String> include = Arrays.asList(detailBean.getInclude().split(";"));
			model.addAttribute("includeList", include);
		} else {
			model.addAttribute("includeList", "無包含其餘費用");
		}
		if(detailBean.getLe()!=null || detailBean.getLe().length()>0) {
			List<String> le = Arrays.asList(detailBean.getLe().split(";"));
			model.addAttribute("leList", le);
		} else {
			model.addAttribute("leList", "無");
		}
		if(detailBean.getIndetity()!=null || detailBean.getIndetity().length()>0) {
			List<String> indetity = Arrays.asList(detailBean.getIndetity().split(";"));
			model.addAttribute("indetityList", indetity);
		} else {
			model.addAttribute("indetityList", "無身分限制");
		}

		return "House/HouseView";
	}

//	@RequestMapping(value="/houseView/hPic/{picId}", method=RequestMethod.GET)
//	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, @PathVariable Integer picId) {
//		String filePath = "/WEB-INF/views/images/NoImage.jpg";
//				
//	    byte[] media = null;
//	    HttpHeaders headers = new HttpHeaders();
//	    String filename = "";
//	    int len = 0;
//	    BookBean bb = service.getProductById(bookId);
//	    if(bb !=null) {
//	    	
//	    	Blob blob = bb.getCoverImage();
//	    	if(blob!=null) {
//	    		filename=bb.getFileName();
//		    	try {
//		    		len=(int) blob.length();
//		    		media=blob.getBytes(1, len);
//				} catch (SQLException e) {
//					throw new RuntimeException("ProductController.getImage()發生SQLException："+e.getMessage());
//				}
//	    	} else {
//	    		media=toByteArray(filePath);
//		    	filename=filePath;
//	    	}
//	    	
//	    } else {
//	    	media=toByteArray(filePath);
//	    	filename=filePath;
//	    }
//	    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		String mimeType = context.getMimeType(filename);
//		MediaType mediaType = MediaType.valueOf(mimeType);
//		System.out.println("Media Type = "+mimeType);
//		headers.setContentType(mediaType);
//		ResponseEntity<byte[]> responseEntity = 
//				new ResponseEntity<>(media,headers,HttpStatus.OK);
//		
//		return responseEntity;
//	}
//	
	//=====ADD NEW HOUSE=====
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
	public String addNewHouse(Model model, @ModelAttribute("houseBean") House houseBean, BindingResult br) {
		Map<String, String> errorMsg = new HashMap<String, String>();
			houseBean.setMemberId("abc123");//假定會員
		if (houseBean.getAddr() == null || houseBean.getAddr().length() == 0 || houseBean.getCity() == null
				|| houseBean.getCity().length() == 0 || houseBean.getBoroughs() == null
				|| houseBean.getBoroughs().length() == 0) {
			errorMsg.put("addrE", "地址未輸入完成！");
		}
		if (houseBean.getSqft() == null || houseBean.getSqft() == 0)
			errorMsg.put("sqftE", "坪數未輸入完成！");
		if (houseBean.getBuild() == null || houseBean.getBuild().length() == 0)
			errorMsg.put("buildE", "建築型態未選擇完成！");
		if (houseBean.getType() == null || houseBean.getType().length() == 0)
			errorMsg.put("typeE", "住房類型未選擇完成！");
		if (houseBean.getFloor() == null || houseBean.getFloor() == 0)
			errorMsg.put("floorE", "樓層未輸入完成！");
		if (houseBean.getTopFloor() == null || houseBean.getTopFloor() < 0)
			errorMsg.put("topfloorE", "頂樓樓層未輸入完成！");
		if (houseBean.getLayout() == null || houseBean.getLayout().length() == 0)
			errorMsg.put("layoutE", "格局未輸入完成！(例：3房2廳，樓中樓......");
		if (errorMsg.isEmpty()) {
			houseService.insertHouse(houseBean);
			houseId = houseBean.getId();
			return "redirect:/houseDetail";
		} else {
			model.addAttribute("errorMsg", errorMsg);
//			return "House/HouseForm";
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

		House houseBean = houseService.findById(houseId);
		detailBean.setHouseBean(houseBean);
		if(detailBean.getTitle()==null || detailBean.getTitle().length()==0)
			errorMsg.put("titleE", "必須有標題");
		if(request.getParameter("movingInN")==null ||request.getParameter("movingInN").length()==0)
			errorMsg.put("movingInNE", "請選擇日期！");
		if(detailBean.getPrice()==null)
			errorMsg.put("priceE", "請輸入租金！");
		if(detailBean.getShortest()==null || detailBean.getShortest().length()==0)
			errorMsg.put("shortestE", "請輸入最短租期！");
		
		
		if (errorMsg.isEmpty()) {
			String movingInN = request.getParameter("movingInN");
			detailBean.setMovingIn(getSqlDateByString(movingInN));
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
			@RequestParam(value = "pics") MultipartFile[] file) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		House houseBean = houseService.findById(houseId);

		if(file0.isEmpty()) {
			errorMsg.put("pic0None", "必須有封面");
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/housePicE";
		}
		String contentType= file0.getContentType();
		System.out.println(contentType);
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

		return "House/HouseFormOrder";
	}

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

	private Date getSqlDateByString(String ddMMYYYY) throws ParseException {
		SimpleDateFormat sDF = new SimpleDateFormat("dd/MM/YYYY");
		sDF.setLenient(false);
		Date date = new Date(sDF.parse(ddMMYYYY).getTime());
		return date;
	}
	private String getStringBySqlDate(Date date) {
		java.util.Date javaDate = new java.util.Date(date.getTime());
		SimpleDateFormat sDF = new SimpleDateFormat("YYYY年MM月dd日");
		String yYYYMMdd = sDF.format(javaDate);
		sDF.setLenient(false);
		return yYYYMMdd;
	}
}
