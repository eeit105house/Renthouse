<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="Forum/css/forumTest.css"
	type="text/css" >
<link href="${pageContext.request.contextPath}/login/css/bootstrap.css" rel="stylesheet">
<link href="login/css/landing-page.css" rel="stylesheet">
<title>租你幸福--討論區 租屋,房屋買賣,搬家,房屋討論</title>
</head>
<body style="background-color: #ffebd7;"><body>
	<div style="height: 75px;">
		<%@include file="../login/narbar.jsp"%>
	</div>
<input type="hidden" id="hid_region" value="台北市">

<script language="javascript" src="./include/javascript/newHeader/jsCookie.js"></script>
<script language="javascript" src="./include/javascript/newHeader/areaBoxNew.js?v=20190312"></script>
   
<div class="forum forum-rel">
<div class="crumbs">當前位置：<a href="https://bbs.591.com.tw/">591討論區</a>&nbsp>&nbsp<a href='/f?forum_type=1'>房市討論</a>&nbsp>&nbsp首購族的推薦</div>
<span class="clearH9"></span><div class="button_line">
   <table width="100%" border="0">
   <nav class="navbar navbar-light bg-light navbar-expand-lg static-top navbar-fixed-top" style="border-bottom:1px solid black; ">
         <div class="container" style="margin: 0;padding: 0;">
      <a class="navbar-brand"  href="${pageContext.request.contextPath}"><img style="height: 60px" alt="租你幸福" src="<c:url value='/login/img/logo.png'/>"></a>
      <ol class="breadcrumb">
  <li><a href="#">Home</a></li>
  <li><a href="#">Library</a></li>
  <li class="active">Data</li>
</ol>
      <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">      
       <li class="nav-item"><a class="btn btn-nav-primary" href="<c:url value='/ForumView'/>">返回列表</a></li>

<%--         <c:choose> --%>
<%--         <c:when test="${page.totalPage <= 6}"> --%>
<%--             <c:set var="begin" value="1"/> --%>
<%--             <c:set var="end" value="${page.totalPage}"/> --%>
<%--         </c:when> --%>
<!--         页数超过了6页 -->
<%--         <c:otherwise> --%>
<%--             <c:set var="begin" value="${page.currentPage - 1}"/> --%>
<%--             <c:set var="end" value="${page.currentPage + 3}"/> --%>
<!--             如果begin减1后为0,设置起始页为1,最大页为6 -->
<%--             <c:if test="${begin -1 <= 0}"> --%>
<%--                 <c:set var="begin" value="1"/> --%>
<%--                 <c:set var="end" value="6"/> --%>
<%--             </c:if> --%>
<!--             如果end超过最大页,设置起始页=最大页-5 -->
<%--             <c:if test="${end > page.totalPage}"> --%>
<%--                 <c:set var="begin" value="${page.totalPage - 5}"/> --%>
<%--                 <c:set var="end" value="${page.totalPage}"/> --%>
<%--             </c:if> --%>
<%--         </c:otherwise> --%>
<%--     </c:choose> --%>
<!--     遍历 -->
<%--     <c:forEach var="i" begin="${begin}" end="${end}"> --%>
<!--         当前页,选中 -->
<%--         <c:choose> --%>
<%--             <c:when test="${i == page.currentPage}"> --%>
<%--                 <li class="active"><a href="#">${i}</a></li> --%>
<%--             </c:when> --%>
<!--             不是当前页 -->
<%--             <c:otherwise> --%>
<%--                 <li><a href="forumDetail?currentPage=${i}">${i}</a></li> --%>
<%--             </c:otherwise> --%>
<%--         </c:choose> --%>
<%--  </c:forEach> --%>

<%--       <li class="nav-item"><a class="btn btn-nav-primary" href="<c:url value='/insertPicPage'/>">測試用</a></li> --%>
<%--       <li class="nav-item"><a class="btn btn-nav-primary" href="<c:url value='/membercontrol/${user.id}'/>">會員中心</a></li> --%>
<%--       <li class="nav-item"><a class="btn btn-nav-primary" href="<c:url value='/ForumView'/>">返回列表</a></li> --%>
<!--       </ul> -->
<!--       </div> -->
      
