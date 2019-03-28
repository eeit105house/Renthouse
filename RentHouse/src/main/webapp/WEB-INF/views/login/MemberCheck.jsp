<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改個人</title>
<style type="text/css">
<!---->
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}


.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}


.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}


.container {
  padding: 16px;
}


.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #ffcc66;
  padding-top: 50px;
}


.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}


hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}


.clearfix::after {
  content: "";
  clear: both;
  display: table;
}


@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
table{
		
		border-Width:7px 2px;
		border-style:solid;
		border-corol:#99ccff;
		text-align:center;
		
		
	}
	td{
		border:1px dotted #696969;
		
	}
	th{
		border-Width:7px 5px;
		
	}
<!---->
</style>
</head>
<body style="background-color: #ffebd7;">
<div style="height: 75px;">
<%@include file="narbar.jsp"%>
</div>
<div>
<h1 class="container">親愛的 ${user.name} 您好</h1>
<div class="d-flex container" id="wrapper">
    <!-- Sidebar -->
    <%@include file="membermenu.jsp"%>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        </div>
      </nav>
<!-- 		內容 -->
      <div class="container-fluid" style="width: 800px;">
        <h1 class="mt-4">我的預約資訊(房客版)</h1>
        <table width="800" border="1">
　			<tr>
　				<th>預約編號</th>
				<th>房屋編號</th>
 				<th>預約時間</th>
 				<th>預約狀態</th>
 				<th>出席狀態</th>
 				<th>評分</th>
　			</tr>
		<tbody>
			<c:forEach var="res" items="${reservations }">
			<tr>
				<td>${res.id }</td>
				<td>${res.houseBean.id }</td>
				<td>${res.datetime }</td>
				<td>${res.confirm }</td>
				<td>${res.status }</td>
				<td>
					<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">評分</button>

						<div id="id01" class="modal">
  							<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  								
  									<form:form method="POST"  class="modal-content">
    									<div class="container">
      										<h1>評分</h1>
      										<p>這次出席的體驗若從1分~5分您認為可得幾分</p>
      										<hr>
      											<p>
      												<input id="score" name="score" type="radio" value="1"/>1<br>
      												<input id="score" name="score" type="radio" value="2"/>2<br>
      												<input id="score" name="score" type="radio" value="3"/>3<br>
      												<input id="score" name="score" type="radio" value="4"/>4<br>
      												<input id="score" name="score" type="radio" value="5"/>5<br>
      											</p>
    										
											<input  id="reservationId" name="reservationId" type="hidden" value="${res.id }"/>
											<input  id="memberId" name="memberId" type="hidden" value="${memberId }"/>
      										<div class="clearfix">
        										<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
        										<button type="submit" class="signupbtn">評分</button>
      										</div>
    									</div>
  								</form:form>
						</div>
				</td>
			</tr>							
			</c:forEach>
</tbody>
</table>
     
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  </div>
  <script type="text/javascript">
  $(document).ready(function(){
	 if("${user.active}"=="已驗證"){
		 $("#acti").hide();
	 }else{
		 $("#acti").show();
	 };
  });
  <!--評分彈出視窗 -->
	//Get the modal
 	 var modal = document.getElementById('id01');

  	// When the user clicks anywhere outside of the modal, close it
  	window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
  </script>
  <input type="hidden" id="herenow" value="reservationMemberCheck"/> 
</body>
</html>