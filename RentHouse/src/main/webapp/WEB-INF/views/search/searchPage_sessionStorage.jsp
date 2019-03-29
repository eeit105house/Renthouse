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
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> -->
<!-- 自定義的css -->
<link rel='stylesheet'	href='${pageContext.request.contextPath}/search/css/houselist.css'	type="text/css" />


<title>尋找幸福~*</title>
</head>
<body class="body" style="background-color: #ffebd7;">
	<div style="height: 75px;">
		<%@include file="../login/narbar.jsp"%>
	</div>
	
<%-- <a href="${pageContext.request.contextPath}/deal/AllHouseDealForAMember">某一房子(houseid)---歷年房屋成交紀錄</a> --%>
	<form method="get">
		<div class="searchDiv" style="background-color: #ffebd7;">
			<input class="searchText" type="text" placeholder="請輸入關鍵字(社區、街道等)" id="keyWord"/>
			
				<img onclick="getKeyWord()" src='${pageContext.request.contextPath}/search/img/search.PNG' />
			
		<a class = "mapImg btn btn-primary" style="width:120px;" href="${pageContext.request.contextPath}/search/searchByMap"><img class="pinImg"src="${pageContext.request.contextPath}\search\img\Pin.png">地圖查詢</a>
		</div>
	</form>

	
	<div class="selectNumberScreen">
		<div class="hasBeenSelected">
			<span class="clearList_left">篩選條件：</span>
			<span class="clearList"></span>
			<span class="eliminateCriteria">全部清除</span>
		</div>

		
		
		<div id="selectList" class="screenBox">
		
			<div class="titleDiv">位置：</div><div id="zipcode2" class="zipcodeForCss"></div>


			<p class="onlyIndexList" id="selectTypeId" />
				<div class="titleDiv">類型：&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0">類型不限</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0" name="整層住家">整層住家</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0" name="獨立套房">獨立套房</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0" name="分租套房">分租套房</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0" name="雅房">雅房</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="type0" name="其他類型">其他類型</span>
			</div>
			
			<p class="onlyIndexList" id="listIndexId" />
				<div class="titleDiv">租金： &nbsp;&nbsp;|&nbsp;&nbsp;<span id="price0">租金不限</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectPrice" id="price0" name="5000元以下">5000元以下</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectPrice" id="price0" name="5000-10000元">5000-10000元</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectPrice" id="price0" name="10000-20000元">10000-20000元</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectPrice" id="price0" name="20000-30000元">20000-30000元</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectPrice" id="price0" name="30000-40000元">30000-40000元</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectPrice" id="price0" name="40000元以上">40000元以上</span>			
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<div class="textDiv">
				<input class="text" type="text"	name="priceSqft" id="minprice">&nbsp;-&nbsp;
				<input class="text" type="text"	name="priceSqft" id="maxprice">&nbsp;元
				<input type="button" value="確定" onclick="getPrice()" id="price7"></div>			
			</div>
			
			<p class="onlyIndexList" id="selectSqftId" />
				<div class="titleDiv">坪數： &nbsp;&nbsp;|&nbsp;&nbsp;<span id="Sqft0">坪數不限</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectSqft" id="Sqft0" name="10坪以下">10坪以下</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectSqft" id="Sqft0" name="10-20坪">10-20坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectSqft" id="Sqft0" name="20-30坪">20-30坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectSqft" id="Sqft0" name="30-40坪">30-40坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectSqft" id="Sqft0" name="40-50坪">40-50坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectSqft" id="Sqft0" name="50坪以上">50坪以上</span>
				&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;&nbsp;			
				<div class="textDiv"><input class="text" name="priceSqft" type="text" id="minsqft">&nbsp;-&nbsp;
				<input	class="text" type="text" name="priceSqft" id="maxsqft">&nbsp;坪
				<input	type="button" value="確定" onclick="getSqft()" id="Sqft6"></div>			
			</div>

			<p class="onlyIndexList" id="selectBuildId" />
				<div class="titleDiv">房屋型態：  &nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="公寓"	value="公寓" id="build0">公寓 &nbsp;&nbsp;|&nbsp;&nbsp;
				<input	type="checkbox" name="電梯大樓" value="電梯大樓" id="build1">電梯大樓&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="透天厝""	value="透天厝" id="build2">透天厝 &nbsp;&nbsp;|&nbsp;&nbsp;
				<input	type="checkbox" name="別墅" value="別墅" id="build3">別墅
			</div>


			<p class="onlyIndexList" id="selectFloorId" />
				<div class="titleDiv">樓層：  
				<select  class="floor" name="floor">
					<option value="0" id="floor0" style="display:none">請選擇樓層</option>
					<option value="1" id="floor0">1樓</option>
					<option value="2" id="floor0">2-3樓</option>
					<option value="3" id="floor0">4樓以上</option>
				</select>
			 </div>
		
			<p class="onlyIndexList" id="selectMoreId" />
				<div class="titleDiv">更多條件： &nbsp;&nbsp;|&nbsp;&nbsp; 
				<input type="checkbox" name="電視" value="電視" id="more0">有電視 &nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="冰箱" value="冰箱" id="more1">有冰箱	&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="洗衣機"	value="洗衣機" id="more2">有洗衣機&nbsp;&nbsp;|&nbsp;&nbsp; 
				<input type="checkbox" name="冷氣" value="冷氣" id="more3">有冷氣&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="網路" value="網路" id="more4">有網路	&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="熱水器"	value="熱水器" id="more5">有熱水器&nbsp;&nbsp;|&nbsp;&nbsp; 
				<input type="checkbox" name="第四台" value="第四台" id="more6">有第四台&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="瓦斯"	value="瓦斯" id="more7">有瓦斯
			</div>

	
	</div>
	</div>	
	<div style="margin-left:100px;margin-top:30px;text-align:left;"><span class="font-22B">精選推薦</span></div>