<!-- 中间页 -->
<!--     显示6页中间页[begin=起始页,end=最大页] -->
<!--     总页数没有6页 -->
  

<!--   </table> -->
<!-- </div> -->

	<form:form action="./ForumDetail/{fId}" modelAttribute="reply" method="GET">
		<!--repaly content -->
		<div class="content_box">
			<div class="articleTitle">
				<div class="title_detail">
					<b></b><span><h1 style="font-size: 15px;">${titleList}</h1></span>
				</div>
				<!-- 				<div class="title_view"> -->
				<!-- 					瀏覽&nbsp;&nbsp;<span class="org">47123</span><font -->
				<!-- 						class="vertical_line">|</font>回覆&nbsp;&nbsp;<span class="">15</span>&nbsp; -->
				<!-- 				</div> -->
			</div>
			<!--content start-->
			<div class="content">
				<div class="leftSideBar">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2" align="center"><img
								src="//images.591.com.tw/index/forum/head-image.png" width="80"
								height="80" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="font-weight: 700">${user.name}</td>
						</tr>
						<!-- 						<tr> -->
						<!-- 							<td width='42%' align='right'>註冊：</td> -->
						<!-- 							<td width='58%' valign='top'>2016-05-11</td> -->
						<!-- 						</tr> -->
						<!-- 						<tr> -->
						<!-- 							<td align='right'>文章：</td> -->
						<!-- 							<td valign='top'>17</td> -->
						<!-- 						</tr> -->
						<!-- 						<tr> -->
						<!-- 							<td align='right'>回覆：</td> -->
						<!-- 							<td valign='top'>98</td> -->
						<!-- 						</tr> -->
					</table>
				</div>
				<div class="rightSideBar" style="position: relative">
					<div class="blog-wonder-sign"></div>
					<div class="content_floor" style="height: 20px">
						<ul>
							<li style="float: left;"><font class="orange">&nbsp;&nbsp;發表於
									${forum.datetime}</font></li>
							<!--<li class="voted_counts"></li>-->
							</ul>

					<div class="content_detail">
						<div class="font_15">${forum.content}</div>					
					</div> 
					<!--装潢日记投票-->
					<div style="text-align: center;">
						<div style="width: 300px; margin: 0 auto; display: none;"
							class="clearfix"></div>
					</div>
					<div class="content_share">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<!-- 								<td width="74%">分享到&nbsp;&nbsp;<a href="javascript:;" -->
								<!-- 									onclick='window.open("http://www.facebook.com/sharer.php?u=bbs.591.com.tw%2Ff%3Faction%3Dreplay%26tid%3D37381%26sub_fid%3D25%26src%3Dsp", "facebook_frm","height=450,width=560");'><img -->
								<!-- 										src="//images.591.com.tw/index/forum/f_icon.gif" width="16" /></a>&nbsp;<a -->
								<!-- 									href="javascript:;" -->
								<!-- 									onclick='window.open("http://twitter.com/share?url=bbs.591.com.tw/f?action=replay&tid=37381&sub_fid=25&text=首購族的推薦-房產新聞-租屋討論區-591", "twitter_frm","height=450,width=560");'><img -->
								<!-- 										src="//images.591.com.tw/index/forum/t_icon.gif" width="16" /></a>&nbsp;<a -->
								<!-- 									href="javascript:;" -->
								<!-- 									onclick='window.open("http://www.plurk.com/?qualifier=shares&status=首購族的推薦-房產新聞-租屋討論區-591 bbs.591.com.tw/f?action=replay&tid=37381&sub_fid=25", "plurk_frm","height=700,width=1000");'><img -->
								<!-- 										src="//images.591.com.tw/index/forum/p_icon.gif" width="16" /></a></td> -->
								<td width="26%" align="right"><a href="#re_button"
									onClick="reply_content('${reply.member.id}');">回覆</a>&nbsp;<font
									class="vertical_line">|</font> <a href="#re_button"
									onClick="quote_content('${furum.id}','./${contentList}')">引用</a>&nbsp;<font
									class="vertical_line">|</font> <a href="#"><img
										src="//images.591.com.tw/index/forum/top_icon.gif" width="13" /></a>
								</td> 	 	
							</tr>
						</table>
					</div>
				</div>
				<img src="//images.591.com.tw/index/forum/bbs_line.gif" width="948"
					height="3" style="float: left;" />
				<div style="clear: left;"></div>
			</div>
  <c:forEach var="reply" items="${Replylist}">
			<div class="content">
				<div class="leftSideBar">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2" align="center"><img
								src="//images.591.com.tw/index/forum/head-image.png" width="80"
								height="80" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="font-weight: 700">
								${ForumReply.Member_Id.id}</td>
						</tr>
						<!--   <tr><td width='42%' align='right'>註冊：</td><td width='58%' valign='top'>2012-07-19</td></tr><tr><td align='right'>文章：</td><td valign='top'>44</td></tr><tr><td align='right'>回覆：</td><td valign='top'>422</td></tr> -->
					</table>
				</div>
				<div class="rightSideBar" style="position: relative">

					<div class="blog-wonder-sign"></div>
					<div class="content_floor" style="height: 20px">
						<ul>
							<li style="float: left;"><font class="orange">2樓</font>&nbsp;&nbsp;發表於
								${ForumReply.dateTime}</li>
							<!--<li class="voted_counts"></li>-->
					</div>
					<div class="content_detail">
						<div class="font_15">${furumReply.content}</div>
					</div>
					<!--装潢日记投票-->
					<div style="text-align: center;">
						<div style="width: 300px; margin: 0 auto; display: none;"
							class="clearfix"></div>
					</div>
					<div class="content_share">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="26%" align="right"><a href="#re_button"
									onClick="reply_content('2樓','呼啦啦');">回覆</a>&nbsp;<font
									class="vertical_line">|</font> <a href="#re_button"
									onClick="quote_content('329397','./f')">引用</a>&nbsp;<font
									class="vertical_line">|</font> <a href="#"><img
										src="//images.591.com.tw/index/forum/top_icon.gif" width="13" /></a>
								</td>
							</tr>
							
						</table>

					</div>
