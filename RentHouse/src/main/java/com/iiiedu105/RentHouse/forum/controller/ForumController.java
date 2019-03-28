package com.iiiedu105.RentHouse.forum.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
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
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.Member;

@Controller
public class ForumController {
	String fakeM = "abc123";// 假定會員
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
	@RequestMapping(value = "/ForumView")
	public String viewForum(Model model) {
		List<Forum> list = service.getAllPosts();
		model.addAttribute("flist", list);
		model.addAttribute("member", new Member());
		return "Forum/ForumView";
	}

	@RequestMapping(value = "/forumUpdate/{fid}")
	public String updatForum(Model model) {
		Forum forum = new Forum();
		service.updatePost(forum);
		return "redirect:/ForumView";
	}

	@RequestMapping(value = "/forumDelete/{fid}")
	public String deleteForum(@PathVariable("fid") Integer fid) {
		Forum ForumBean = new Forum();
		ForumBean.setStatus("下架");
		service.deletePost(fid);
		return "redirect:/Forumview";
	}


	@RequestMapping(value = "/Forum/ForumDetail/{fId}", method = RequestMethod.GET)
	public String viewPost(Model model, @PathVariable Integer fId) throws SQLException {
		Forum ForumBean = service.findById(fId);
		Member memberBean = ForumBean.getMemberBean();
		List<ForumReply> list = service.getAllReplies(fId);
		ForumReport forumReport = new ForumReport();
		
//	    String datetimeStr = null;	  
//		String replyTime =getStringByTime  (ForumReply.getDatetime(), datetimeStr);

		model.addAttribute("forumReport",forumReport);
		
		model.addAttribute("ForumBean", ForumBean);
		model.addAttribute("memberBean", memberBean);
//		model.addAttribute("replyTime", replyTime);
		model.addAttribute("ReplyBean", list);


//		if(ForumBean.getTitle()!=null || ForumBean.getTitle().length()>0) {
		List<String> Title = Arrays.asList(ForumBean.getTitle().split(";"));
		model.addAttribute("titleList", Title);
//		} else {
//			model.addAttribute("titleList", "必須輸入標題");
//		}
		String contentList = changeClob.ClobToString(ForumBean.getContent());
//		if(contentList==null|| contentList.length()==0)
		model.addAttribute("contentList", contentList);		
		List <Object[]> textList =new LinkedList<>();
		for (ForumReply r:list) {
			String replyList = changeClob.ClobToString(r.getContent());			
			Object[] obj = new Object[2];
			obj[0]=r;
			obj[1]=replyList;			
			textList.add(obj); 	
		}	
		model.addAttribute("replyList", textList);
//		 else {
//			model.addAttribute("contentList", "必須輸入內文");								
//		}
//		if(ForumBean.getSort()!=null || ForumBean.getSort().length()>0) {
//		List<String> sort = Arrays.asList(ForumBean.getSort().split(";"));
//		model.addAttribute("sortList", sort);
//		} else {
//		model.addAttribute("sortList", "必須選取分類");
//		}
//		if(ForumBean.getStatus()!=null || ForumBean.getStatus().length()>0) {
//		List<String> Status = Arrays.asList(ForumBean.getStatus().split(";"));
//		model.addAttribute("StatusList", Status);
//		} else {
//			model.addAttribute("StatusList", "下架");
//		}

		return "Forum/ForumDetail";
	}

//	@ModelAttribute("SortList")
//	public List<Forum> getAllSorts() {
//		return service.getAllSorts();
//	}

	@RequestMapping(value = "/Forum/replyE/{fid}")
	public String viewPostE(Model model, @PathVariable(value = "fid") Integer fid) {
		ForumReply reply = new ForumReply();
		model.addAttribute("reply", reply);
		return "redirect:/ForumDetail/" + fid;
	}

	@RequestMapping(value = "/Forum/reply", method = RequestMethod.POST)
	public String getAddNewReply(Model model, @ModelAttribute("Reply") Forum ForumBean, HttpServletRequest request,
			@RequestParam(value = "fid") Integer fid) throws ParseException {

		ForumReply reply = new ForumReply();
		Map<String, String> errorMsg = new HashMap<String, String>();
		HttpSession httpSession = request.getSession();
		Member member = new Member();
		httpSession.setAttribute("forumId", ForumBean.getId());
		reply.setDatetime(new Timestamp(System.currentTimeMillis()));
		ForumBean.setStatus("上架");
		member = (Member) httpSession.getAttribute("user");
		if (member == null)
			return "/ForumView";
//			ForumBean.setMemberId(member.getId());//假定會員
		reply.setMemberBean(member);
//			if (member == null )
//			{errorMsg.put("memberE", "請先登入");
//			System.out.println("請先登入");
//			}
		reply.setDatetime(new Timestamp(System.currentTimeMillis()));
		reply.setStatus("上架");
//			Forum.setForumReply(reply);
		Forum forReply = service.findById(fid);
		reply.setForumBean(forReply);
		reply.setTitle(forReply.getTitle());

		String aa = "";
		aa = request.getParameter("article");
		if (aa == null || aa.length() == 0) {
			errorMsg.put("ContentE", "請輸入內容！");
			System.out.println("必須有分類");
		}
		if (errorMsg.isEmpty()) {
			Clob strToClob = changeClob.stringToClob(aa);
			reply.setContent(strToClob);
			service.insertReply(reply);
			return "redirect:/Forum/ForumDetail/"+fid;
		} else {
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/Forum/replyE/" + fid;
		}

	}

//	=====ADD NEW Forum=====
	@RequestMapping(value = "/Forum/add", method = RequestMethod.GET)
	public String getAddNewPostForm(Model model) {
		Forum ForumBean = new Forum();
		model.addAttribute("ForumBean", ForumBean);
		model.addAttribute("member", new Member());
		return "Forum/addPost";
	}

