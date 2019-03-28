package com.iiiedu105.RentHouse.login.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;
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

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.iiiedu105.RentHouse.ChangeClob;
import com.iiiedu105.RentHouse.login.SmtpAuthenticator;
import com.iiiedu105.RentHouse.login.service.MemberService;
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

	@Autowired
	ChangeClob changeClob;

// URL為 /members, 搭配 POST方法可以新增一筆紀錄
// 儲存瀏覽器送來的Member資料
//新增會員
@RequestMapping(value = "/insertMemberOk", method = RequestMethod.POST)
	public String saveMember(Member member,@RequestParam(value = "memberimg") MultipartFile file0 , 
			HttpServletRequest request , Model model) throws SerialException, SQLException {
	Map<String, String> errorMsg = new HashMap<String, String>();
	Map<String, String> create = new HashMap<String, String>();
	//	預設圖片
	String noImg = "/WEB-INF/views/login/img/PresetMember.png";
//	轉blob
		Blob P_Img = new SerialBlob(toByteArray(noImg));
//	取 id 驗證是否重複
		List<Member> used = memberService.checkByid(member.getId());
		List<Member> personId = memberService.checkByPersonID(member.getPersonID());
		List<Member> email = memberService.checkByEmail(member.getEmail());

		if (used != null) {
			errorMsg.put("idUsed", "帳號重複註冊");
		} else {
			if (personId != null) {
				errorMsg.put("personIdUsed", "身分證或居留證重複註冊");
			} else {
				if (email != null) {
					errorMsg.put("mailUsed", "電子信箱重複註冊");
				} else {
					if (file0.isEmpty()) {
						member.setPic(P_Img);
					} else {
						Blob blob;
						blob = getImageBlob(file0);
						member.setPic(blob);
					}
					String registerIdAcc = request.getParameter("id");
					String upperCase = registerIdAcc.toUpperCase();
					member.setId(upperCase);
					memberService.saveMember(member);
					create.put("createOk", "註冊成功，請到信箱驗證帳號");
					model.addAttribute("create", create);
					String memberEmail = request.getParameter("email");
					String registerName = request.getParameter("name");
					registerIdAcc = request.getParameter("id");
					String registerId = "" + (int) (Math.random() * Math.random() * 100000000);
					String url = "http://localhost:8080/RentHouse/MailBackServlet/" + registerId;

					HttpSession httpSession = request.getSession();
					httpSession.setAttribute(registerId, registerIdAcc);
					httpSession.setMaxInactiveInterval(60 * 10);
					System.out.println("registerId=" + registerId);
//		信箱
					// user
					String user = "iiieeit105";
					// password
					String pwd = "yqfuudsxzjrzbloh";
					// 接收者的email.
					String to = memberEmail;
					// 寄件人的email
					String from = "iiieeit105@gmail.com";
					// 寄件的smtp伺服器
					String host = "smtp.gmail.com";
					// 主旨
					String subject = "租你幸福，開通帳號驗證信";
					// 內文
					String body = registerName + "(" + memberEmail + "),您好" + "<br/>" 
							+ "感謝您註冊成為  租你幸福網站 會員 !"  + "請驗證您的會員帳號<br/>"
							+ "請點擊以下連結開通會員帳號<br/>" + "<a href='"+url +"'>點此開通</a><br/> "
							+ "如果你不能點取連結，亦可以複製下列網址前往驗證。<br/>" 
							+ ""+url+"<br/>"
							+ "如果您認為這是垃圾信件，請忽略此信件。<br/>";
					// 建立一個Properties來設定Properties
					Properties properties = System.getProperties();
					// 設定傳輸協定為smtp
					properties.setProperty("mail.transport.protocol", "smtp");
					// 設定mail Server
					properties.setProperty("mail.smtp.host", host);
					properties.setProperty("mail.smtp.port", "465");
					// 需要驗證帳號密碼
					properties.put("mail.smtp.auth", "true");
					// Bypass the SSL authentication
					properties.put("mail.smtp.ssl.enable", false);
//        properties.put("mail.smtp.starttls.enable", false);
					properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
					// 帳號，密碼
					SmtpAuthenticator authentication = new SmtpAuthenticator(user, pwd);
					// 建立一個Session物件，並把properties傳進去
					Session mailSession = Session.getDefaultInstance(properties, authentication);
					try {
						// 建立一個 MimeMessage object.
						MimeMessage message = new MimeMessage(mailSession);
						
						Multipart mp=new MimeMultipart();
						MimeBodyPart mbp=new MimeBodyPart();
						mbp.setContent(body,"text/html;charset=UTF-8");
						mp.addBodyPart(mbp);
						message.setContent(mp);
						
						// 設定寄件人
						message.setFrom(new InternetAddress(from));
						// 設定收件人
						message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
						// 設定主旨
						message.setSubject(subject);
						// 設定內文
//						message.setText(body);
						Transport transport = mailSession.getTransport();
						// 傳送信件
						transport.send(message);
						System.out.println("發送成功");
					} catch (MessagingException mex) {
						mex.printStackTrace();
					}

					return "forward:/";
				}
			}
		}
		if (!errorMsg.isEmpty())
			model.addAttribute("errorMsg", errorMsg);
		return "forward:/";
	}