</div></div></c:forEach>
<div class="button_line">
     <table width="100%" border="0">
						<tr>
<!-- 							<td width="10%"><a class="rep-btn" href="#rep">回覆</a></td> -->
<!-- 							<td width="10%"><a class="pub-btn" -->
<!-- 								href="./f?action=publish&fid=25&sub_fid=25">發表</a></td> -->
							<td width="80%" align="right">
								<div class="pageBar">
									<a href="<c:url value='/ForumView'/>"
										class='pagePrev'><span>返回列表</span></a><span
										class="pageCurrent"> 1 </span><a class="pageNum-form"
										href='./f?firstRow=10&totalRows=17&tid=37381&sub_fid=25&module=index&action=replay'>
										2 </a><a
										href='./f?firstRow=10&totalRows=17&tid=37381&sub_fid=25&module=index&action=replay'
										class="pageNext"><span>下一頁</span></a><input class='pageBtn'
										type='button'
										onclick='self.location="./f?firstRow=10&totalRows=17&tid=37381&sub_fid=25&module=index&action=replay"'
										value='末頁' /><span class="pageSkip">到第 <input
										style="border: 1px solid #999999; font-family: Arial; margin: 0 4px; padding: 2px 3px; text-align: center; width: 24px;"
										type='text' size='3' id='gotoPage2' value="1" /> 頁
									</span><input type="button" value="確定" class="pageBtn"
										onclick="toPage2(this);" />
									<script type="text/javascript">
										function toPage2(obj) {
											var gotoPage = document
													.getElementById("gotoPage2").value;
											var goPage = (gotoPage - 1) * 10;
											if (gotoPage > 2)
												return alert('提示：輸入錯誤');
											self.location.href = "./f?firstRow="
													+ goPage
													+ "&totalRows=17&tid=37381&sub_fid=25&module=index&action=replay";
										}
									</script>
								</div>
							</td>
						</tr>
					</table>
