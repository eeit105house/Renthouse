
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
</script>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="Forum/Fcss/bootstrap.css" rel="stylesheet" />
<link
	href="//fonts.googledeapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- 首頁樣式 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"></link>
<title>發表文章</title>
</head>
<body style="background-color: #ffebd7;">

	<script type="text/javascript">
		function spawn() {
			if (self.Spawnextended)
				Spawnextended();
			if (self.Spawnbody)
				Spawnbody();
			if (self.Spawnnugget)
				Spawnnugget();
		}

		function SetCookie(name, value) {
			var today = new Date();
			var expire = new Date();
			expire.setTime(today.getTime() + (60 * 60 * 24 * 30));
			document.cookie = 'serendipity[' + name + ']=' + escape(value)
					+ ';expires=' + expire.toGMTString();
		}

		function addLoadEvent(func) {
			var oldonload = window.onload;
			if (typeof window.onload != 'function') {
				window.onload = func;
			} else {
				window.onload = function() {
					oldonload();
					func();
				}
			}
		}
	</script>

	<script type="text/javascript">
		
	</script>
</head>

<body
	onload="spawn();MM_preloadImages('/group/village/imgs/post-2.gif');var focuselt=document.getElementById('subject'); if (focuselt) focuselt.focus();">
	<div style="height: 75px;">
		<%@include file="../login/narbar.jsp"%>
	</div>
	<div class="form-group">
	

		<div id="j-publish-style" style="display: none;"></div>
		<div class="pubish_box">
			<div class="publish_content">

				<form:form action="./add" modelAttribute="ForumBean" method="POST"
					name="form1" id="form1"  data-toggle="validator"
					onsubmit="return chkPost();checkBbsCate();return checkForumPost();alert('檢舉成功!!');" 
					class='form-horizontal' enctype="multipart/form-data">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2" align="center"><span class="content_replay font_13"><h1>發表新文章</h1></span>
							</td>
						</tr>
						<tr>
							<td width="8%">選擇分類:</td>
							<td width="92%" colspan="2"><form:select path="sort"
									name="cateTitle" id="cateTitle"
									onchange="changeCateTitle(this,0);checkBbsCate();changeSubTitle(1);" required="required">
									<option value="">請選擇分類</option>
									<option value="心情抒發">心情抒發</option>
									<option value="租屋交流">租屋交流</option>
									<option value="知識問答">知識問答</option>
									<option value="房價討論">房價討論</option>
									<option value="其他">其他</option>
								</form:select> 
								<div class="help-block with-errors"></div>	
								<span id="cate_id_box"></span> <span id="parent_cate_id"
								style="padding-top: 10px; display: none; height: 21px;">
									<span id="cate_id_help" style="display: none"></span>
							</span></td>

						</tr>

						<tr>
							<td>文章標題:</td>
							<td>
<%-- 							<form:input path="title" name="title" id="title" --%>
<%-- 									type="text" class="input" onblur="checkBbsTitle();" data-minlength="1" data-error="請填寫標題" /> --%>
									<input path="title" name="title" id="title"
									type="text" class="input" onblur="checkBbsTitle();" required="required"/>
									<div class="help-block with-errors"></div>	
								<%-- 									<p>${errorMsg.titleList}</p> --%>
								<div id="parent_title" class="col-lg-10"
									style="padding-top: 10px; display: none; height: 21px;">
									<span id="title_help" style="display: none"></span>
								</div></td>
						</tr>
						<tr>
							<td valign="top">文章內容:</td>

							<td><textarea id="article" name="article"
									style="width: 90%; height: 400px"></textarea>
									<div class="help-block with-errors"></div>	
								<div id="parent_content"
									style="padding-top: 10px; display: none; height: 21px;">
									<span id="content_help" style="display: none"></span>
								</div>
								<div>
								
