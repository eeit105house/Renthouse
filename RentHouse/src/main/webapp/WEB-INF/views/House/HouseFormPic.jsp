<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>上傳圖片</title>
    <link rel="shortcut icon" href="//upload.cc/i1/2019/03/28/Kl6mho.jpg"/>
    <script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script> <!-- KICKSTART -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
    <!-- KICKSTART -->
      	<!-- house模板CSS	 -->
<%-- 	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet" type="text/css" /> --%>

    <script>
        $("*").ready(function () {
            $('input').keypress(function (e) {
                code = e.keyCode ? e.keyCode : e.which; // in case of browser compatibility
                if (code == 13) {
                    e.preventDefault();
                    // do something
                    /* also can use return false; instead. */
                }
            });
            $("input:hidden").val("");
            $("input:text").val("");
        });
    </script>
</head>

<body style="background-color: #ffebd7;">
    <div style="height: 75px;">
        <%@include file="../login/narbar.jsp"%>
    </div>
    <div>
        <h1 class="container">親愛的 ${user.name} 您好</h1>
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
                    <form:form method="post" enctype="multipart/form-data">
                    	<fieldset>
                        	<legend class="legendK">上傳圖片</legend>
                        	<div>
	                            <p>請使用JPEG檔</p>
	                            <p>${errorMsg.typeE}</p>
	                        </div>
	                        <div style="margin-bottom: 20px;">
	                            <label for="0">第1張圖片：</label>
	                            <input type="file" class="file" accept="image/jpeg" name="pic0" id="0">*將作為封面
	                            <p>${errorMsg.pic0None}</p>
	        				</div>
	                            <c:forEach var="i" begin="2" end="10">
	                    		   <div style="margin-bottom: 20px;">                       
		                               <label for="${i}">第${i}張圖片：</label>
		                        	   <input type="file" name="pics" class="file" accept="image/jpeg"  id="${i}">
	                               </div>                                
	                            </c:forEach>
	                    	<input type="submit" class="medium green button" value="上傳">
                	    </fieldset>
            	    </form:form>
           		 </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
    </div>
</body>


            
</html>