package com.iiiedu105.RentHouse.forum.controller;


import java.util.Date;
import java.util.HashMap;
import java.sql.Clob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.iiiedu105.RentHouse.ChangeClob;
import com.iiiedu105.RentHouse.forum.service.ForumService;
import com.iiiedu105.RentHouse.model.Forum;
import com.iiiedu105.RentHouse.model.ForumReply;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.Member;

@Controller
public class ForumController {
	String fakeM = "abc123";//假定會員
	@Autowired
	ForumService service;
	@Autowired
	ChangeClob changeClob;
	@Autowired
	ServletContext context;
	public ForumController() {
	}
	
//	
//	@RequestMapping(value="/update/{id}")
//	public String updateForum(@PathVariable("id") Integer id) {
//		ForumService.updateForumStatus(id);
//		return "redirect:/Forum";		
//		}
//	@RequestMapping(value="/delete/{id}")
//	public String deleteHouse(@PathVariable("id") Integer id) {
//		ForumService.deleteForum(id);
//		return "redirect:/Forum";		
//		}
	@RequestMapping(value= "/ForumView")
	public String viewForum(Model model) {
		List<Forum> list = service.getAllPosts();
		model.addAttribute("flist", list);
		model.addAttribute("member", new Member());
		return "Forum/ForumView";		
	}
			
	@RequestMapping(value="/forumUpdate/{fid}")
	public String updatForum(Model model) {
		Forum forum = new Forum();
		service.updatePost(forum);	
		return "redirect:/Forumview";		
		}
	@RequestMapping(value="/forumDelete/{fid}")
	public String deleteForum(@PathVariable("fid") Integer fid) {
		Forum ForumBean = new Forum();
		ForumBean.setStatus("下架");
		service.deletePost(fid);
		return "redirect:/Forumview";		
		}
//	@RequestMapping(value="/time/{fId}")
//	public String getStringByTime(Model model,@PathVariable("fId") Integer fId) {
//		Forum ForumBean = service.findById(fId);
//		String datetimeStr = null;
//		String postTime =getStringByTime  (ForumBean.getDatetime(), datetimeStr);
//		model.addAttribute("datetimeStr", datetimeStr);
//		return "redirect:/Forumview";		
//		}
	
	@RequestMapping(value= "/ForumDetail/{fId}",method=RequestMethod.GET)
		public String viewPost (Model model,@PathVariable Integer fId) throws SQLException {
		Forum ForumBean = service.findById(fId);
		Member memberBean = ForumBean.getMemberBean();
		List<ForumReply> list = service.getAllReplies();
	
//	    String datetimeStr = null;	  
//		String replyTime =getStringByTime  (ForumReply.getDatetime(), datetimeStr);

		model.addAttribute("ForumBean", ForumBean);
		model.addAttribute("memberBean", memberBean);
//		model.addAttribute("replyTime", replyTime);
		model.addAttribute("Replylist", list);
		

//		String datetimeStr = getStringBySqlDate(ForumBean.getDatetime());
//		model.addAttribute("datetimeStr", datetimeStr);
//		String fakeName = memberBean.getName().substring(0, 1);
//		if(memberBean.getSex().equalsIgnoreCase("MALE"))
//			fakeName += "先生";
//		else
//			fakeName += "小姐";
//		model.addAttribute("fakeName", fakeName);

		if(ForumBean.getTitle()!=null || ForumBean.getTitle().length()>0) {
			List<String> Title = Arrays.asList(ForumBean.getTitle().split(";"));
			model.addAttribute("titleList", Title);
		} else {
			model.addAttribute("titleList", "必須輸入標題");
		}
		String contentList = changeClob.ClobToString(ForumBean.getContent());	
		if(contentList==null|| contentList.length()==0)

			model.addAttribute("contentList", contentList);
		 else {
			model.addAttribute("contentList", "必須輸入內文");								
		}
		if(ForumBean.getSort()!=null || ForumBean.getSort().length()>0) {
			List<String> sort = Arrays.asList(ForumBean.getSort().split(";"));
			model.addAttribute("sortList", sort);
		} else {
			model.addAttribute("sortList", "必須選取分類");
		}
		if(ForumBean.getStatus()!=null || ForumBean.getStatus().length()>0) {
			List<String> Status = Arrays.asList(ForumBean.getStatus().split(";"));
			model.addAttribute("StatusList", Status);
		} else {
			model.addAttribute("StatusList", "下架");
		}
		
		return "Forum/ForumDetail";
	}

