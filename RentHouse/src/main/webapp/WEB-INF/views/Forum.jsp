
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>租你幸福--討論區 租屋,房屋買賣,搬家,房屋討論</title>

</head>
<body>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css" />
<script type="text/javascript">
var message;
$(function() {
    $("#code").bind("keyup", function(e) {
        if ($("#code").val().length != 4) {
            return;
        }

        var myUrl = "<%=request.getContextPath()%>/searchStock.do?code=" + $('#code').val();
        
        $.ajax({
            type: 'post',
            url: myUrl,
            dataType: 'json',
            success: function(data, result) {
                if (data.responseMsg.status == "success") {
                    message = $.parseJSON(data.jsondata);
                    $('#name').html('討論區: ' + message.name);
                    $('massages').html(': ' + message.price);
                }
                else {
                    alert('fail');
                    alert(data.responseMsg.message);
                }
            },
            error: function() {
                alert('error');
            }
        });
    });
});
</script>
<form>
    討論區: <input id="code" name="code" type="text"/><br/>
    <div id="name"></div>
    <div id="massages"></div>
</form>

</body>
</html>