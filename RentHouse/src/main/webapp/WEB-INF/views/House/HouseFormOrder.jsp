<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script> <!-- KICKSTART -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
  <!-- KICKSTART -->
  	<!-- house模板CSS	 -->
<%-- 	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet" type="text/css" /> --%>
  <title>選擇刊登方案</title>
  <link rel="shortcut icon" href="//upload.cc/i1/2019/03/28/Kl6mho.jpg"/>
</head>
<body style="background-color: #ffebd7;">
    <div style="height: 75px;">
        <%@include file="../login/narbar.jsp"%>
    </div>
    <div>
<%--         <h1 class="container">親愛的 ${user.name} 您好</h1> --%>
        <div class="d-flex container" id="wrapper">
            <!-- Sidebar -->
<!--             <div class="bg-light border-right" id="sidebar-wrapper"> -->
<!--                 <div class="sidebar-heading list-group-item bg-warning">會員中心</div> -->
<!--                 <div class="list-group list-group-flush"> -->
<%--                     <a href="<c:url value='/membercontrol/${user.id}'/>" --%>
<!--                         class="list-group-item list-group-item-action bg-light">&gt;&gt;會員資料修改</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Events</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action bg-light">Status</a> -->
<!--                 </div> -->
<!--             </div> -->
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

<!--                 <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom"> -->
<!--                     <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!--                     </div> -->
<!--                 </nav> -->
                <!-- 		內容 -->
                <div class="container-fluid" style="width: 800px;">
                    <h1 class="mt-4"></h1>
                    <div class="post">
			      	  <form:form>
			       	   <fieldset>
			        	    <legend class="legendK">請選擇付款方案</legend>
			    	        <p>${errorMsg.orderE}</p>
				            <c:forEach var="VipProject" items="${VipProjects}">
			            	  <div style="background-color: white;">
			        	        <input type="radio" name="vip" id="${VipProject.pNumber}" value="${VipProject.pNumber}" checked="checked">
			    	            <label for="${VipProject.pNumber}">${VipProject.pName}</label>
				                <p>${VipProject.pInfo}</p>
			                	<p>${VipProject.pPrice}元</p>
			            	  </div>
			        	    </c:forEach>
			    	      </fieldset>
			  	        <input type="submit" class="large green button" value="前往付款">
			        	  <a class="button orange medium" href='<c:url value="/membercontrol/houseRefactSelect"/>'>稍後付款</a>
			        	  <a class="button blue medium" href='<c:url value="/oneClickPost/0"/>'>開發人員一鍵上架_0</a>
			        	  <a class="button blue medium" href='<c:url value="/oneClickPost/1"/>'>開發人員一鍵上架_1</a>
			        	  <a class="button blue medium" href='<c:url value="/oneClickPost/2"/>'>開發人員一鍵上架_2</a>
			    	    </form:form>
				   </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
    </div>
</body>

</html>