<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>家具一覽</title>
    <style type="text/css">
    </style>
    
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

                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    </div>
                </nav>
                <!-- 		內容 -->
                <div class="container-fluid" style="width: 800px;">
                    <h1 class="mt-4"></h1>
                    <table>
                        <thead>
                            <tr>
                                <th>標題</th>
                                <th>種類</th>
                                <th>價格</th>
                                <th>照片</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="furniture" items="${furnitureList}">
                       		 	<tr>
                        			<td><a href='<c:url value="/furnitureView/${furniture.id}"/>'>${furniture.title}</a>></td>
                        			<td>${furniture.type}</td>
                        			<td>${furniture.price}元</td>
                        			<td><img alt="X" src='<c:url valur="/furnitureView/fuPic/${furniture.id}"/>'></td>
                        		</tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
    </div>
</body>

</html>