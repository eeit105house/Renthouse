<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>導覽</title>
</head>
<body>            
     <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading list-group-item bg-warning">會員中心</div>
      <div class="list-group list-group-flush">
        <a id="aaa" href="<c:url value='/membercontrol/${user.id}'/>" class="list-group-item list-group-item-action bg-light">會員資料修改</a>
        <a id="bbb" href="<spring:url value='/membercontrol/memberservice/serviceform' />" class="list-group-item list-group-item-action bg-light">客服中心</a>
        <a id="ccc" href="<c:url value='/membercontrol/houseRefactSelect'/>" class="list-group-item list-group-item-action bg-light">我的房屋一覽</a>
        <a id="ddd" href="<c:url value='/membercontrol/furnitureRefactSelect'/>" class="list-group-item list-group-item-action bg-light">二手家具一覽</a>
        <a id="eee" href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
        <a id="fff" href="#" class="list-group-item list-group-item-action bg-light">Status</a>
      </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
    	if($("#herenow").val()=="updata"){
    	$("#aaa").attr("class","list-group-item list-group-item-action bg-info");
    }
    if($("#herenow").val()=="customer"){
    	$("#bbb").attr("class","list-group-item list-group-item-action bg-info");
    }
    if($("#herenow").val()=="houseSelect"){
    	$("#ccc").attr("class","list-group-item list-group-item-action bg-info");
    }
    if($("#herenow").val()=="fuSelect"){
    	$("#ddd").attr("class","list-group-item list-group-item-action bg-info");
    }
    });
    </script>
</body>
</html>