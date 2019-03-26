<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/board.css'  type="text/css" />
<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
var message;
$(document).ready(function(){
$("#send").click(function() {
        var myUrl = "${pageContext.request.contextPath}/Forum?post=" + $('#in').val()+"&name="+$('#name').val();
        $.ajax({
            type: 'get',
            url: myUrl,
            dataType: 'json',
            success: function(data){
            message =$.parseJSON(data.jsondata);
            fie1.innerHTML  +='<div class="ms">'+message.accountId+" 留言: "+message.sentence+message.time+"</div>";
            }, 
            
            error: function() {
                alert('error');
            }
        });
    });
})
</script>


/*套入*/

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC:700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP" crossorigin="anonymous"></script>
<header class="header1">
<div class="div1">
    <a href="#"><label class="lab0">To-touring</label></a>
    <a href=""><label class="lab1">註冊</label></a>
    <a href="editor"><label class="lab1">登入</label><img class="img2" src="${pageContext.request.contextPath}/images/login.png">
    </a>
    <img class="img1" alt="" src="">
    <a href="editorpackage"><label class="lab2" style="background-color: rgb(255, 119, 51)">製作套裝</label></a>
    <a href="editorviews"><label class="lab2">增加景點</label></a>
    <a href=""><label class="lab2">會員管理</label></a>
    <a href=""><label class="lab2">報表分析</label></a>
    </div>
    </header>



<meta charset="UTF-8">
<title>chat</title>
</head>
<body>

<fieldset id="fie1" class=dialog><legend>${boardtitle}</legend>
<c:forEach var='bo' items='${boards}'>
<div class="ms">
<label style="float:left">${bo.accountId}留言:</label>
<label style="float:left">${bo.sentence}</label>
<label style="float:right">${bo.time}</label>
</div>
<br>
</c:forEach>


</fieldset>
<div class="Index">
YourName<br>  <input id="name" name="in" type="text"><br>
Input<br>
<input id="in"  style="width:700px;height:100px;"  name="in"  type="text" ><br>

<input type="button" class="inp2" id="send" value="send">
</div>


</body>
</html>