	   @ModelAttribute("SortList")
	    public List<Forum> getAllSorts() {
	        return service.getAllSorts();
	    }
	    
		@RequestMapping(value = "/Forum/replyE")
		public String viewPostE(Model model) {
			ForumReply reply = new ForumReply();
			model.addAttribute("reply", reply);
			return "/ForumDetail/{fId}";
		}
//	=====ADD NEW Forum=====
	@RequestMapping(value = "/Forum/add", method = RequestMethod.GET)
	public String getAddNewPostForm(Model model) {
		Forum ForumBean = new Forum();
		model.addAttribute("ForumBean", ForumBean);
		return "Forum/addPost";
	}
	@RequestMapping(value = "/Forum/addE")
	public String getAddNewPostFormE(Model model) {
		Forum ForumBean = new Forum();
		model.addAttribute("ForumBean", ForumBean);
		return "Forum/addPost";
	}
	@RequestMapping(value = "/Forum/add", method = RequestMethod.POST)	
		public String addNewPostForm(Model model,@ModelAttribute("ForumBean")Forum ForumBean, 
		HttpServletRequest request) throws ParseException {	
		Map<String, String> errorMsg = new HashMap<String, String>();	
		HttpSession httpSession = request.getSession();
		Member member = new Member(); 
		httpSession.setAttribute("forumId", ForumBean.getId());	
		ForumBean.setDatetime(new Timestamp(System.currentTimeMillis()));
		ForumBean.setStatus("上架");
		member = (Member) httpSession.getAttribute("user");
		if (member == null)
			return "/ForumView";
		ForumBean.setMemberId(member.getId());//假定會員
		if (ForumBean.getMemberId() == null ||ForumBean.getMemberId().length()==0)
		{errorMsg.put("memberE", "請先登入");
		System.out.println("請先登入");
		}
//		ForumBean.setForumBeans(ForumBean);
		if(ForumBean.getTitle()==null || ForumBean.getTitle().length()==0)
			{errorMsg.put("titleE", "必須有標題");
			System.out.println("必須有標題");}
		if(ForumBean.getSort()==null ||ForumBean.getSort().length()==0)
		{	errorMsg.put("SortE", "請選擇分類！");			
		System.out.println("必須有分類");
		}
//		try {
//			contentList =ForumBean.getContent().getSubString(1, (int) ForumBean.getContent().length());
//		} catch (SQLException e) {
//					e.printStackTrace();
//		}	
		String aa = changeClob.ClobToString(ForumBean.getContent());
		aa=request.getParameter("article");
		if(aa==null|| aa.length()==0)
			{errorMsg.put("ContentE", "請輸入內容！");
		System.out.println("必須有分類");
	}
		if (errorMsg.isEmpty()) {
			 Clob strToClob = changeClob.stringToClob(aa);
			 ForumBean.setContent(strToClob);	
				service.savePost(ForumBean);	

		return "redirect:/ForumView";
		}else {
		model.addAttribute("errorMsg", errorMsg);		
		return "forward:/Forum/addE";
	}
	}
	@RequestMapping(value = "/Forum/report", method = RequestMethod.GET)
	public String getAddNewReport(Model model) {
		Forum ForumBean = new Forum();
		model.addAttribute("ForumBean", ForumBean);
		return "Forum/ForumPost";
	}
	@RequestMapping(value = "/Forum/reply", method = RequestMethod.POST)
	public String getAddNewReply(Model model,@ModelAttribute("Reply")Forum ForumBean, 
			HttpServletRequest request) throws ParseException {	
		ForumReply reply = new ForumReply();
		Map<String, String> errorMsg = new HashMap<String, String>();
		HttpSession httpSession = request.getSession();
		Member member = new Member(); 
		httpSession.setAttribute("forumId", ForumBean.getId());	
		ForumBean.setDatetime(new Timestamp(System.currentTimeMillis()));
		ForumBean.setStatus("上架");
		member = (Member) httpSession.getAttribute("user");
		if (member == null)
			return "/ForumView";
		ForumBean.setMemberId(member.getId());//假定會員
		if (ForumBean.getMemberId() == null ||ForumBean.getMemberId().length()==0)
		{errorMsg.put("memberE", "請先登入");
		System.out.println("請先登入");
		}
		reply.setDatetime(new Timestamp(System.currentTimeMillis()));
		reply.setStatus("上架");
//		Forum.setForumReply(reply);
		reply.setTitle(ForumBean.getTitle());
		
		String aa = changeClob.ClobToString(reply.getContent());
		aa=request.getParameter("article");
		if(aa==null|| aa.length()==0)
			{errorMsg.put("ContentE", "請輸入內容！");
		System.out.println("必須有分類");
	}
		if (errorMsg.isEmpty()) {
			 Clob strToClob = changeClob.stringToClob(aa);
			 reply.setContent(strToClob);
			service.insertReply(reply);	
		return "redirect:/Forum/ForumDetail/{fid}";
		}else {
		model.addAttribute("errorMsg", errorMsg);		
		return "forward:/Forum/replyE";
	}
			
}
	
//	@RequestMapping(value = "/ForumView", method = RequestMethod.POST)
//	public String addNewForum(Model model, @ModelAttribute("ForumBean") Forum ForumBean, BindingResult br) {
//		Map<String, String> errorMsg = new HashMap<String, String>();
//			ForumBean.setMemberId("abc123");//假定會員
//			 
//			if (errorMsg.isEmpty()) {
//				ForumService.insertForum(ForumBean);
//				forumId = ForumBean.getId();
//				return "redirect:/Forum";
//			}
//			else {
//				model.addAttribute("errorMsg", errorMsg);
//				return "forward:/ForumE";
//			}
//		
//}
//	@RequestMapping(value = "/ForumReport", method = RequestMethod.GET)
//	public String getAddNewReport(Model model) {
//		ForumReport ForumReportBean = new ForumReport();
//		model.addAttribute("ForumReportBean", ForumReportBean);
//		return "Forum/ForumReport";
//	}
//	@RequestMapping(value = "/ForumReportE")
//	public String getAddNewReportE(Model model) {
//		ForumReport ForumReportBean = new ForumReport();
//		model.addAttribute("ForumReportBean", ForumReportBean);
//		return "Forum/ForumReportE";
//	}
//
//	@RequestMapping(value = "/Forum/", method = RequestMethod.POST)
//	public String addNewForumFormDetail(Model model, @ModelAttribute("ForumReportBean") ForumReport ForumReportBean,
//			HttpServletRequest request) throws ParseException {
//		Map<String, String> errorMsg = new HashMap<String, String>();
//
//		Forum ForumBean = ForumService.findById(Id);
//		ForumReportBean.setForumBean(ForumBean);
//		if(ForumReportBean.getTitle()==null || ForumReportBean.getTitle().length()==0)
//			errorMsg.put("titleE", "必須有標題");
//		if(request.getParameter("movingInN")==null ||request.getParameter("movingInN").length()==0)
//			errorMsg.put("movingInNE", "請選擇日期！");
//		if(ForumReportBean.getPrice()==null)
//			errorMsg.put("priceE", "請輸入租金！");
//		if(ForumReportBean.getShortest()==null || ForumReportBean.getShortest().length()==0)
//			errorMsg.put("shortestE", "請輸入最短租期！");
//		
//
//		    }
//		if (errorMsg.isEmpty()) {
//			String movingInN = request.getParameter("movingInN");
//			ForumReportBean.setMovingIn(getSqlDateByString(movingInN));
//			String shortestN =request.getParameter("shortestN");
//			ForumReportBean.setShortest(ForumReportBean.getShortest()+shortestN);
//			ForumService.insertDetail(ForumReportBean);
//			return "redirect:/ForumPic";
//		} else {
//			
//			model.addAttribute("errorMsg", errorMsg);
//			return "forward:/ForumReportE";
//		}
//	}

//	@RequestMapping(value = "/ForumOrder", method = RequestMethod.GET)
//	public String getAddNewForumOrderForm(Model model) {
//
//		return "Forum/ForumFormOrder";
//	}
//


	private Date getSqlDateByString(String ddMMYYYY) throws ParseException {
		SimpleDateFormat sDF = new SimpleDateFormat("dd/MM/YYYY");
		sDF.setLenient(false);
		Date date = new Date(sDF.parse(ddMMYYYY).getTime());
		return date;
	}
	private String getStringBySqlDate(Date date,String dateFormat) {
		java.util.Date javaDate = new java.util.Date(date.getTime());
		SimpleDateFormat sDF = new SimpleDateFormat("YYYY年MM月dd日");
		String yYYYMMdd = sDF.format(javaDate);
		sDF.setLenient(false);
		return yYYYMMdd;
	}
	public String getStringByTime (Timestamp datetime,String timeStr){
		 Date date=  new Date();	      
	        Timestamp timestamp=new Timestamp(new Date().getTime());
	        String Str=timestamp
	                .toString()
	                .substring(0, timestamp.toString().indexOf("."));
	        return Str;
	    }	
	}	

	

