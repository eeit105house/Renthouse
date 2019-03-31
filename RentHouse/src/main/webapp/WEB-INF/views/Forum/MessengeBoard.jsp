<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Forum/Fcss/bbs.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Forum/Fcss/forumTest.css"
	type="text/css">

<link href="${pageContext.request.contextPath}/Forum/Fcss/bootstrap.css"
	rel="stylesheet" type="text/css" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/Forum/css/bbs.css" type="text/css" > --%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/Forum/js/jquery-3.3.1.js"></script>
<title>租你幸福--討論區 租屋,房屋買賣,搬家,房屋討論</title>
</head>
<body style="background-color: #ffebd7;">
<body>
	<div style="height: 75px;">
		<%@include file="../login/narbar.jsp"%>
	</div>

	<script language="javascript"
		src="./include/javascript/newHeader/jsCookie.js"></script>
	<script language="javascript"
		src="./include/javascript/newHeader/areaBoxNew.js?v=20190312"></script>

	<a class="btn btn-nav-primary" href="<c:url value='/ForumView'/>">返回列表</a>
<div class="container">
	<!--repaly content -->
	<div class="forum forum-rel">
	<div class="content">
		<div class="content_box">
			<div class="articleTitle" align="left">
				<div class="title_detail">
				<h1>${titleList}<span class="badge badge-secondary" >文章標題</span></h1>
					
				</div>
			</div>
		<!--content start-->
					<div class="leftSideBar">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td colspan="2" align="center"><img
										src="//images.591.com.tw/index/forum/head-image.png"
										width="80" height="80" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 700">${memberBean.id}</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="rightSideBar">
						<div class="blog-wonder-sign"></div>
						<div class="content_floor" style="height: 20px">
							<ul>
								<li style="float: left;"><font class="orange">&nbsp;&nbsp;發表於
										${ForumBean.datetime}</font></li>
								<!--<li class="voted_counts"></li>-->
							</ul>
						</div>
						<div class="content_detail">
							<div class="font_15">${contentList}</div>
						</div>

						<!--装潢日记投票-->
						<div style="text-align: center;">
							<div style="width: 300px; margin: 0 auto; display: none;"
								class="clearfix"></div>
						</div>
						<div class="content_share">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							</table>
						</div>
					</div>
					<img src="//images.591.com.tw/index/forum/bbs_line.gif" width="948"
						height="3" style="float: left;">
					<div style="clear: left;"></div>
			
				<div class="button_line">
					<table width="100%" border="0">
						<tr>
							<!-- 							<td width="10%"><a class="rep-btn" href="#rep">回覆</a></td> -->
							<!-- 							<td width="10%"><a class="pub-btn" -->
							<!-- 								href="./f?action=publish&fid=25&sub_fid=25">發表</a></td> -->

						</tr>
					</table>
				</div>
				
		<div class="content_box">
	<c:forEach var="reply" items="${replyList}">
			<div class="col-sm-8">
<!-- 				<div class="input-group"> -->
				<div class="articleTitle" align="center">
				<div class="title_detail">
					<b></b><span>
						
					</span>
				</div>
			</div>
					<div class="leftSideBar">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td colspan="2" align="center"><img
									src="//images.591.com.tw/index/forum/head-image.png" width="80"
									height="80" /></td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="font-weight: 700">
									${memberBean.id}</td>
							</tr>
							<!--   <tr><td width='42%' align='right'>註冊：</td><td width='58%' valign='top'>2012-07-19</td></tr><tr><td align='right'>文章：</td><td valign='top'>44</td></tr><tr><td align='right'>回覆：</td><td valign='top'>422</td></tr> -->
						</table>
					</div>
					<div class="rightSideBar">
						<div class="blog-wonder-sign"></div>
						<div class="content_floor" style="height: 20px">

							<ul>
								<li style="float: left;"><font class="orange"></font>&nbsp;&nbsp;發表於
									${reply[0].datetime}</li>
							</ul>
							<!--<li class="voted_counts"></li>-->
						</div>
						<div class="content_detail">
							<div class="font_15">${reply[1]}</div>
						</div>
					</div>
				</div>
			
	</c:forEach>
	</div>
	<div class="button_line">
					<table width="100%" border="0">
						<tr>
							<!-- 							<td width="10%"><a class="rep-btn" href="#rep">回覆</a></td> -->
							<!-- 							<td width="10%"><a class="pub-btn" -->
							<!-- 								href="./f?action=publish&fid=25&sub_fid=25">發表</a></td> -->

						</tr>
					</table>
				</div>
			</div>
			
			<%-- 					</form:form> --%>
			<!--editor start-->
			<!-- 				============檢舉按鈕開始================			 -->


			<div style="padding-left:: 10px">
				<c:if test="${ForumBean.status=='上架' }">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#writeReport" data-whatever="@mdo">檢舉</button>
					<div class="modal fade" id="writeReport" tabindex="-1"	
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">檢舉文章</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form:form method="POST"
										action="/RentHouse/ForumDetail/processReport"
										modelAttribute="forumReport" onsubmit="alert('檢舉成功!!')">
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
											<textarea name="con" class="form-control" id="message-text"
												required="true"></textarea>
										</div>
										<input type="submit" class="btn btn-primary" value="送出" />
										<input type="hidden" name="forumid" value="${ForumBean.id }" />
										<button type="button" class="btn btn-secondary">取消</button>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				</div>
			</div>

  </div>
  

			<!-- 		================檢舉按鈕結束=======================			 -->


      <!-- Content -->
 
  <!-- This class can be used with responsive classes such as -md- as well: -->
<div id="accordion" role="tablist">
  <div class="card">
    <div class="card-header" role="tab" id="headingOne">
      <h5 class="mb-0">
        <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Collapsible Group Item #1
        </a>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
      <div class="card-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingTwo">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Collapsible Group Item #2
        </a>
      </h5>
    </div>
<div class="forum forum-rel">
<div class="content" align="right" >
<div class="articleTitle">

  </div>

</div>
							<div class="title_detail">
							
								 <strong class="mr-auto">回覆文章</strong>
								 
								
							</div>
						</div>
						
  <div class="toast-body">
		<a name="rep"></a>
		<div class="editor-replay-content">
			<form name="rep-info" method="post" action="/RentHouse/Forum/reply"
				modelAttribute="ForumBean" onSubmit="return chkPost();">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<!-- 							<span class="content_replay font_15" id="re_button">回覆文章</span><br /> -->
							<textarea id="article" name="article"
								style="width: 583px; height: 243px;"></textarea>
							<div id="parent_content"
								style="padding-top: 10px; display: none; height: 21px;">
								<span id="content_help" style="display: none"></span>
							</div>
						</td>
						<td></td>
					</tr>
					<tr height="10">
						<td></td>
					</tr>
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
					<tr height="10">
						<td><span id="UploadStatus"></span></td>
					</tr>
					<tr>
						<td><input type="submit" value="回覆文章" /> <input name="fid"
							type="hidden" id="fid" value="${ForumBean.id}"> <input
							type="hidden" name="action" value="postReply"> <input
							type="hidden" name="${reply[0].id}" value="${reply[0].id}">
							<input name="name" type="hidden" id="nickname" value="">
							<input name="user_id" type="hidden" id="user_id" value="-1">
							<input name="tid" type="hidden" id="tid" value="37381"></td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</form>
		</div>
	</div>




			
			
			
			<!--editor end-->
		
			
		
</body>
</html>