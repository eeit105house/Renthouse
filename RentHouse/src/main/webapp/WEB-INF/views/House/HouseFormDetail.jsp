f<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">


	<!--   <link rel="stylesheet" href="jqueryui/style.css"> -->
	<!-- 	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script> -->
	<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script>
	<!-- KICKSTART -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
	<!-- KICKSTART -->
	<!-- house模板CSS	 -->
	<%-- 		<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet" type="text/css" /> --%>
	<script type="text/javascript">
		$("*").ready(function () {
			$("#datepickerA").datepicker({
				showOtherMonths: true,
				selectOtherMonths: true
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

			$("#price,#deposit,#hoaFee").keydown(function (e) {//限制數字.1
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

			$('#price,#deposit,#hoaFee').keyup(function () { //限制數字.1
				if (/[^0-9\.-]/g.test(this.value)) {
					this.value = this.value.replace(/[^0-9\.-]/g, '');
				}

				if (/-/g.test(this.value) && !/^-/g.test(this.value)) {
					this.value = this.value.replace(/-/g, '');
				}
			});
			$("#oneclickH").click(function () {
				$("#title").val("中山區國賓大廈獨立美套房16800");
				$("#infoN").val("台北市 新生北路 民生東路口 極簡風套房出租 $16800 長期出租者 可議!! 傢俱家電齊全 即可入住 免煩惱 電視、冰箱、洗衣機、冷氣、標準廚具、雙人床、衣櫃、化妝台.... 坪數：13坪 大空間 月租：新台幣16800元整  押金：2個月租金 電梯大樓24h管理員 近淡水線捷運雙連站、公車站旁 步行約5-10分鐘即可到達 近商圈、馬偕商圈、生活機能佳交通方便 好房子好價格的套房 極為搶手 歡迎來電洽詢預約看屋 電話：0919533168");
				$("#price").val("16800");
				$("#deposit").val("33600");
				$("#hoaFee").val("0");
				$("#datepickerA").val("04/01/2019");
				$("#shortest").val("12");
				// $("input:radio[name='shortestN']").val("月");
				// $("#shortest2-3").attr("checked",true);
				$("#shortest2-3,[name='applianceN'],[name='furnitureN'],[name='leN'],#indetity2,#indetity4,#include1").click();
				$("#le9").click();
			});
		});

		function getCBValue(cbName) {
			// alert(cbName);
			// var array_value = $('input:checkbox:checked[name="applianceN"]').map(function() { return $(this).val(); }).get();
			var array_value = $('input:checkbox:checked[name="' + cbName + 'N"]').map(function () { return $(this).val(); }).get();
			var one_value = "";
			// alert(array_value.length);
			for (var i = 0; i < array_value.length; i++) {
				// alert(one_value+";"+i);
				if (i == 0)
					one_value = one_value + array_value[i];
				else
					one_value = one_value + ';' + array_value[i];
				// alert(array_value[i]);
			}
			// $('input[name="appliance"]').val(one_value);
			$('[name="' + cbName + '"]').val(one_value);
			// alert(Appliance);
		}
	</script>
	<meta charset="UTF-8">
	<title>詳細資訊</title>
	<link rel="shortcut icon" href="//upload.cc/i1/2019/03/28/Kl6mho.jpg" />
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

				<!--                 <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom"> -->
				<!--                     <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
				<!--                     </div> -->
				<!--                 </nav> -->
				<!-- 		內容 -->
				<div class="container-fluid" style="width: 800px;">
					<h1 class="mt-4"></h1>
					<div class="post">
						<form:form method='POST' modelAttribute="detailBean">
							<fieldset>
								<legend class="legendK">詳細資訊</legend>
								<div>
									標題
									<form:input path="title" />
									<p>${errorMsg.titleE}</p>
								</div>
								<div>
									簡介
									<textarea name="infoN" id="infoN" cols="30" rows="10"></textarea>
									<p></p>
									<!-- <form:textarea path="info" /> -->
								</div>
								<div>
									每月租金
									<form:input path="price" />元/月
									<p>${errorMsg.priceE}</p>
								</div>
								<div>
									押金
									<form:input path="deposit" value="0" />元
									<p></p>
								</div>
								<div>
									管理費
									<form:input path="hoaFee" value="0" />元
									<p></p>
								</div>
								<div>
									可遷入日<input id="datepickerA" name="movingInN" readonly="readonly"
										placeholder="請選擇日期" />
									<p>${errorMsg.movingInNE}</p>
								</div>
								<div>
									最短租期
									<form:input path="shortest" />
									<label for="shortest2-1">日</label>
									<input type="radio" name="shortestN" id="shortest2-1" value="日" checked="true">
									<label for="shortest2-2">周</label>
									<input type="radio" name="shortestN" id="shortest2-2" value="周">
									<label for="shortest2-3">月</label>
									<input type="radio" name="shortestN" id="shortest2-3" value="月">
									<p>${errorMsg.shortestE}</p>
								</div>
								<div>
									<p>設備：</p>
									<form:hidden path="appliance" />
									<label for="appliance1">電視：</label>
									<input type="checkbox" name="applianceN" id="appliance1" value="電視"
										onclick="getCBValue('appliance')">
									<label for="appliance2">冰箱：</label>
									<input type="checkbox" name="applianceN" id="appliance2" value="冰箱"
										onclick="getCBValue('appliance')">
									<label for="appliance3">洗衣機：</label>
									<input type="checkbox" name="applianceN" id="appliance3" value="洗衣機"
										onclick="getCBValue('appliance')">
									<label for="appliance4">冷氣：</label>
									<input type="checkbox" name="applianceN" id="appliance4" value="冷氣"
										onclick="getCBValue('appliance')">
									<label for="appliance5">網路：</label>
									<input type="checkbox" name="applianceN" id="appliance5" value="網路"
										onclick="getCBValue('appliance')">
									<label for="appliance6">熱水器：</label>
									<input type="checkbox" name="applianceN" id="appliance6" value="熱水器"
										onclick="getCBValue('appliance')">
									<label for="appliance7">第四台：</label>
									<input type="checkbox" name="applianceN" id="appliance7" value="第四台"
										onclick="getCBValue('appliance')">
									<label for="appliance8">瓦斯：</label>
									<input type="checkbox" name="applianceN" id="appliance8" value="瓦斯"
										onclick="getCBValue('appliance')">
								</div>
								<div>
									<p>家具：</p>
									<form:hidden path="furniture" />
									<label for="furniture1">床：</label>
									<input type="checkbox" name="furnitureN" id="furniture1" value="床"
										onclick="getCBValue('furniture')">
									<label for="furniture2">衣櫃：</label>
									<input type="checkbox" name="furnitureN" id="furniture2" value="衣櫃"
										onclick="getCBValue('furniture')">
									<label for="furniture3">沙發：</label>
									<input type="checkbox" name="furnitureN" id="furniture3" value="沙發"
										onclick="getCBValue('furniture')">
									<label for="furniture4">桌子：</label>
									<input type="checkbox" name="furnitureN" id="furniture4" value="桌子"
										onclick="getCBValue('furniture')">
									<label for="furniture5">椅子：</label>
									<input type="checkbox" name="furnitureN" id="furniture5" value="椅子"
										onclick="getCBValue('furniture')">
								</div>
								<div>
									<p>租金包含：</p>
									<form:hidden path="include" />
									<label for="include1">管理費：</label>
									<input type="checkbox" name="includeN" id="include1" value="管理費"
										onclick="getCBValue('include')">
									<label for="include2">清潔費：</label>
									<input type="checkbox" name="includeN" id="include2" value="清潔費"
										onclick="getCBValue('include')">
									<label for="include3">瓦斯費：</label>
									<input type="checkbox" name="includeN" id="include3" value="瓦斯費"
										onclick="getCBValue('include')">
									<label for="include4">第四台：</label>
									<input type="checkbox" name="includeN" id="include4" value="第四台"
										onclick="getCBValue('include')">
									<label for="include5">網路：</label>
									<input type="checkbox" name="includeN" id="include5" value="網路"
										onclick="getCBValue('include')">
									<label for="include6">水費：</label>
									<input type="checkbox" name="includeN" id="include6" value="水費"
										onclick="getCBValue('include')">
									<label for="include7">電費：</label>
									<input type="checkbox" name="includeN" id="include7" value="電費"
										onclick="getCBValue('include')">
								</div>
								<div>
									<p>生活機能：</p>
									<form:hidden path="le" />
									<label for="le1">學校：</label>
									<input type="checkbox" name="leN" id="le1" value="學校" onclick="getCBValue('le')">
									<label for="le2">夜市：</label>
									<input type="checkbox" name="leN" id="le2" value="夜市" onclick="getCBValue('le')">
									<label for="le3">便利商店：</label>
									<input type="checkbox" name="leN" id="le3" value="便利商店" onclick="getCBValue('le')">
									<label for="le4">傳統市場：</label>
									<input type="checkbox" name="leN" id="le4" value="傳統市場" onclick="getCBValue('le')">
									<label for="le5">百貨公司：</label>
									<input type="checkbox" name="leN" id="le5" value="百貨公司" onclick="getCBValue('le')">
									<label for="le6">醫療機構：</label>
									<input type="checkbox" name="leN" id="le6" value="醫療機構" onclick="getCBValue('le')">
									<label for="le7">公車站：</label>
									<input type="checkbox" name="leN" id="le7" value="公車站" onclick="getCBValue('le')">
									<label for="le8">捷運站：</label>
									<input type="checkbox" name="leN" id="le8" value="捷運站" onclick="getCBValue('le')">
									<label for="le9">火車站：</label>
									<input type="checkbox" name="leN" id="le9" value="火車站" onclick="getCBValue('le')">

								</div>
								<div>
									<p>身分限制：</p>
									<form:hidden path="indetity" />
									<label for="indetity1">學生：</label><input type="checkbox" name="indetityN"
										id="indetity1" value="學生" onclick="getCBValue('indetity')">
									<label for="indetity2">正職：</label><input type="checkbox" name="indetityN"
										id="indetity2" value="正職" onclick="getCBValue('indetity')">
									<label for="indetity3">兼職：</label><input type="checkbox" name="indetityN"
										id="indetity3" value="兼職" onclick="getCBValue('indetity')">
									<label for="indetity4">家庭：</label><input type="checkbox" name="indetityN"
										id="indetity4" value="家庭" onclick="getCBValue('indetity')">
									<label for="indetity5">自由業：</label><input type="checkbox" name="indetityN"
										id="indetity5" value="自由業" onclick="getCBValue('indetity')">
								</div>

								<input type="submit" class="medium green button" value="送出">
								<input type="button" class="blue button" id="oneclickH" value="一鍵代入">

							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
			<!-- /#page-content-wrapper -->

		</div>
	</div>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

</body>




</html>