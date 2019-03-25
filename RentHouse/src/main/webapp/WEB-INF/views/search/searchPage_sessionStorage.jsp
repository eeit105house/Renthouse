<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootStrap的css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!-- 自定義的css -->
<link rel='stylesheet'	href='${pageContext.request.contextPath}/search/css/houselist.css'	type="text/css" />
<!-- 縣市套件 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<script	src="${pageContext.request.contextPath}/search/js/jQuery-TWzipcode-master/jquery.twzipcode.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/search/searchByMap">地圖查詢</a>
<%-- <a href="${pageContext.request.contextPath}/deal/AllHouseDealForAMember">某一房子(houseid)---歷年房屋成交紀錄</a> --%>
<a href="${pageContext.request.contextPath}/deal/MemberAllHouse">某一房子(houseid)---新增成交</a>
<a href="${pageContext.request.contextPath}/deal/Test">某一房子(houseid)---新增成交</a>
	<form method="get">
		<div class="searchDiv">
			<input class="searchText" type="text" placeholder="請輸入關鍵字(社區、街道等)" id="keyWord"/>
			<button class="searchBut" onclick="getKeyWord()">
				<img src='${pageContext.request.contextPath}/search/img/search.PNG' />
			</button>
		</div>
	</form>

	<hr>
	<div class="selectNumberScreen">
		<div class="hasBeenSelected">
			<span class="clearList_left">已選擇條件：</span>
			<span class="clearList"></span>
			<span class="eliminateCriteria">全部清除</span>
		</div>

		<hr>
		
		<div id="selectList" class="screenBox screenBackground">
		
			<div class="titleDiv">位置：</div><div id="zipcode2" class="zipcodeForCss"></div>


			<p class="onlyIndexList" id="selectTypeId" />
				<div class="titleDiv">類型：&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0">類型不限</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0">整層住家</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0">獨立套房</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0">分租套房</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0">雅房</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0">其他類型</span>
			</div>
			
			<p class="onlyIndexList" id="listIndexId" />
				<div class="titleDiv">租金： &nbsp;&nbsp;|&nbsp;&nbsp;<span id="price0">租金不限</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="price0">5000元以下</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="price0">5000-10000元</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="price0">10000-20000元</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="price0">20000-30000元</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="price0">30000-40000元</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="price0">40000元以上</span>			
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<div class="textDiv">
				<input class="text" type="text"	id="minprice">&nbsp;-&nbsp;
				<input class="text" type="text"	id="maxprice">&nbsp;元
				<input type="button" value="確定" onclick="getPrice()" id="price7"></div>			
			</div>
			
			<p class="onlyIndexList" id="selectSqftId" />
				<div class="titleDiv">坪數： &nbsp;&nbsp;|&nbsp;&nbsp;<span id="Sqft0">坪數不限</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="Sqft0">10坪以下</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="Sqft0">10-20坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="Sqft0">20-30坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="Sqft0">30-40坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="Sqft0">40-50坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span id="Sqft0">50坪以上</span>
				&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;&nbsp;			
				<div class="textDiv"><input class="text" type="text" id="minsqft">&nbsp;-&nbsp;
				<input	class="text" type="text" id="maxsqft">&nbsp;坪
				<input	type="button" value="確定" onclick="getSqft()" id="Sqft6"></div>			
			</div>

			<p class="onlyIndexList" id="selectBuildId" />
				<div class="titleDiv">房屋型態：  &nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="build"	value="公寓" id="build0">公寓 &nbsp;&nbsp;|&nbsp;&nbsp;
				<input	type="checkbox" name="build" value="電梯大樓" id="build1">電梯大樓&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="build"	value="透天厝" id="build2">透天厝 &nbsp;&nbsp;|&nbsp;&nbsp;
				<input	type="checkbox" name="build" value="別墅" id="build3">別墅
			</div>

			<p class="onlyIndexList" id="selectFloorId" />
				<div class="titleDiv">樓層：   </div><select  class="floor" name="floor">
					<option value="0" id="floor0" style="display:none">請選擇樓層</option>
					<option value="1" id="floor0">1樓</option>
					<option value="2" id="floor0">2-3樓</option>
					<option value="3" id="floor0">4樓以上</option>
				</select>
		

			<p class="onlyIndexList" id="selectMoreId" />
				<div class="titleDiv">更多條件： &nbsp;&nbsp;|&nbsp;&nbsp; 
				<input type="checkbox"	name="appliance" value="電視" id="more0">有電視 &nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="appliance" value="冰箱" id="more1">有冰箱	&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="appliance"	value="洗衣機" id="more2">有洗衣機&nbsp;&nbsp;|&nbsp;&nbsp; 
				<input type="checkbox" name="appliance" value="冷氣" id="more3">有冷氣&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="appliance" value="網路" id="more4">有網路	&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="appliance"	value="熱水器" id="more5">有熱水器&nbsp;&nbsp;|&nbsp;&nbsp; 
				<input type="checkbox" name="appliance" value="第四台" id="more6">有第四台&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="appliance"	value="瓦斯" id="more7">有瓦斯
			</div>

		</div>
	</div>
	<br>
	<div class="titleDiv">精選推薦</div>
	<hr>
		<div class = "carousel"></div>
	<hr>
		<div class = "start"></div>
	<hr>


