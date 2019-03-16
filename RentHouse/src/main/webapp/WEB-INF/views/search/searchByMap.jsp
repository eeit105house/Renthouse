<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/search/css/houselist.css'
	type="text/css" />

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>My Google Maps Demo</h3>

	<div id="map"></div>


	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiEowD-jl-xl0Y_GkFppPI1SkfoF5lWTc&callback=initMap"
		async defer>
		
	</script>
	<script>
		var map;
		var a = -1;
		var url = 'https://ruienyuski.github.io/git_test/itaiwan.json';
		var infowindow;
		var markers=[];
		
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {	zoom : 17,center : {
					lat : 22.630884,
					lng : 120.301065}});
			
			var infowindow = new google.maps.InfoWindow({
				content : '<h1>大家好</h1>' //內容可以是html
			});
// 			google.maps.event.addListener(infowindow, 'closeclick', function() {
// 				a = a * -1;
// 			});
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
						markers[i] = new google.maps.Marker(str);
						
						markers[i].addListener('click', function() {
							a = a * -1;
							if (a > 0) {
								infowindow.open(map, markers[i]);
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
</body>
</html>