//信箱驗證導入
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/MailBackServlet/{registerId}")
	public String activeMember(HttpServletRequest request, HttpSession session, @PathVariable String registerId,
			Model model) {
		Map<String, String> activeOk = new HashMap<String, String>();
		if (registerId == null || registerId.equals("")) {
			return "redirect:/";
		}
		String registeridAcc = (String) request.getSession().getAttribute(registerId);
		System.out.println("開通時=" + registeridAcc);
		if (registeridAcc == null || registeridAcc.equals("")) {
			activeOk.put("active", "時效已過，請重新發出請求");
			model.addAttribute("activeOk", activeOk);
			return "forward:/";
		}
//		request.setAttribute("registeridAcc", registeridAcc);
		Member member = memberService.findMemberById(registeridAcc);
		System.out.println("member=" + member);
		member.setActive("已驗證");
		memberService.updateMember(member);
		activeOk.put("active", "帳號開通成功，請重新登入");
		model.addAttribute("activeOk", activeOk);
		return "forward:/";
	}
	//密碼驗證導入
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "/forgetPwd/{registerId}")
		public String forgetMember(HttpServletRequest request, HttpSession session, @PathVariable String registerId,
				Model model) {
			Map<String, String> activeOk = new HashMap<String, String>();
			if (registerId == null || registerId=="") {
				return "redirect:/";
			}
			String registeridAcc = (String) request.getSession().getAttribute(registerId);
			System.out.println("開通時=" + registeridAcc);
			if (registeridAcc == null || registeridAcc=="") {
				activeOk.put("active", "時效已過，請重新發出請求");
				model.addAttribute("activeOk", activeOk);
				return "forward:/";
			}
//			request.setAttribute("registeridAcc", registeridAcc);
			Member member = memberService.findMemberById(registeridAcc);
			session.setAttribute("user", member);
			activeOk.put("active", "請將您的密碼修改完成");
			model.addAttribute("activeOk", activeOk);
			return "redirect:/membercontrol/" + registeridAcc;
		}

//會員登入
@RequestMapping(value = "/loginMember", method = RequestMethod.POST)
	public String checkMember(HttpServletRequest request , Model model) {
	Map<String, String> errorMsg = new HashMap<String, String>();
	Map<String, String> create = new HashMap<String, String>();
	
	Member member = memberService.login(request.getParameter("inputAccount"), request.getParameter("inputPassword"));	
	if(member!=null) {
		List<Object[]> list = memberService.getAllMsg(member.getId());
		HttpSession session = request.getSession();
		session.setAttribute("user", member);
		session.setAttribute("allmsg", list);
	}else {
		errorMsg.put("errorAccPwd", "帳號或密碼錯誤");
		model.addAttribute("errorMsg", errorMsg);
	}
	if(!errorMsg.isEmpty()) {
		return "forward:/";
	}
	create.put("signin", "租你幸福，祝你幸福");
	model.addAttribute("create", create);
		return "forward:/";
	}

	@RequestMapping(value = "/signOut", method = RequestMethod.GET)
	public String SignOutMember(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}

	@SuppressWarnings("unused")
	private Date getSqlDateByString(String YMD) throws ParseException {
		SimpleDateFormat sDF = new SimpleDateFormat("YYYY-MM-DD");
		sDF.setLenient(false);
		Date date = new Date(sDF.parse(YMD).getTime());
		return date;
	}

	@RequestMapping(value = "/insertPicPage", method = RequestMethod.GET)
	public String insertPic(Model model) {
		model.addAttribute("member", new Member());
		return "/login/insertPic";
	}
