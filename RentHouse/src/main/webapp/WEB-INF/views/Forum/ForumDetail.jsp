
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>租你幸福--討論區 租屋,房屋買賣,搬家,房屋討論</title>

</head>
<body>
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
		integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
		crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/styles.css"
		type="text/css" />
		

<input type="hidden" id="hid_region" value="台北市">

<script language="javascript" src="./include/javascript/newHeader/jsCookie.js"></script>
<script language="javascript" src="./include/javascript/newHeader/areaBoxNew.js?v=20190312"></script>
   
<div class="forum forum-rel">
<div class="crumbs">當前位置：<a href="https://bbs.591.com.tw/">591討論區</a>&nbsp>&nbsp<a href='/f?forum_type=1'>房市討論</a>&nbsp>&nbsp首購族的推薦</div>
<span class="clearH9"></span><div class="button_line">
   <table width="100%" border="0">
    <tr>
      <td width="10%"><a class="rep-btn" href="#rep">回覆</a></td>
      <td width="10%"><a class="pub-btn" href="./f?action=publish&fid=25&sub_fid=25">發表</a></td>
					<td width="80%" align="right">
						<div class="pageBar">
							<a href="ForumView" class="pagePrev"><span>返回列表</span></a><span
								class="pageCurrent"> 1 </span><a class="pageNum-form"
								href='./f?firstRow=10&totalRows=17&tid=37381&sub_fid=25&module=index&action=replay'>
								${forumBean} </a><a
								href='./f?firstRow=10&totalRows=17&tid=37381&sub_fid=25&module=index&action=replay'
								class="pageNext"><span>下一頁</span></a><input class='pageBtn'
								type='button'
								onclick='self.location="./f?firstRow=10&totalRows=17&tid=37381&sub_fid=25&module=index&action=replay"'
								value='末頁' /><span class="pageSkip">到第 <input
								type='text' size='3' id='gotoPage'
								onkeyup="this.value=this.value.replace(/\D/g,'');" value="1" />
								頁
							</span><input type="button" value="確定" class="pageBtn"
								onclick="toPage(this);" />
							<script type="text/javascript">
								function toPage(obj) {
									var gotoPage = document
											.getElementById("gotoPage").value;
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

	<form:form action=./ForumDetail/{fId} modelAttribute="reply" method="GET">
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
							<td colspan="2" align="center" style="font-weight: 700">${furum.Member_Id.id}</td>
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
					</div>
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
								${replyTime}</li>
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

					</form:form>
</body>
</html>