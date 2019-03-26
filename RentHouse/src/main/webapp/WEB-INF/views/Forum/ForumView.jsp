<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="login/css/bootstrap.css" rel="stylesheet" />
<link
	href="//fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- 首頁樣式 -->
<link href="login/css/landing-page.css" rel="stylesheet">

<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/Forum/css/common.css" --%>
<!-- 	type="text/css" g="publish-css"> -->
<link rel="stylesheet"
	href="Forum/css/forumTest.css"4
	type="text/css" >
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/Forum/css/bbs.css" --%>
<!-- 	type="text/css" g="publish-css"> -->

<title>租你幸福--討論區 租屋,房屋買賣,搬家,房屋討論</title>
<style>
.well, .panel {
	text-align: center;
}
</style>

</head>
<body style="background-color: #ffebd7;">
	<div style="height: 75px;">
		<%@include file="../login/narbar.jsp"%>
	</div>
<!-- 	<header class="masthead text-white text-center" -->
<!-- 		style="background: url(login/img/index.jpg) no-repeat center center;"> -->
<!-- 		  <h2>租你幸福</h2> -->
<!--   <p>討論區 租屋,房屋買賣,搬家,房屋討論</p> -->
<!-- 		</header> -->
<!-- <!-- BEGIN TEMPLATE list_threads.tpl --> 
<!-- <div class="nav" style="padding-left:50px"> -->
	
<!-- </div> -->
<!-- <br/> -->

<!-- <table class="list_table" width="800" border="0" align="center" cellpadding="0" cellspacing="0"> -->
<!-- 	<tr> -->
<!-- 		<td colspan="7" class="list_tatle_title">&nbsp;</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="10" rowspan="100" class="list_sides"></td> -->
<!-- 		<td class="list_title">　標題</td> -->
<!-- 		<td width="100" class="list_title" align="center">作者</td>  -->
<!-- 		<td width="75" class="list_title" align="center" style="font-size:14px">分類</td> -->
<!-- 		<td width="140" class="list_title">　發表時間</td>  -->
<!-- 				<td width="10" rowspan="100" class="list_sides">&nbsp; -->
<!-- 	</tr> -->

   
<!-- 	<tr> -->
<!-- 		<td class="list_content" style="padding-left: 10px"> -->
<!-- 			<img style="vertical-align:bottom" src="http://mepopedia.com/forum/templates/village/images/bell.png" alt="置頂" title="置頂" /> -->
<%-- 			<a href="" class="" title="置頂">${forum.title}</a> --%>
			
<!-- 			<!--<small>(1 發表文章數)</small>--> 
<!--     </td> -->
   
<!--     <td class="list_info" align="center"> -->
		
<%-- 			<a href="">${forum.memberBean.id}</a> <br/> --%>
		
<%-- 		<td class="list_info" align="center">${forum.sort}></td> --%>
<%--     <td class="list_info" >${forum.datetime}</td> --%>
    
<!--     </tr> -->
	
    <div class="container">

  <table class="table">
    <thead class="thead-dark">
					<tr align="center">
						<td class="list_title">　標題</td>
						<th>發表</th>
						<th>分類</th>
						<th>發表時間</th>
					</tr>
				</thead>
    <tbody>
      <c:forEach var="forum" items="${flist}">
      <tr align="center">
        <td><a href='<c:url value="/ForumDetail/${forum.id}" />'>${forum.title}</a></td>
        <td><a href='<c:url value="" />'>${forum.memberBean.id}</td>
        <td>${forum.sort}</td>
       <td> ${forum.datetime}</td> 
      </tr>
     </c:forEach>	
    </tbody>
    
    <div id="act-list">
    	<div class="head">
            <div class="pub-btn"><a class="btn btn-primary" href="Forum/add">發表文章</a>     
             <div class="modal-footer">
        <a href="<spring:url value='/delete/${forum.id }' />" class="btn btn-primary">確認</a>
        <button type="button" class="btn" data-dismiss="modal">取消</button>                  
              </div>
</div>
</div>
</div>


  </table>
  </div>
<!--   <table class="table"> -->
<!--     <thead class="thead-light"> -->
<!--       <tr> -->
<!--         <th>Firstname</th> -->
<!--         <th>Lastname</th> -->
<!--         <th>Email</th> -->
<!--       </tr> -->
<!--     </thead> -->
    
<!--     <tbody> -->
   
      
<!--     </tbody> -->

<!--  </table> -->
  
</body>
</html>