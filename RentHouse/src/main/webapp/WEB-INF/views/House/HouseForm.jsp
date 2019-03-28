<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>房屋上架</title>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/HouseResorce/Formstone-master/js/site.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/Formstone-master/css/site.css"
		media="all" />
	<%-- 	<script src="${pageContext.request.contextPath}/HouseResorce/js/jQuery-TWzipcode-master/jquery.twzipcode.min.js"></script> --%>

	<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script>
	<!-- KICKSTART -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
	<!-- KICKSTART -->
	<script async="" defer="" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBR1UlWEzeskb_Jx_RbBtPypXUDGWdF-U8"
		type="text/javascript"></script>
	<!-- house模板CSS	 -->
<%-- 	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet" type="text/css" /> --%>
	<script>

		$("*").ready(function () {

			//取得縣市行政區
			$("#twzipcode").twzipcode();

			$("[name='zipcode']").remove();
			$("select[name='county']").change(function () {
				$("#cityId").val($(this).val());
				codeAddress();
			});
			$("select[name='county'],select[name='district']").attr("class", "col_2");
			$("select[name='county'],select[name='district']").change(function () {
				$("#boroughsId").val($("select[name='district']").val());
				codeAddress();
			});
			$("select[name='buildS']").change(function () {
				$("#build").val($(this).val());
			});

			$('input').keypress(function (e) { //禁止按enter送出
				code = e.keyCode ? e.keyCode : e.which; // in case of browser compatibility
				if (code == 13) {
					e.preventDefault();
					// do something
					/* also can use return false; instead. */
				}
			});
			// $("input:hidden").val("");
			// $("input:text").val("");
			$("#sqft,#floor,#topfloor").keydown(function (e) {//限制數字.1
				// Allow: backspace, delete, tab, escape and enter
				if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
					// Allow: Ctrl+A, Command+A
					(e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
					// Allow: home, end, left, right, down, up
					(e.keyCode >= 35 && e.keyCode <= 40)) {
					// let it happen, don't do anything
					return;
				}
				// Ensure that it is a number and stop the keypress
				if ((e.shiftKey || (e.keyCode < 48 || (e.keyCode > 57 && e.keyCode != 189 && e.keyCode != 190)))
					&& (e.keyCode < 96 || e.keyCode > 105)) {
					e.preventDefault();
				}
				// 如果使用者輸入-，先判斷現在的值有沒有-，如果有，就不允許輸入
				if (e.keyCode == 189 && /-/g.test(this.value)) {
					e.preventDefault();
				}
				// 如果使用者輸入.，先判斷現在的值有沒有.，如果有，就不允許輸入
				if (e.keyCode == 190 && /\./g.test(this.value)) {
					e.preventDefault();
				}
			});

			$('#sqft,#floor,#topfloor').keyup(function () { //限制數字.1
				if (/[^0-9\.-]/g.test(this.value)) {
					this.value = this.value.replace(/[^0-9\.-]/g, '');
				}

				if (/-/g.test(this.value) && !/^-/g.test(this.value)) {
					this.value = this.value.replace(/-/g, '');
				}
			});
		});

		function codeAddress() {
			var addr = $("#cityId").val() + $("#boroughsId").val() + $("#addr").val();
			var chackF = false;
			//alert(addr);
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({ "address": addr }, function (results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					$("#lat").val(results[0].geometry.location.lat());
					$("#lon").val(results[0].geometry.location.lng());
					//alert($("#lat").val() + "," + $("#lon").val());
					// return true;
				}
				else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
					alert("您輸入的地址可能不存在!\n");
					$("#lat").val("");
					$("#lon").val("");
					// e.preventDefault();
				}
				else if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
					alert("經緯度查詢已超過免費配額，明日請早!\nSorry! We are over our quota.");
					$("#lat").val("");
					$("#lon").val("");
					// e.preventDefault();
				}
				else if (status == google.maps.GeocoderStatus.REQUEST_DENIED) {
					alert("請求被拒絕!\nYour request was denied.");
					$("#lat").val("");
					$("#lon").val("");
					// e.preventDefault();
				}
				else {
					// var content = $("#target").val();
					// $("#target").val
					alert("系統發生錯誤！" + "\n");
					$("#lat").val("");
					$("#lon").val("");
					// e.preventDefault();
				}
			});
		}
	</script>
</head>

<body style="background-color: #ffebd7;">
    <div style="height: 75px;">
            <%@include file="../login/narbar.jsp"%>
    
        	<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
        
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

<!--                 <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom"> -->
<!--                     <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!--                     </div> -->
<!--                 </nav> -->
                <!-- 		內容 -->
                <div class="container-fluid" style="width: 800px;">
                    <h1 class="mt-4"></h1>
                    <div class="post">
								<form:form method='POST' modelAttribute="houseBean">
									<fieldset>
										<legend class="legendK">房屋類型</legend>
										<div>
											<label for="addr" class="label.col_1">地址：</label>
											<span id="twzipcode"></span>
											<form:hidden id="cityId" path="city" onchange="codeAddress()" />
											<form:hidden id="boroughsId" path="boroughs" onchange="codeAddress()" />
											<form:input path="addr" class="col_6" onchange="codeAddress()" />
										</div>
										<p>${errorMsg.addrE}</p>
										<div>
											<label for="sqft" class="label.col_1">坪數：</label>
											<form:input path="sqft" value="" class="col_1" />
											<label for="" class="label.col_1">坪</label>
										</div>
										<p>${errorMsg.sqftE}</p>
						
										<div>
											<label for="build" class="label.col_1">建築型態：</label>
											<form:select path="build" class="col_2">
												<form:option value="">-請選擇-</form:option>
												<form:option value="公寓">公寓</form:option>
												<form:option value="電梯大樓">電梯大樓</form:option>
												<form:option value="透天厝">透天厝</form:option>
												<form:option value="別墅">別墅</form:option>
											</form:select>
										</div>
										<p>${errorMsg.buildE}</p>
						
										<div>
											<label for="type" class="label.col_1">住房類型：</label>
											<form:select path="type" class="col_2">
												<form:option value="">-請選擇-</form:option>
												<form:option value="整層住家">整層住家</form:option>
												<form:option value="獨立套房">獨立套房</form:option>
												<form:option value="分租套房">分租套房</form:option>
												<form:option value="雅房">雅房</form:option>
												<form:option value="其他類型">其他類型</form:option>
											</form:select>
										</div>
										<p>${errorMsg.typeE}</p>
						
										<div>
											<label for="floor" class="label.col_1">所在樓層：</label>
											<form:input path="floor" class="col_1" />
											<label for="" class="label.col_1">樓</label>
										</div>
										<p>${errorMsg.floorE}</p>
						
										<div>
											<label for="topfloor" class="label.col_1">頂樓樓層：</label>
											<form:input path="topFloor" class="col_1" />
											<label for="" class="label.col_1">樓</label>
										</div>
										<p>${errorMsg.topfloorE}</p>
						
										<div>
											<label for="layout" class="label.col_1">格局：</label>
											<form:input path="layout" class="col_6" />
										</div>
										<p>${errorMsg.layoutE}</p>
						
										<form:hidden path="memberId" />
										<form:hidden path="category" value="住家" />
										<form:hidden path="lat" value="" />
										<form:hidden path="lon" value="" />
										<div>
											<input type="submit" class="medium green button" id="submit" value="送出">
										</div>
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






						