//會員中心
	@RequestMapping(value = "/membercontrol/{id}")
	public String membercontrol(Model model, HttpServletRequest request, @PathVariable String id, Member member) {
		HttpSession session = request.getSession();
		member = (Member) session.getAttribute("user");
		if(member!=null) {
		model.addAttribute("member", member);
		memberService.updateAllMsgById(id);
		List<Object[]> list = memberService.getAllMsg(member.getId());
		session.setAttribute("allmsg", list);
		Member users = memberService.findMemberById(member.getId());
		session.setAttribute("user", users);
		return "login/MemberUpdata";
		}else {
		model.addAttribute("member",new Member());
		return "redirect:/";
		}
		
	}
//重新發送驗證信
	@RequestMapping(value = "/membercontrol/reActive")
	public String reActive(Model model, HttpServletRequest request, @ModelAttribute("member") Member member)
			throws SerialException, SQLException {
		Map<String, String> create = new HashMap<String, String>();
		HttpSession session = request.getSession();
//	從session 取 member資料  
		Member users = (Member) session.getAttribute("user");

		String memberEmail = users.getEmail();
		String registerName = users.getName();
		String registerIdAcc = users.getId();
		String registerId = "" + (int) (Math.random() * Math.random() * 100000000);
		String url = "http://localhost:8080/RentHouse/MailBackServlet/" + registerId;

		HttpSession httpSession = request.getSession();
		httpSession.setMaxInactiveInterval(60 * 10);
		httpSession.setAttribute(registerId, registerIdAcc);
		System.out.println("registerId=" + registerId);
//	信箱
		// user
		String user = "iiieeit105";
		// password
		String pwd = "yqfuudsxzjrzbloh";
		// 接收者的email.
		String to = memberEmail;
		// 寄件人的email
		String from = "iiieeit105@gmail.com";
		// 寄件的smtp伺服器
		String host = "smtp.gmail.com";
		// 主旨
		String subject = "租你幸福，開通帳號驗證信";
		// 內文
		String body = registerName + "(" + memberEmail + "),您好" + "<br/>" 
				+ "感謝您註冊成為  租你幸福網站 會員 !"  + "請驗證您的會員帳號<br/>"
				+ "請點擊以下連結開通會員帳號<br/>" + "<a href='"+url +"'>點此開通</a><br/> "
				+ "如果你不能點取連結，亦可以複製下列網址前往驗證。<br/>" 
				+ ""+url+"<br/>"
				+ "如果您認為這是垃圾信件，請忽略此信件。<br/>";
		// 建立一個Properties來設定Properties
		Properties properties = System.getProperties();
		// 設定傳輸協定為smtp
		properties.setProperty("mail.transport.protocol", "smtp");
		// 設定mail Server
		properties.setProperty("mail.smtp.host", host);
		properties.setProperty("mail.smtp.port", "465");
		// 需要驗證帳號密碼
		properties.put("mail.smtp.auth", "true");
		// Bypass the SSL authentication
		properties.put("mail.smtp.ssl.enable", false);
//    properties.put("mail.smtp.starttls.enable", false);
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		// 帳號，密碼
		SmtpAuthenticator authentication = new SmtpAuthenticator(user, pwd);
		// 建立一個Session物件，並把properties傳進去
		
		Session mailSession = Session.getDefaultInstance(properties, authentication);
		try {
			// 建立一個 MimeMessage object.
			MimeMessage message = new MimeMessage(mailSession);
			
			Multipart mp=new MimeMultipart();
			MimeBodyPart mbp=new MimeBodyPart();
			mbp.setContent(body,"text/html;charset=UTF-8");
			mp.addBodyPart(mbp);
			message.setContent(mp);
			
			// 設定寄件人
			message.setFrom(new InternetAddress(from));
			// 設定收件人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// 設定主旨
			message.setSubject(subject);
			// 設定內文
//			message.setText(body);
			
			Transport transport = mailSession.getTransport();
			// 傳送信件
			transport.send(message);
			System.out.println("發送成功");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
		create.put("reactive", "驗證信已重新發出，請查證信箱");
		model.addAttribute("create", create);
		return "forward:/membercontrol/" + users.getId();
	}
//忘記密碼記EMAIL
	@RequestMapping(value = "/forgetpwd")
	public String forgetpwd(Model model, HttpServletRequest request)
			throws SerialException, SQLException {
		Map<String, String> create = new HashMap<String, String>();
		String f_acc = request.getParameter("forgetpwdacc");
		String f_email = request.getParameter("forgetpwdemail");
		
		int i,z;
	    String A = "";
	    for(i = 0; i < 8; i++){
	    	      z = (int) ((Math.random() * 7) % 3);
	    	      if (z == 1) { // 放數字
	    	        A = A + ((int) ((Math.random() * 10) + 48));
	    	      } else if (z == 2) { // 放大寫英文
	    	    	  A = A + ((char) (((Math.random() * 26) + 65)));
	    	      } else {// 放小寫英文
	    	    	  A = A + (((char) ((Math.random() * 26) + 97)));
	    	      }
	    }
	    String registerId = A;
	    String url = "http://localhost:8080/RentHouse/forgetPwd/" + registerId;
	    
		HttpSession httpSession = request.getSession();
		httpSession.setMaxInactiveInterval(60*10);
		httpSession.setAttribute(registerId, f_acc);
		System.out.println("registerId=" + registerId);
//	信箱
		// user
		String user = "iiieeit105";
		// password
		String pwd = "yqfuudsxzjrzbloh";
		// 接收者的email.
		String to = f_email;
		// 寄件人的email
		String from = "iiieeit105@gmail.com";
		// 寄件的smtp伺服器
		String host = "smtp.gmail.com";
		// 主旨
		String subject = "租你幸福，找回密碼通知";
		// 內文
		String body = "用戶"+f_acc + "(" + f_email + "),您好" + "<br/>" 
				+ "以下為您的新密碼 !"  + "請使用這組密碼登入您的會員帳號<br/>"
				+ "請點擊以下連結導入會員修改<br/>" + "<a href='"+url +"'>點此改密碼</a><br/> "
				+ "如果你不能點取連結，亦可以複製下列網址前往驗證。<br/>" 
				+ ""+url+"<br/>"
				+ "如果您認為這是垃圾信件，請忽略此信件。<br/>";
		// 建立一個Properties來設定Properties
		Properties properties = System.getProperties();
		// 設定傳輸協定為smtp
		properties.setProperty("mail.transport.protocol", "smtp");
		// 設定mail Server
		properties.setProperty("mail.smtp.host", host);
		properties.setProperty("mail.smtp.port", "465");
		// 需要驗證帳號密碼
		properties.put("mail.smtp.auth", "true");
		// Bypass the SSL authentication
		properties.put("mail.smtp.ssl.enable", false);
//    properties.put("mail.smtp.starttls.enable", false);
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		// 帳號，密碼
		SmtpAuthenticator authentication = new SmtpAuthenticator(user, pwd);
		// 建立一個Session物件，並把properties傳進去
		
		Session mailSession = Session.getDefaultInstance(properties, authentication);
		try {
			// 建立一個 MimeMessage object.
			MimeMessage message = new MimeMessage(mailSession);
			
			Multipart mp=new MimeMultipart();
			MimeBodyPart mbp=new MimeBodyPart();
			mbp.setContent(body,"text/html;charset=UTF-8");
			mp.addBodyPart(mbp);
			message.setContent(mp);
			
			// 設定寄件人
			message.setFrom(new InternetAddress(from));
			// 設定收件人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// 設定主旨
			message.setSubject(subject);
			// 設定內文
//			message.setText(body);
			
			Transport transport = mailSession.getTransport();
			// 傳送信件
			transport.send(message);
			System.out.println("發送成功");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
		create.put("reactive", "新密碼已發出，請查證信箱");
		model.addAttribute("create", create);
		Member member = memberService.findMemberById(f_acc);
		member.setPwd(A);
		memberService.updateMember(member);
		return "forward:/";
	}
	//修改會員資料
	@RequestMapping(value = "/membercontrol/updataMember", method = RequestMethod.POST)
	public String updataMember(Model model, @RequestParam(value = "memberimg") MultipartFile file0,
			HttpServletRequest request, @ModelAttribute("member") Member member) throws SerialException, SQLException {
		Map<String, String> create = new HashMap<String, String>();

		HttpSession session = request.getSession();
////		從session 取 member資料  
		Member user = (Member) session.getAttribute("user");
		user.setName(member.getName());
		user.setPwd(member.getPwd());
		user.setPhone(member.getPhone());
		if (file0.isEmpty()) {
			user.setPic(user.getPic());
			memberService.updateMember(user);
		} else {
//		String contentType= file0.getContentType();
//		System.out.println(contentType);
//		if(!contentType.equals("image/jpeg")){
//			errorMsg.put("typeE", "請上傳jpeg檔");
//		}
			Blob blob;
			blob = getImageBlob(file0);
			user.setPic(blob);
			memberService.updateMember(user);

		}
		create.put("createOk", "修改成功");
		user = memberService.findMemberById(user.getId());
		session.setAttribute("user", user);
		model.addAttribute("create", create);
		return "forward:/membercontrol/" + user.getId();
	}

	@RequestMapping(value = "/updatePic", method = RequestMethod.POST)
	public String addMemberPic(Model model, @RequestParam(value = "pic0") MultipartFile file0,
			HttpServletRequest request, Member member) throws SerialException, SQLException {
		Map<String, String> errorMsg = new HashMap<String, String>();

		HttpSession session = request.getSession();
//	從session 取 member資料  
		member = (Member) session.getAttribute("user");

		String noImg = "/WEB-INF/views/login/img/PresetMember.png";
		Blob P_Img = new SerialBlob(toByteArray(noImg));

		if (file0.isEmpty()) {
			member.setPic(P_Img);
			memberService.updateMember(member);
		} else {
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
		return "redirect:/return_index";
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
		root = root.substring(0, root.length() - 1);
		String realLoction = root + noImg;
		byte[] b = null;
		try {
			File file = new File(realLoction);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(noImg);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	public static byte[] getByte(InputStream in) throws IOException {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		try {
			byte[] buf = new byte[1024]; // 快取陣列
			while (in.read(buf) != -1) { // 讀取輸入流中的資料放入快取，如果讀取完則迴圈條件為false;
				out.write(buf); // 將快取陣列中的資料寫入out輸出流，如果需要寫到檔案，使用輸出流的其他方法
			}
			out.flush();
			return out.toByteArray(); // 將輸出流的結果轉換為位元組陣列的形式返回 （先執行finally再執行return ）
		} finally {
			if (in != null) {
				in.close();
			}
			if (out != null) {
				out.close();
			}
		}
	}

	@SuppressWarnings("resource")
	public static byte[] file2Byte(String inFile) {
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

	@RequestMapping(value = "/showMemberPic", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, HttpServletRequest request, Member member) {
		String filePath = "/WEB-INF/views/login/img/PresetMember.png";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		HttpSession session = request.getSession();
//	取member資料  
		member = (Member) session.getAttribute("user");
		if (member != null) {
			Blob blob = member.getPic();
			if (blob != null) {
				filename = member.getId() + ".jpg";
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController.getImage()發生SQLException：" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}

		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		System.out.println("media=" + media);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		System.out.println("mimeType=" + mimeType);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("Media Type = " + mimeType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		return responseEntity;
	}

	private static String client_id = "825814170132-9r69bbro6bbtg1ahvhsp5jeu07f52sd0.apps.googleusercontent.com";
	private static String client_secret = "9ZZ9y8bm1Tysm3schyquOyD7";
	private static String scope = "https://www.googleapis.com/auth/drive.metadata.readonly";
	private static String redirect_url = "http://gntina.iok.la/GoogleUserInfo";
	private static String code_url = "https://accounts.google.com/o/oauth2/v2/auth";
	private static String token_url = "https://www.googleapis.com/oauth2/v4/token";
	private static String user_url = "https://www.googleapis.com/oauth2/v2/userinfo";
	private static String verify_url = "https://www.googleapis.com/oauth2/v3/tokeninfo";

	@RequestMapping(value = "/googleVerify", method = RequestMethod.POST)
	public String verifyToken(HttpServletRequest request, String idtokenstr, Model model, Member member)
			throws SerialException, SQLException, IOException {
		System.out.println(idtokenstr);
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(),
				JacksonFactory.getDefaultInstance()).setAudience(Collections.singletonList(client_id)).build();
		GoogleIdToken idToken = null;
		try {
			idToken = verifier.verify(idtokenstr);
		} catch (GeneralSecurityException e) {
			System.out.println("驗證時出現GeneralSecurityException異常");
		} catch (IOException e) {
			System.out.println("驗證時出現IOException異常");
		}
		if (idToken != null) {
			System.out.println("驗證成功.");
			Payload payload = idToken.getPayload();
			String userId = payload.getSubject();
			String email = payload.getEmail();
//		boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			String name = (String) payload.get("name");
//			String pictureUrl = (String) payload.get("picture");
//			String locale = (String) payload.get("locale");
//			String familyName = (String) payload.get("family_name");
//			String givenName = (String) payload.get("given_name");

			// 預設圖片
			String noImg = "/WEB-INF/views/login/img/PresetMember.png";
//		轉blob
			Blob P_Img = new SerialBlob(toByteArray(noImg));
			
			member.setId("Google" + name);
			member.setActive("已驗證");
			member.setPwd(userId);
			member.setPic(P_Img);
			member.setEmail(email);
			member.setName(name);
			Member user = memberService.login(member.getId(), member.getPwd());
			System.out.println("user: " + user);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				return "redirect:/";
			} else {
				memberService.saveMember(member);
				return "redirect:/";
			}
		} else {
			System.out.println("Invalid ID token.");
		}
		return "redirect:/";

	}
}