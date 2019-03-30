<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

<%-- 	<script src="${pageContext.request.contextPath}/HouseResorce/Formstone-master/js/site.js"></script> --%>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/Formstone-master/css/site.css" --%>
<!-- 		media="all" /> -->
	<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script> <!-- KICKSTART -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
<!-- 	KICKSTART -->

<link href="${pageContext.request.contextPath}/login/css/bootstrap.css" rel="stylesheet">
<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"> 
<!-- google fonts -->
<link href="//fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<
	<!-- house舊模板CSS	 -->
<%-- 	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet" --%>
<!-- 		type="text/css" /> -->
	<meta charset="UTF-8">
	<title>您的房屋</title>
	<link rel="shortcut icon" href="//upload.cc/i1/2019/03/28/Kl6mho.jpg"/>
<style type="text/css">

</style>
	<script>
		// 		$(document).ready(function () {
		// 			$("#cc").click(function(){
		// 				$.lightbox("close")
		// 			});

		// 		});
		$(document).ready(function () {
			$("a[name='DontPost']").lightbox({
			});
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
			    <%@include file="../login/membermenu.jsp"%>
			
<!-- 			<div class="bg-light border-right" id="sidebar-wrapper"> -->
<!-- 				<div class="sidebar-heading list-group-item bg-warning">會員中心</div> -->
<!-- 				<div class="list-group list-group-flush"> -->
<%-- 					<a href="<c:url value='/membercontrol/${user.id}'/>" --%>
<!-- 						class="list-group-item list-group-item-action bg-light">會員資料修改</a> -->
<%-- 					<a href="<c:url value='/membercontrol/houseRefactSelect'/>" class="list-group-item list-group-item-action bg-light">&gt;&gt;房屋管理</a> --%>
<!-- 					<a href="#" class="list-group-item list-group-item-action bg-light">Overview</a> -->
<!-- 					<a href="#" class="list-group-item list-group-item-action bg-light">Events</a> -->
<!-- 					<a href="#" class="list-group-item list-group-item-action bg-light">Profile</a> -->
<!-- 					<a href="#" class="list-group-item list-group-item-action bg-light">Status</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<!-- /#sidebar-wrapper -->

			<!-- Page Content -->
			<div id="page-content-wrapper">

				<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
					</div>
				</nav>
				<!-- 		內容 -->
				<div class="container-fluid" style="width: 800px;">
					<h1 class="mt-4">您的房屋一覽</h1>
					<table>
						<thead>
							<tr>
								<th>
									<h2></h2>
								</th>
							</tr>
							<tr>
								<th>標題</th>
								<th>狀態</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='house' items='${houseList}'>
								<tr>
									<td>${house.detailBean.title}</td>
									<td>${house.status}</td>
									<c:if test="${house.status == '上架' || house.status == '審核' || house.status == '下架'}">
									
										<td><a class="button orange"
												href='<c:url value="/houseView/${house.id}" />'>檢視</a></td>
										<td><a class="button orange"
												href='<c:url value="/membercontrol/houseRefactDet/${house.id}" />'>修改詳細</a>
										</td>
										<td><a class="button orange"
												href='<c:url value="/membercontrol/houseRefactPic/${house.id}" />'>修改圖片</a>
										</td>
									</c:if>
									<c:if test="${house.status == '填寫中'}">
									
									<td><a class="button "
											href='<c:url value="" />'>檢視</a></td>
									<td><a class="button orange"
											href='<c:url value="/membercontrol/houseRefactDet/${house.id}" />'>填寫詳細</a>
									</td>
									<td><a class="button orange"
											href='<c:url value="/membercontrol/houseRefactPic/${house.id}" />'>上傳圖片</a>
									</td>
									</c:if>
									<td>
										<c:if test="${house.status == '上架' || house.status == '審核'}">
											<!-- <input type="button" id="Down" class="button red" value="主動下架">
											<input type="hidden" id="DontPost"
												value='<c:url value="/houseDontPost/${house.id}" />'> -->


											<a name="DontPost" class="button red" href="#hidden_content_dontpost${house.id}">主動下架</a>
											<div id="hidden_content_dontpost${house.id}" style="display: none; background-color: #ffebd7;">
												<div class="inline_content" style="width: 350px; height: 200px; background-color: #ffebd7;">
													<h4>請確認是否確定下架?</h4>
													<p>*手動下架並不會退還刊登費*</p>
													<a class="button red"
														href='<c:url value="/membercontrol/houseDontPost/${house.id}" />'>是的，我要下架</a>
													<a class=" button green " id="cc"
														onclick="$.lightbox('close');">不是，繼續刊登</a>

												</div>
											</div>
										</c:if>
										<c:if test="${house.status == '下架' }">
											<a id="RePost" class="button green"
												href='<c:url value="/membercontrol/houseRePost/${house.id}" />'>付款上架</a>
										</c:if>
									</td>
									<td>
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap" data-id="${house.id }">新增成交</button>
									</td>
								<td>
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/deal/AllHouseDealForAnHouse/${house.id }'">歷年成交</button>
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
    <form method='POST' enctype="multipart/form-data" onsubmit='return confirm("確定送出");' >
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>    
      <div class="modal-body">
          <div class="form-group">
            <label for="from" class="col-form-label">成交日期</label>
            <input type="text" class="form-control" id="from" name="from" readonly="readonly" placeholder="請點擊選擇日期" />
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">每月租金</label>
            <input type="text" class="form-control" id="recipient-name" name="dealPrice" />
          </div>
           <div class="form-group">
            <label for="to" class="col-form-label">租約到期日</label>
            <input type="text" class="form-control" id="to" name="to" readonly="readonly" placeholder="請點擊選擇日期" />
          </div>
          <input type = "file" value = "上傳租賃契約" multiple="multiple" accept="application/pdf" name="file" />
      </div>          
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        <button type="submit" class="btn btn-primary">送出資訊</button>
      </div>
      </form>
    </div>
  </div>
</div>
<script>
	$('#exampleModal').on('show.bs.modal', function (event) {		
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var id = button.data('id')
		  var modal = $(this)
		  modal.find('.modal-title').text('請新增房屋編號:'+id+'的資訊')
		  var action = "${pageContext.request.contextPath}/deal/insertPage/"+id
		  modal.find('.modal-content form').attr("action",action);
	});

	 $("*").ready( function() {
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
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>


		<input type="hidden" id="herenow" value="houseSelect">
</body>
</html>