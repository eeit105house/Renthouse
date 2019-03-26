<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>					
			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
			
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="<spring:url value='/backstage' />"><i class=" icon-home"></i><span class="hidden-tablet"> 房屋審核   </span><span class="label">+${hlist.size() }</span></a></li>
						<li><a href="<spring:url value='/backstage/writingsReview' />"><i class=" icon-book"></i><span class="hidden-tablet"> 文章審核    </span><span class="label">+${wlist.size() }</span></a></li>
						<li><a href="<spring:url value='/backstage/customerservicemail' />"><i class="icon-user"></i><span class="hidden-tablet"> 客服   </span><span class="label">+${maillist.size() }</span></a></li>
						<li><a href="<spring:url value='/backstage/chart' />"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 統計圖表   </span></a></li>	
						<li><a href="<spring:url value='/backstage/updateemployee' />"><i class="icon-cog"></i><span class="hidden-tablet"> 修改員工資料   </span></a></li>							
						<li><a href="<spring:url value='/backlogin/logout' />"><i class="icon-lock"></i><span class="hidden-tablet"> 登出</span></a></li>
					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->
</body>
</html>