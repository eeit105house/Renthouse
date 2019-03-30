<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<title>客服</title>
<link rel="shortcut icon" href="//upload.cc/i1/2019/03/28/Kl6mho.jpg"/>
</head>
<body>
  <div class="container">
      <label for="title" class="col-sm-2 col-form-label">會員提問</label>
<hr>
<form:form method="POST" modelAttribute="employeeReport" onsubmit="window.alert('信件已送出，感謝您的來信')">
    <fieldset class="form-group">
        <div class="row">
          <label class="col-form-label col-sm-1 pt-0">分類:</label>
          <div class="col-sm-10">
              <div class="form-check form-check-inline">
                  <form:radiobutton path='type' class='form-check-input' name='rtype' id='inlineRadio1' value='系統相關' checked="true"/>
                  <label class="form-check-label" for="inlineRadio1">系統相關</label>
                </div>
                <div class="form-check form-check-inline">
                  <form:radiobutton path="type" class="form-check-input" name="rtype" id="inlineRadio2" value="房屋問題" />
                  <label class="form-check-label" for="inlineRadio2">房屋問題</label>
                </div>
                <div class="form-check form-check-inline">
                  <form:radiobutton path="type" class="form-check-input" name="rtype" id="inlineRadio3" value="付款問題"/>
                  <label class="form-check-label" for="inlineRadio3">付款問題</label>
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton path="type" class="form-check-input" name="rtype" id="inlineRadio4" value="會員相關"/>
                    <label class="form-check-label" for="inlineRadio4">會員相關</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <form:radiobutton path="type" class="form-check-input" name="rtype" id="inlineRadio5" value="投訴服務"/>
                    <label class="form-check-label" for="inlineRadio5">投訴服務</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <form:radiobutton path="type" class="form-check-input"  name="rtype" id="inlineRadio6" value="我要建議"/>
                    <label class="form-check-label" for="inlineRadio6">我要建議</label>
                  </div>
                  <div class="form-check form-check-inline">
                      <form:radiobutton path="type" class="form-check-input" name="rtype" id="inlineRadio7" value="其他"/>
                      <label class="form-check-label" for="inlineRadio7">其他</label>
                    </div>
          </div>
        </div>
      </fieldset>
    <div class="form-group row">
      <label for="title" class="col-sm-1 col-form-label">標題:</label>
      <div class="col-7">
        <form:input path="title" class="form-control" id="title" required="true"/>
      </div>
    </div>
    <div class="form-group row">
        <label for="textarea" class="col-sm-1 col-form-label">內容:</label>
        <div class="col-5">
        <textarea name="content1" class="form-control" id="textarea" rows="3" required=""></textarea>
      </div>
    </div>
    
    <div class="form-group row">
      <div class="col-sm-10">
        <button type="submit" class="text-white font-weight-bolder btn btn-warning">送出</button>
      </div>
    </div>
  </form:form>
</div>
<script>

</script>
</body>
</html>