	@RequestMapping(value = "/Forum/addE")
	public String getAddNewPostFormE(Model model) {
		Forum ForumBean = new Forum();
		model.addAttribute("member", new Member());
		model.addAttribute("ForumBean", ForumBean);
		return "Forum/addPost";
	}

	@RequestMapping(value = "/Forum/add", method = RequestMethod.POST)
	public String addNewPostForm(Model model, @ModelAttribute("ForumBean") Forum ForumBean, HttpServletRequest request)
			throws ParseException {
		Map<String, String> errorMsg = new HashMap<String, String>();
		HttpSession httpSession = request.getSession();
		Member member = new Member();
//		service.findMemberById();
//		httpSession.setAttribute("forumId", ForumBean.getId());	
		ForumBean.setDatetime(new Timestamp(System.currentTimeMillis()));
		ForumBean.setStatus("上架");
		member = (Member) httpSession.getAttribute("user");
		
		if (member == null)
			{return "Forum/ForumView";}
//		ForumBean.setMemberId(member.getId());//假定會員
		ForumBean.setMemberBean(service.findMemberById(member.getId()));
//		ForumBean.setMemberBean(member);
		if (ForumBean.getMemberBean() == null ) {
			errorMsg.put("memberE", "請先登入");
			System.out.println("請先登入");
			return "forward:/Forum/addE";
		}
//		ForumBean.setForumBeans(ForumBean);
		if (ForumBean.getTitle() == null || ForumBean.getTitle().length() == 0) {
			errorMsg.put("titleE", "必須有標題");
			System.out.println("必須有標題");
			return "forward:/Forum/addE";
		}
		if (ForumBean.getSort().equals("請選擇分類") ) {
			errorMsg.put("SortE", "請選擇分類！");
			System.out.println("必須有分類");
			return "forward:/Forum/addE";
		}

		String aa = "";
		aa = request.getParameter("article");
		if (aa == null || aa.length() == 0) {
			errorMsg.put("ContentE", "請輸入內容！");
			System.out.println("必須有分類");
			return "forward:/Forum/addE";
		}
		
			Clob strToClob = changeClob.stringToClob(aa);
			ForumBean.setContent(strToClob);
			service.savePost(ForumBean);
			return "redirect:/ForumView";
//		else {
//			model.addAttribute("errorMsg", errorMsg);
//			
//			return "forward:/Forum/addE";
//		}
		}
		
	@RequestMapping(value = "/Forum/report", method = RequestMethod.GET)
	public String getAddNewReport(Model model) {
		Forum ForumBean = new Forum();
		model.addAttribute("ForumBean", ForumBean);
		return "Forum/ForumPost";
	}


	//處理檢舉文章
	@RequestMapping(value = "/ForumDetail/processReport", method = RequestMethod.POST)
	public String processReport(@ModelAttribute("forumReport") ForumReport forumReport,HttpServletRequest req) {
		HttpSession sesion = req.getSession();
		Clob content = changeClob.stringToClob(req.getParameter("con"));
		String fid = req.getParameter("forumid");
		forumReport.setContent(content);
		forumReport.setStatus("待審");
		forumReport.setMemberBean((Member)sesion.getAttribute("user"));
		forumReport.setForumBean(service.findById(Integer.parseInt(fid)));
		Timestamp time = new Timestamp(new java.util.Date().getTime());
		forumReport.setDatetime(time);
//		 Integer id = forumReport.getForumBean().getId();
		 service.savefReport(forumReport);
		return "redirect:/ForumView";
	}
	



	private Date getSqlDateByString(String ddMMYYYY) throws ParseException {
		SimpleDateFormat sDF = new SimpleDateFormat("dd/MM/YYYY");
		sDF.setLenient(false);
		Date date = new Date(sDF.parse(ddMMYYYY).getTime());
		return date;
	}

	private String getStringBySqlDate(Date date, String dateFormat) {
		java.util.Date javaDate = new java.util.Date(date.getTime());
		SimpleDateFormat sDF = new SimpleDateFormat("YYYY年MM月dd日");
		String yYYYMMdd = sDF.format(javaDate);
		sDF.setLenient(false);
		return yYYYMMdd;
	}

	public String getStringByTime(Timestamp datetime, String timeStr) {
		Date date = new Date();
		Timestamp timestamp = new Timestamp(new Date().getTime());
		String Str = timestamp.toString().substring(0, timestamp.toString().indexOf("."));
		return Str;
	}
}