</div></div></td>

						</tr>
						<!-- 						<tr> -->
						<!-- 							<td>&nbsp;</td> -->
						<!-- 							<td> -->
						<!-- 								<div id="uploadBox"> -->
						<!-- 									上傳圖片：<input name="img" type="file" size="35" -->
						<!-- 										onkeydown="return false" onkeypress="return false" -->
						<!-- 										onchange="if (! isImage(this.value)) $('imgError').value=1;forumupload(this);" /> -->
						<!-- 								</div> -->
						<!-- 								<div id="failMsg" style="display: none; color: #f00">圖片太寬,請把寬度控制在770px以內</div> -->
						<!-- 							</td> -->
						<!-- 						</tr> -->
						<tr>
							<td>&nbsp;</td>
							<td><span id="UploadStatus"></span> <input class="pub"
								type="submit" value="發表文章" onclick="return check_blog_type(); " />				
								<input name="fid" type="hidden" id="fid" value="0" /> <input
								name="sub_fid" type="hidden" id="sub_fid" value="0" /> <input
								name="action" type="hidden" id="action" value="postThread" /> <input
								name="nickname" type="hidden" id="nickname" value=""> <input
								name="user_id" type="hidden" id="user_id" value="2582982">
								<input type="hidden" id="is_admin" value="0"></td>
								
						</tr>

					</table>
				
				
				</form:form>
			<div class="forum">
    <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>Success!</strong> Your message has been sent successfully.
			</div>
		</div>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
		<script language="javascript">
//Drag.init($('GalleryTitle'), $('Gallery'));	
//pageInit();

function checkForumPost()
{
 	
		if(!checkBbsCate()){checkStr += 'cateTitle ';}
		if(!checkBbsTitle()){checkStr += 'title ';}
	if(!checkBbsContent()){checkStr += 'twbbsEditor ';}
	if('' != checkStr){
		var tempStr = checkStr.split(" ");
		$(tempStr[0]).focus();
		return false;
	}
	return true;
}

function changeCateTitle(obj,fid){
	var cateid = obj.value;
	var url = "Forum/ForumView";
	var postStr = "module=index&action=getCateType&cateid="+ myencode(cateid)+'&fid='+myencode(fid);
	Http_Post_Request(url, postStr, callBack);	
	return false;
}

function callBack(val){
	$("cate_id_box").innerHTML = val;
}
$jq(window).load(function(){
    if($jq("#cateTitle").val() != ''){
        $jq("#cateTitle").change();
    }
})


function check_blog_type(){

    var _type = jQuery("#cateTitle option:selected").val();
    /*普通用户*/
    if(_type == ""){

        }else{
            jQuery("#cate_id_help").style.color="red".html("沒有選擇版名，請選擇您要發表的版名。");
            jQuery("#cate_id_help").addClass("caution_prompt");
            jQuery("#cate_id_help").attr("style","display:'';");
            jQuery("#parent_cate_id").attr("style","display:'';");
            return false;
            
        } 
    }

/**
 *@function装潢日志自动添加前标题,自动调整编辑框高度
 *@para r_type 等于1：其他类型的帖子标题，编辑框高度还原正常；等于0或空 装潢日志相应变更
 *@author zhangqiang
 *@date20130620
 **/
function changeSubTitle(r_type){
	return false;
    var _sub_id = jQuery("#cate_id option:selected").val();
	if("96" == _sub_id){
		window.location.href = design_domain+"design_blog/f?action=publish&sub_fid=96";
	}
    var _title_obj = jQuery("#title");
    var _content_obj = jQuery("#xhe0_iframe");
    var _box = jQuery("#xhe0_iframearea");
    if(r_type == "1"){
        _title_obj.val("");
        _content_obj.height("405px");
        _box.height("376px");
    }else{
        if(_sub_id == "96"){
            _title_obj.val("【591裝潢日記大賽】");
            _content_obj.height("605px");
            _box.height("605px");
        }else{
            _title_obj.val("");
            _content_obj.height("405px");
            _box.height("376px");
        }
    }
}
$jq('#content').xheditor({tools:'FontSize,Bold,Underline,FontColor,BackColor,Removeformat,|,List,Align,Left,Center,Right,Outdent,Indent,|,Preview,Img,Media',beforeSetSource:ubb2html,beforeGetSource:html2ubb,forcePtag:false});

function chkPost(){
NickName.showDialog(); return false;nickname = $('nickname').value;
user_id = $('user_id').value;

$('mycontent').value = _obj_editor.getSource();

if(nickname == "" && user_id > 0){
	showNewforum();
	return false;
}
return true;
}

</script>
		
</body>
</html>
