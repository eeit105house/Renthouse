package com.iiiedu105.RentHouse.login.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iiiedu105.RentHouse.login.service.MemberService;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;


@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	ServletContext context;
@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
// URL為 /members, 搭配 POST方法可以新增一筆紀錄
// 儲存瀏覽器送來的Member資料
@RequestMapping(value = "insertMemberOk", method = RequestMethod.POST)
	public String saveMember(Member member,@RequestParam(value = "memberimg") MultipartFile file0) throws SerialException, SQLException {
//	預設圖片
	String noImg = "/WEB-INF/views/login/img/PresetMember.png";
//	轉blob
	Blob P_Img = new SerialBlob(toByteArray(noImg));
	
	if(file0.isEmpty()) {
		member.setPic(P_Img);
		memberService.saveMember(member);
	}else {

	Blob blob;
	blob = getImageBlob(file0);
	member.setPic(blob);
	memberService.saveMember(member);
	}
	return "redirect: return_index";
	}
@RequestMapping(value = "loginMember", method = RequestMethod.POST)
	public String checkMember(HttpServletRequest request) {
	Map<String, String> errorMsg = new HashMap<String, String>();
	Member member = memberService.login(request.getParameter("inputAccount"), request.getParameter("inputPassword"));
	
	if(member!=null) {
		HttpSession session = request.getSession();
		session.setAttribute("user", member);
	return "redirect: return_index";
	}else {
		errorMsg.put("error", "帳號或密碼錯誤");
		return "redirect: return_index";
	}
	}


@RequestMapping(value = "signOut", method = RequestMethod.GET)
	public String SignOutMember(HttpSession session) {
	session.removeAttribute("user");
	return "redirect: return_index";
}


@SuppressWarnings("unused")
	private Date getSqlDateByString(String YMD) throws ParseException {
	SimpleDateFormat sDF = new SimpleDateFormat("YYYY-MM-DD");
	sDF.setLenient(false);
	Date date = new Date(sDF.parse(YMD).getTime());
	return date;
}

	@RequestMapping(value = "insertPicPage", method = RequestMethod.GET)
	public String insertPic(Model model) {
		model.addAttribute("member", new Member());
		return "/login/insertPic";
	}

@RequestMapping(value = "/updatePic", method = RequestMethod.POST)
public String addMemberPic(Model model, @RequestParam(value = "pic0") MultipartFile file0,
		HttpServletRequest request,Member member) throws SerialException, SQLException {
	Map<String, String> errorMsg = new HashMap<String, String>();
	
	HttpSession session = request.getSession();
//	從session 取 member資料  
	member = (Member) session.getAttribute("user");

	String noImg = "/WEB-INF/views/login/img/PresetMember.png";
	Blob P_Img = new SerialBlob(toByteArray(noImg));
	
	if(file0.isEmpty()) {
		member.setPic(P_Img);
		memberService.updateMember(member);
	}else {
//	String contentType= file0.getContentType();
//	System.out.println(contentType);
//	if(!contentType.equals("image/jpeg")){
//		errorMsg.put("typeE", "請上傳jpeg檔");
//	}
	Blob blob;
	blob = getImageBlob(file0);
	member.setPic(blob);
	memberService.updateMember(member);

	}
	return "redirect: return_index";
}

@SuppressWarnings("unused")
private Blob getImageBlob(MultipartFile mf) {
	Blob blob;
	try {
		byte b[] = mf.getBytes();
		blob = new SerialBlob(b);
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("上傳異常：" + e.getMessage());
		throw new RuntimeException(e);
	}
	return blob;
}

private byte[] toByteArray(String noImg) {
	String root = context.getRealPath("/");
	root = root.substring(0, root.length()-1);
	String realLoction = root +noImg;
	 byte[] b = null;
      try {
            File file = new File(realLoction);
            long size = file.length();
            b = new byte[(int)size];
            InputStream fis = context.getResourceAsStream(noImg);
            fis.read(b);
      } catch (FileNotFoundException e) {
            e.printStackTrace();
      } catch (IOException e) {
            e.printStackTrace();
      }
      return b;
}

@SuppressWarnings("resource")
public static byte[] file2Byte(String inFile){
    InputStream in = null;
    byte[] result = null;
    try {
        in = new FileInputStream(new File(inFile));
        int len = in.available();
        result = new byte[len];
        in.read(result);
        return result;
    } catch (Exception e) {
        e.printStackTrace();
    }
	return result;
}

@RequestMapping(value="/showMemberPic", method=RequestMethod.GET)
public ResponseEntity<byte[]> getPicture(HttpServletResponse response,HttpServletRequest request,
		Member member) {
	String filePath = "/WEB-INF/views/login/img/PresetMember.png";
			
    byte[] media = null;
    HttpHeaders headers = new HttpHeaders();
    String filename = "";
    int len = 0;
	HttpSession session = request.getSession();
//	取member資料  
	member = (Member) session.getAttribute("user");
    if(member !=null) {
    	Blob blob = member.getPic();
    	if(blob!=null) {
    		filename=member.getId()+".jpg";
	    	try {
	    		len=(int) blob.length();
	    		media=blob.getBytes(1, len);
			} catch (SQLException e) {
				throw new RuntimeException("ProductController.getImage()發生SQLException："+e.getMessage());
			}
    	} else {
    		media=toByteArray(filePath);
	    	filename=filePath;
    	}
    	
    } else {
    	media=toByteArray(filePath);
    	filename=filePath;
    }
    System.out.println("media="+media);
    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
	String mimeType = context.getMimeType(filename);
	System.out.println("mimeType="+mimeType);
	MediaType mediaType = MediaType.valueOf(mimeType);
	System.out.println("Media Type = "+mimeType);
	headers.setContentType(mediaType);
	ResponseEntity<byte[]> responseEntity = 
			new ResponseEntity<>(media,headers,HttpStatus.OK);
	
	return responseEntity;
}

}