<script>
	function getKeyWord(){
		var text = $("div.searchDiv input").val();
		var id = "keyWord";
		changeSpan(text,id);
	};
	if(sessionStorage.getItem("clearList") != null){
		if(sessionStorage.getItem("clearList") == "106 大安區"){
			$(".clearList").empty();
			$(this).hide();
			sessionStorage.clear();
			$(".test").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_start",
				type:"Get",
				cache:"false",
				success:function(data){
						$(".start").html(data);
				}
			});
		}else{
			$(".clearList").text(sessionStorage.getItem("clearList"));
			$(".eliminateCriteria").show();
			$(".start").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_criteria",
				data:{Searchcriteria:$(".clearList").text()},
				type:"Get",
				cache:"false",
				success:function(data){
					$(".start").html(data);
					
				}
			});
		}
		
	}else{
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_carousel",
			type:"Get",
			cache:"false",
			success:function(data){
					$(".carousel").html(data);
			}
		});
		
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_start",
			type:"Get",
			cache:"false",
			success:function(data){
					$(".start").html(data);
			}
		});
	}
			
			
			$("#zipcode2").twzipcode({
			countySel: "縣市", // 城市預設值, 字串一定要用繁體的 "臺", 否則抓不到資料
			districtSel: "鄉鎮市區", // 地區預設值
			zipcodeIntoDistrict: true, // 郵遞區號自動顯示在地區
			css: ["city city-control", "town town-control"], // 自訂 "城市"、"地區" class 名稱 
			countyName: "city", // 自訂城市 select 標籤的 name 值
			districtName: "town" // 自訂地區 select 標籤的 name 值
			});

					
		$(".titleDiv span ").click(function() {
			var text = $(this).text();
			var id = $(this).attr("id");
			changeSpan(text,id);
		});

		$(".titleDiv > input ").click(function() {
			var text = $(this).prop("value");
			var id = $(this).attr("id");
			$(".start").empty();
			if ($(this).prop("checked") == true) {
				if ($(".clearList").text() == "") {
					sessionStorage.setItem(id, text);
					$(".clearList").append(text);
					$(".eliminateCriteria").show();
				} else {
					sessionStorage.setItem(id, text);
					$(".clearList").append("," + text);
				}
			} else {
				sessionStorage.removeItem(id);
				var ca = $(".clearList").text().split(',');
				$(".clearList").empty();
				var len = ca.length;
				for (var i = 0; i < ca.length; i++) {
					if (ca[i] != text) {
						if (len == 2) {
							$(".clearList").append(ca[i]);
						} else {
							$(".clearList").append(ca[i] + ",");
							len--;
						}
					}
				}
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_criteria",
				data:{Searchcriteria:$(".clearList").text()},
				type:"Get",
				cache:"false",
				success:function(data){
					$(".start").html(data);
					
				}
			});
			sessionStorage.setItem("clearList",$(".clearList").text());
		});

		$(".floor").change(function() {					//選取樓層後動作
			var text = $(this).children('option:selected').text();
			var id = $(this).children('option:selected').attr("id");
			changeSelect(text,id);
		});

		$(".city-control").change(function() {			//選取城市後動作
			var text = $(this).children('option:selected').text();
			var id = $(this).children('option:selected').attr("id");
			changeSelect(text,id);
		});
		
		$(".town-control").change(function() {	//選取縣市後後動作
			var text = $(this).children('option:selected').text();
			var id = $(this).children('option:selected').attr("id");
			changeSelect(text,id);
		});
		
		function changeSpan(text,id){
			$(".start").empty();
			if ($(".clearList").text() == "") {
				sessionStorage.setItem(id, text);
				$(".clearList").append(text);
				$(".eliminateCriteria").show();
			} else {
				if (sessionStorage.getItem(id) != null) {
					var deldata = sessionStorage.getItem(id);
					sessionStorage.removeItem(id);
					var ca = $(".clearList").text().split(',');
					$(".clearList").empty();
					for (var i = 0; i < ca.length; i++) {
						if (ca[i] != deldata) {
							$(".clearList").append(ca[i] + ",");
						}
					}
					$(".clearList").append(text);
					sessionStorage.setItem(id, text);
				} else {
					sessionStorage.setItem(id, text);
					$(".clearList").append("," + text);
				}
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_criteria",
				data:{Searchcriteria:$(".clearList").text()},
				type:"Get",
				cache:"false",
				success:function(data){
					$(".start").html(data);
					
				}
			});
			sessionStorage.setItem("clearList",$(".clearList").text());		
		}
		
		function changeSelect(text,id){			
		$(".start").empty();
		if ($(".clearList").text() == "") {
			sessionStorage.setItem(id, text);
			$(".clearList").append(text);
			$(".eliminateCriteria").show();
		} else {
			if (sessionStorage.getItem(id) != null) {
				var deldata = sessionStorage.getItem(id);
				sessionStorage.removeItem(id);
				var ca = $(".clearList").text().split(',');
				$(".clearList").empty();
				for (var i = 0; i < ca.length; i++) {
					if (ca[i] != deldata) {
						$(".clearList").append(ca[i] + ",");
					}
				}
				$(".clearList").append(text);
				sessionStorage.setItem(id, text);
			} else {
				sessionStorage.setItem(id, text);
				$(".clearList").append("," + text);
			}
		}		
		
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_criteria",
			data:{Searchcriteria:$(".clearList").text()},
			type:"Get",
			cache:"false",
			success:function(data){
				$(".start").html(data);
			}
		});
		sessionStorage.setItem("clearList",$(".clearList").text());
	};
		
		function getSqft() {
			var min = $("#minsqft").val();
			var max = $("#maxsqft").val();
			var text = min + "-" + max + "坪";
			var id = "Sqft0";
			$(".start").empty();
			if ($(".clearList").text() == "") {
				sessionStorage.setItem(id, text);
				$(".clearList").append(text);
				$(".eliminateCriteria").show();
			} else {
				if (sessionStorage.getItem(id) != null) {
					var deldata = sessionStorage.getItem(id);
					sessionStorage.removeItem(id);
					var ca = $(".clearList").text().split(',');
					$(".clearList").empty();
					for (var i = 0; i < ca.length; i++) {
						if (ca[i] != deldata) {
							$(".clearList").append(ca[i] + ",");
						}
					}
					$(".clearList").append(text);
					sessionStorage.setItem(id, text);
				} else {
					sessionStorage.setItem(id, text);
					$(".clearList").append("," + text);
				}
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_criteria",
				data:{Searchcriteria:$(".clearList").text()},
				type:"Get",
				cache:"false",
				success:function(data){
					$(".start").html(data);
					
				}
			});
			sessionStorage.setItem("clearList",$(".clearList").text());
		}

		function getPrice() {
			var min = $("#minprice").val();
			var max = $("#maxprice").val();
			var text =  min + "-" + max + "元";
			var id = "price0";
			$(".start").empty();
			if ($(".clearList").text() == "") {
				sessionStorage.setItem(id, text);
				$(".clearList").append(text);
				$(".eliminateCriteria").show();
			} else {
				if (sessionStorage.getItem(id) != null) {
					var deldata = sessionStorage.getItem(id);
					sessionStorage.removeItem(id);
					var ca = $(".clearList").text().split(',');
					$(".clearList").empty();
					for (var i = 0; i < ca.length; i++) {
						if (ca[i] != deldata) {
							$(".clearList").append(ca[i] + ",");
						}
					}
					$(".clearList").append(text);
					sessionStorage.setItem(id, text);
				} else {
					sessionStorage.setItem(id, text);
					$(".clearList").append("," + text);
				}
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_criteria",
				data:{Searchcriteria:$(".clearList").text()},
				type:"Get",
				cache:"false",
				success:function(data){
					$(".start").html(data);
					
				}
			});
			sessionStorage.setItem("clearList",$(".clearList").text());
		}

		
		
		$(".eliminateCriteria").click(function() {		
			$(".clearList").empty();
			$(this).hide();
			sessionStorage.clear();
			$(".test").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_start",
				type:"Get",
				cache:"false",
				success:function(data){
// 					$(".start").html(data);
					window.location.reload()
				}
			});
			
		});
	
		$("#twzipcode").twzipcode();
		$('.carousel').carousel({
			  interval: 2000
			});
</script>

		<!-- bootStrap的Jquery'Popper'JavaScript 插件 -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/search/js/paging-master/js/paging.js"></script>
</body>
</html>