<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/HouseResorce/Formstone-master/js/site.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/Formstone-master/css/site.css"
		media="all" />
	<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script> <!-- KICKSTART -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
<!-- 	KICKSTART -->
	<!-- house舊模板CSS	 -->
<%-- 	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet" --%>
<!-- 		type="text/css" /> -->
	<meta charset="UTF-8">
	<title>您的房屋</title>

	<script>
		// 		$(document).ready(function () {
		// 			$("#cc").click(function(){
		// 				$.lightbox("close")
		// 			});

		// 		});
		Formstone.Ready(function () {
			$("a[name='DontPost']").lightbox({
			});
		});
	</script>
</head>

<body style="background-color: #ffebd7;">
	<div style="height: 75px;">
		<%@include file="narbar.jsp"%>
	</div>
	<div>
		<h1 class="container">親愛的 ${user.name} 您好</h1>
		<div class="d-flex container" id="wrapper">
			<!-- Sidebar -->
			<div class="bg-light border-right" id="sidebar-wrapper">
				<div class="sidebar-heading list-group-item bg-warning">會員中心</div>
				<div class="list-group list-group-flush">
					<a href="<c:url value='/membercontrol/${user.id}'/>"
						class="list-group-item list-group-item-action bg-light">會員資料修改</a>
					<a href="<c:url value='/membercontrol/houseRefactSelect'/>" class="list-group-item list-group-item-action bg-light">&gt;&gt;房屋管理</a>
					<a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
					<a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
					<a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
					<a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
				</div>
			</div>
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
								<th>
									<h2>歷年成交紀錄</h2>
								</th>
							</tr>
							<tr>
								<th>成交編號</th><th>簽約日</th><th>月租金</th><th>到期日</th><th>契約</th><th>修改內容</th>
							</tr>
							
						</thead>
						<tbody>
							<c:forEach var = "houseDeal" items="${allHouseDeal}">
								<tr>
									<td>${houseDeal.id}</td>
									<td>${houseDeal.dealDate}</td>
									<td>${houseDeal.dealPrice}</td>
									<td>${houseDeal.leaseDate}</td>
									<td><form action="${pageContext.request.contextPath}/deal/getPdf/${houseDeal.id}" method="GET">
									<c:set var="pdf" value="${houseDeal.fileName}" />
									<c:if test="${pdf != null}"><button type="submit">查看契約</button></c:if>
									<c:if test="${pdf == null}">尚無檔案</c:if>
									</form>									</td>
									<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
									data-from="${houseDeal.dealDate}" data-price="${houseDeal.dealPrice}" data-to="${houseDeal.leaseDate}"  data-id="${houseDeal.id}" >
									修改成交資訊</button>
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
	
<!-- 	互動式視窗 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     <form method='POST' enctype="multipart/form-data" onsubmit='return confirm("確定送出");'>
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     
          <div class="form-group">
            <label for="from" class="col-form-label">成交日期</label>
            <input type="text" class="form-control" id="from" name="from"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">每月租金</label>
            <input type="text" class="form-control" id="dealPrice" name="dealPrice"/>
          </div>
           <div class="form-group">
            <label for="to" class="col-form-label">租約到期日</label>
            <input type="text" class="form-control" id="to" name="to"/>
          </div>
          <input type = "file" value = "如要修改才需上傳" multiple="multiple" name="file" />
        
      </div>          
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        <button type="submit" class="btn btn-primary" >送出資訊</button>
      </div>
      </form>
    </div>
  </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script>
$('#exampleModal').on('show.bs.modal', function (event) {
	
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var id = button.data('id')
	  var from = button.data('from')
	  var price = button.data('price')
	  var to = button.data('to')  
	  var modal = $(this)
	  modal.find('.modal-title').text('請修改成交編號:'+id+'的資訊')
	  modal.find('.modal-body #from').val(from)
	  modal.find('.modal-body #dealPrice').val(price)
	  modal.find('.modal-body #to').val(to)
	  var action = "${pageContext.request.contextPath}/deal/updatePage/"+id
	  modal.find('.modal-content form').attr("action",action);
})

	 $( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1y",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
</script>
</body>
</html>