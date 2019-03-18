<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/search/css/houselist.css'
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/search/js/jQuery-TWzipcode-master/jquery.twzipcode.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="${pageContext.request.contextPath}/search/searchPage_sessionStorage">條件查詢</a>
<form method="get">
		<div class="searchDiv">
			<input class="searchText" type="text" placeholder="請輸入關鍵字(社區、街道等)" />
			<button class="searchBut">
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
		
			<div id="zipcode2"></div>
			<div class="mapSelect" >
				<select  class="mapSelectOnly" name="type">
					<option value="0" id="type0" style="display:none">類型</option>
					<option value="1" id="type0">類型不限</option>
					<option value="1" id="type0">整層住家</option>
					<option value="2" id="type0">獨立套房</option>
					<option value="3" id="type0">分租套房</option>
					<option value="3" id="type0">雅房</option>
					<option value="3" id="type0">其他類型</option>
				</select>
			</div>
			
			<div class="mapSelect" >
				<select  class="mapSelectOnly" name="sqft">
					<option id="Sqft0" style="display:none">坪數</option>
					<option id="Sqft0">坪數不限</option>
					<option id="Sqft0">10坪以下</option>
					<option id="Sqft0">10-20坪</option>
					<option id="Sqft0">20-30坪</option>
					<option id="Sqft0">30-40坪</option>
					<option id="Sqft0">40-50坪</option>
					<option id="Sqft0">50坪以上</option>
				</select>
			</div>
			
		<div class="mapSelect" >
				<select  class="mapSelectOnly" name="build">
					<option id="build0" style="display:none">房屋型態</option>
					<option id="build0">型態不限</option>
					<option id="build0">公寓</option>
					<option id="build0">電梯大樓</option>
					<option id="build0">透天厝</option>
					<option id="build0">別墅</option>
				</select>
			</div>			

			<div class="mapSelect" >
				<select  class="mapSelectOnly" name="floor">
					<option value="0" id="floor0" style="display:none">請選擇樓層</option>
					<option value="1" id="floor0">1樓</option>
					<option value="2" id="floor0">2-3樓</option>
					<option value="3" id="floor0">4樓以上</option>
				</select>
			</div>
			
			<div class="mapSelect" >
				<select  class="mapSelectOnly" name="price">
					<option id="price0" style="display:none">租金</option>
					<option id="price0">租金不限</option>
					<option id="price0">5000元以下</option>
					<option id="price0">5000-10000元</option>
					<option id="price0">10000-20000元</option>
					<option id="price0">20000-30000元</option>
					<option id="price0">30000-40000元</option>
					<option id="price0">40000元以上</option>
				</select>
			</div>
		</div>
	</div>
	<hr>
<div class = "start">

</div>
	<hr>
	<div id="map"></div>


<!-- 	<script -->
<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiEowD-jl-xl0Y_GkFppPI1SkfoF5lWTc&callback=initMap" -->
<!-- 		async defer>	 -->
<!-- 	</script> -->
	
	<script>
		var map;
		var a = -1;
		var url = 'https://ruienyuski.github.io/git_test/itaiwan.json';

		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 17,
				center : {
					lat : 22.630884,
					lng : 120.301065
				}
			});

			callAjax(url);

			function callAjax(url) {
				var xhr = new XMLHttpRequest();
				xhr.open('get', url, true);
				xhr.send(null);

				xhr.onload = function() {

					var record = JSON.parse(xhr.responseText);
					wifiData = record.result.records;
					len = wifiData.length;

					//跑迴圈依序將值塞入到 marker
					for (i = 0; i < wifiData.length; i++) {
						var str = {};
						var place = {};

						place.lat = parseFloat(wifiData[i]['lat']);
						place.lng = parseFloat(wifiData[i]['lng']);

						str.map = map;
						str.title = wifiData[i]['地點']
						str.position = place;
						str.clickable = true, //可否點擊
						str.visible = true, //是否顯示
						console.log(str);
						var marker = new google.maps.Marker(str);

						attachSecretMessage(marker, i)
					}
					function attachSecretMessage(marker, number) {
						var infowindow = new google.maps.InfoWindow({
							content : "data" + number,
							size : new google.maps.Size(50, 50)
						});
						google.maps.event.addListener(marker, 'click',
								function() {
									a = a * -1;
									if (a > 0) {
										infowindow.open(map, marker);
									} else {
										infowindow.close();
									}
								});
					}
				};
			}
			;

		}
	</script>
	
	<script>
	$(document).ready(function(){
		if(sessionStorage.getItem("clearList") != null){	
			$(".clearList").text(sessionStorage.getItem("clearList"));
			$(".eliminateCriteria").show();
		};
		
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_start",
			type:"Get",
			cache:"false",
			success:function(data){
				$(".start").html(data);
				
			}
		});
		
		
		$("#zipcode2").twzipcode({
		countySel: "臺北市", // 城市預設值, 字串一定要用繁體的 "臺", 否則抓不到資料
		districtSel: "大安區", // 地區預設值
		zipcodeIntoDistrict: true, // 郵遞區號自動顯示在地區
		css: ["city city-control", "town town-control"], // 自訂 "城市"、"地區" class 名稱 
		countyName: "city", // 自訂城市 select 標籤的 name 值
		districtName: "town" // 自訂地區 select 標籤的 name 值
		});
	
	});
	
	$(".mapSelectOnly").change(function() {
		var text = $(this).children('option:selected').text();
		var id = $(this).children('option:selected').attr("id");
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
	});

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
//					$(".start").html(data);
				window.location.reload()
			}
		});
		
	});

	$("#twzipcode").twzipcode();
	// 		$(".selectType").click(function() {
	// 			$.ajax({
	// 				url : "/queryByType",
	// 				data:{type:$(this).text()}
	// 				type : "GET",
	// 				cache : "false",
	// 				success : function(data) {
	// 					alert(data);
	// 				}
	// 			});
	// 		});
</script>
</body>
</html>