</div>

					</form:form>
					<!--editor start-->
					<!-- 				============檢舉按鈕開始================			 -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#writeReport" data-whatever="@mdo">檢舉</button>
	<div class="modal fade" id="writeReport" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">檢舉文章</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form:form  method="POST" action="/RentHouse/ForumDetail/processReport" modelAttribute="forumReport" onsubmit="alert('檢舉成功!!')">
        <div class="form-group">
            <label for="recipient-name" class="col-form-label">檢舉類型:</label>
            <form:select path="type">
            <form:option value="不當言論">不當言論</form:option>
            <form:option value="廣告行為">廣告行為</form:option>
            <form:option value="主題不符">主題不符</form:option>
            <form:option value="騷擾言論">騷擾言論</form:option>
            <form:option value="煽動性言論">煽動性言論</form:option>
            <form:option value="其他">其他</form:option>
            </form:select>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">內容:</label>
            <textarea name="con" class="form-control" id="message-text" required="true"></textarea>
          </div>
        <input type="submit" class="btn btn-primary" value="送出"/>
		<input type="hidden" name="forumid" value="${ForumBean.id }"/>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </form:form>
    </div>
  </div>
</div>
					</div> 
<!-- 		================檢舉按鈕結束=======================			 -->
					
<a name="rep"></a>
<div class="editor-replay-content"  >
<form name="rep-info" method="post" action="./reply" modelAttribute="ForumBean" onSubmit="return chkPost();">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
						<td><span class="content_replay font_15" id="re_button">回覆文章</span><br />
							<textarea id="mycontent" name="mycontent"
								style="width: 583px; height: 243px;"></textarea>
							<div id="parent_content"
								style="padding-top: 10px; display: none; height: 21px;">
								<span id="content_help" style="display: none"></span>
							</div></td>
						<td></td>
					</tr>
  <tr height="10"><td></td></tr>
<!-- 					<tr> -->
<!-- 						<td>請先登入會員，<a -->
<!-- 							href="login/Login_plustar.jsp" -->
<!-- 							data-stat="replay-userlogin" -->
<!-- 							onclick="this.href=this.href+'&redirect='+escape(location.href)">登入</a> -->
<!-- 							<a data-stat="replay-userreg" -->
<%-- 							href="${pageContext.request.contextPath}/login/Registered_plustar">註冊</a><br /> --%>
<!-- 					</a><br> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr height="10"><td><span id="UploadStatus"></span></td></tr>
  <tr>
    <td>
    <input type="submit" class="rep-sub" value="回覆文章"/>
    <input name="fid" type="hidden" id="fid" value="25">
            <input type="hidden" name="action" value="postReply">
            <input type="hidden" name="${forumReply.Forum_Id}" value="25">
            <input name="name" type="hidden" id="nickname" value="">
            <input name="user_id" type="hidden" id="user_id" value="-1">
            <input name="tid" type="hidden" id="tid" value="37381">
    </td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
        	</td>
  </tr>
</table>
<div class="editor-replay gray-replay">
      <ul>
        <li> 會員可針對591房屋交易網的所有標題與內容自由發表評論，本討論區上的主題與內容皆不代表591的立場。</li>
        <li> 會員在發表文章之前，確認所發之內容（如圖片）未侵害到他人的著作權、商標、專利等權利。如因會員所發文章而產生的版權法律責任將由會員承擔。</li>
        <li> 會員必須同意不在討論區發表任何具有偽造詐欺的、誹謗的、錯誤的、辱駡的、粗俗的、有害的、騷擾的，淫穢的，褻瀆的、性別導向的、威脅侵犯他人隱私的、或者違反任何法律法規等資訊。若遭檢舉發現，591有權將版主文章鎖帖或刪除，情節重大者將取消該會員之資格。</li>
        <li> 討論區嚴禁灌水行為；禁止以任意形式發佈廣告內容；禁止發佈或回復與591房屋交易網主旨不相符的文章。若有發現，591有權自行刪除。</li>
        <li> 發帖內容與版塊內容不符，管理員有權刪除文章或將文章移至合適的版塊。</li>
        <li> 請勿留下身份證字號、住址等個人隱私資料，以免遭人盜用，591不負管理之責。</li>
        <li> 所有會員皆須遵守以上原則，不同意者請勿在此發表言論。</li>
      </ul>      
    </div>
</div>
<!--editor end-->
					
</body>
</html>