<!-- 	插入輪播牆 -->
	<div class = "carouselDiv" ></div>
<!-- 	插入房屋物件 -->
	<div class = "start"></div>
<!-- </div>	 -->

<script>$("#zipcode2").twzipcode({
	countySel: "縣市", // 城市預設值, 字串一定要用繁體的 "臺", 否則抓不到資料
	districtSel: "鄉鎮市區", // 地區預設值
	zipcodeIntoDistrict: true, // 郵遞區號自動顯示在地區
	css: ["city city-control", "town town-control"], // 自訂 "城市"、"地區" class 名稱 
	countyName: "city", // 自訂城市 select 標籤的 name 值
	districtName: "town" // 自訂地區 select 標籤的 name 值
	});</script>
<script>
$(":text").focus(function() {
	$(this).css("background-color", "#cccccc")
});
$(":text").blur(function() {
	var textName = $(this).attr("name");
	$(this).css("background-color", "#ffffff");
	var temp=/^\d+(\.\d+)?$/;	
	if(textName == "priceSqft"){
		if($(this).attr("id")!="keyWord"){
			if(temp.test(this.value)==false){
				if(this.value == ""){	
				}else{
					alert("輸入[" +this.value+"]，錯誤格式");
				}		
				$(this).val("0");
			}
		}
	}
});
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
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_carousel",
				type:"Get",
				cache:"false",
				success:function(data){
						$(".carouselDiv").html(data);
				}
			});
		}else{
			if(sessionStorage.getItem("type0") != null){
				var text = sessionStorage.getItem("type0");
				var type = "[name~='"+text+"']"
				$(type).css({"color":"black","background-color":"#FF4500"});
			}	
			if(sessionStorage.getItem("price0") != null){
				var text = sessionStorage.getItem("price0");
				var type = "[name~='"+text+"']"
				$(type).css({"color":"black","background-color":"#FF4500"});
			}	
			if(sessionStorage.getItem("Sqft0") != null){
				var text = sessionStorage.getItem("Sqft0");
				var type = "[name~='"+text+"']"
				$(type).css({"color":"black","background-color":"#FF4500"});
			}
			var ca = sessionStorage.getItem("clearList").split(',');
			var len = ca.length;
			for (var i = 0; i < ca.length; i++) {
				var type = "[name~='"+ca[i]+"']";
				$(type).prop("checked","true");
				
			}
// 			$(this).css({"color":"black","background-color":"#FF4500"});
			
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
			$.ajax({
				url:"${pageContext.request.contextPath}/search/searchPage_carousel",
				type:"Get",
				cache:"false",
				success:function(data){
						$(".carouselDiv").html(data);
				}
			});
		}
		
	}else{
		$.ajax({
			url:"${pageContext.request.contextPath}/search/searchPage_carousel",
			type:"Get",
			cache:"false",
			success:function(data){
					$(".carouselDiv").html(data);
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
	
	$(".titleDiv span ").mouseenter(function() {
		var id = $(this).attr("id");
		var text = $(this).text();
		if(sessionStorage.getItem(id)!=text){
		$(this).css("color","#FF4500");
		}
	});
	$(".titleDiv span ").mouseleave(function() {
		var id = $(this).attr("id");
		var text = $(this).text();
		if(sessionStorage.getItem(id)!=text){
		$(this).css("color","black");
		}
	});
			
	
		$(".titleDiv span ").click(function() {
			
			var text = $(this).text();
			var id = $(this).attr("id");	
			if(sessionStorage.getItem(id)!=text){
				if(id == "type0"){
					$(".selectType").css({"color":"black","background-color":"#DCDCDC"});
					$(this).css({"color":"black","background-color":"#FF4500"});
				}
				if(id == "price0"){
					$(".selectPrice").css({"color":"black","background-color":"#DCDCDC"});
					$(this).css({"color":"black","background-color":"#FF4500"});
				}
				if(id == "Sqft0"){
					$(".selectSqft").css({"color":"black","background-color":"#DCDCDC"});
					$(this).css({"color":"black","background-color":"#FF4500"});
				}
				
			}
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
			var thisText = $(this).children('option:selected').text();
			var townText = $(".town-control").children('option:selected').text();
			text = thisText + townText;
			var id = "cityWithTown";
			changeSelect(text,id);
		});
		
		$(".town-control").change(function() {	//選取縣市後後動作
			var thisText = $(this).children('option:selected').text();
			var cityText = $(".city-control").children('option:selected').text();
			var text = cityText+thisText;
			var id = "cityWithTown";
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
			if(min>max){
				var temp = 0;
				temp = min;
				min = max;
				max = temp;
				$("#minsqft").val(min);
				$("#maxsqft").val(max);
			}
			
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
			if(min>max){
				var temp = 0;
				temp = min;
				min = max;
				max = temp;
				$("#minprice").val(min);
				$("#maxprice").val(max);
			}
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
			$(".titleDiv > input ").prop("checked","true");
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
		

		
		$('.carouselDiv').carousel({
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