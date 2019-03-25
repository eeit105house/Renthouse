package com.iiiedu105.RentHouse.backend.main.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iiiedu105.RentHouse.ChangeClob;
import com.iiiedu105.RentHouse.backend.main.service.LoginService;
import com.iiiedu105.RentHouse.backend.review.house.service.OTShelfService;
import com.iiiedu105.RentHouse.backend.review.writings.Service.RWritingsService;
import com.iiiedu105.RentHouse.model.Employee;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;

@Controller
public class MainController {
	@Autowired
	OTShelfService oservice;
	@Autowired
	RWritingsService rservice;
	@Autowired
	LoginService loginService;
	@Autowired
	ChangeClob changefile;
	//取得審核房屋通知
	@ModelAttribute("hlist")
	public List<House> getHouseList(){
		List<House> list = oservice.getAllHouse();
		return list;
	}
	//取得檢舉文章通知
	@ModelAttribute("wlist")
	public List<ForumReport> getWriteList(){
		List<ForumReport> list = rservice.getAllWritings();
		return list;
	}	
	//取得員工頭像
	@RequestMapping(value="/backstage/getEmployeePic/{eid}")
	public ResponseEntity<byte[]> getEmployeePicture(HttpServletResponse response,@PathVariable("eid") String eid){
		String filePath = "/WEB-INF/views/backstage/RHstaticresource/img/noimage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
//		String filename = "";
		int len = 0;
		Employee employee = loginService.getEmployeeById(eid);
		Blob blob = employee.getPic();
		if(blob != null) {
			try {
				len = (int)blob.length();
				media = blob.getBytes(1, len);
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}else {
			media = changefile.toByteArray(filePath);
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		headers.setContentType(MediaType.IMAGE_JPEG);
		ResponseEntity<byte[]> responseEntity = 
				new ResponseEntity<byte[]>(media,headers,HttpStatus.OK);
		return responseEntity;		
	}
	
	//登入頁面
	@RequestMapping(value="/backlogin/login")
	public String backLogin() {	
		return "backstage/bslogout";		
	}
	//處理登入表單
	@RequestMapping(value="/backlogin/processLogin" ,method = RequestMethod.POST)
	public String processBackLogin(Model model ,HttpServletRequest request) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		String str = null;
		HttpSession session = request.getSession();
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		List<Employee> list = loginService.getOneEmployee(user,pwd);
		if(list.size()!=0) {
			for(Employee employee: list) {
				session.setAttribute("employee", employee);	
			}		
			str = "redirect:/backstage/backindex";
		}else {
			errorMsg.put("error", "帳號或密碼錯誤");
			model.addAttribute("errorMsg",errorMsg);
			str = "backstage/bslogout";
		}
		return str;		
	}
	//後台首頁
	@RequestMapping(value="/backstage/backindex")
	public String backindex() {
		return "backstage/bsindex";
	}
	//後台登出
	@RequestMapping(value="/backlogin/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("employee")!=null) {			
			session.removeAttribute("employee");
		}
		return "redirect:/backlogin/login";		
	}
	//後台統計圖表
	@RequestMapping(value="/backstage/chart")
	public String chart(Model model) {

		return "backstage/chart";		
	}
	//員工資料修改畫面
	@RequestMapping(value="/backstage/updateemployee",method = RequestMethod.GET)
	public String updateEmployee(Model model) {	
		Employee employee = new Employee();
		model.addAttribute("upemployee",employee);
		return "backstage/updateEmployee";		
	}
	//處理員工資料修改表單
	@RequestMapping(value="/backstage/updateemployee" ,method = RequestMethod.POST)
	public String processUpdateEmployee(@ModelAttribute("upemployee") Employee employee ,HttpServletRequest request
			,@RequestParam("eimg")  MultipartFile fileimg,Model model) throws SerialException, SQLException {
		Map<String,String> error = new HashMap<>();
		String noimg = "/WEB-INF/views/backstage/RHstaticresource/img/noimage.jpg";
		Blob bnoimg = new SerialBlob(changefile.toByteArray(noimg));
		Blob pic = null;
		int split = fileimg.getContentType().indexOf("/");
		String getname = fileimg.getContentType().substring(split+1);
		String gettiti = fileimg.getContentType().substring(0,split);
		if(fileimg.isEmpty()) {
			pic = bnoimg;
		}else {
			if(!gettiti.equals("image") || !getname.equals("jpeg")) {
				error.put("fileerror", "檔案格式不正確");
				model.addAttribute("error",error);
				return "backstage/updateEmployee";
				
			}else {
				pic = changefile.getImageBlob(fileimg);
				error.put("errormsg", "更新資料成功，請重新登入");
				model.addAttribute("error",error);
			}
		}
		loginService.updateEmployee(employee.getId(), employee.getName(), pic, employee.getPwd());
		return "redirect:/backstage/jump";		
	}
	@RequestMapping("/backstage/jump")
	public String jumpPage() {
		return "backstage/jump";
	}
	
	
}
