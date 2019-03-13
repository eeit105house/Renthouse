<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/houselist.css'
	type="text/css" />
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
</head>

<body>
	<form method="get">
		<div class="searchDiv">
			<input class="searchText" type="text" placeholder="請輸入關鍵字(社區、街道等)" />
			<button class="searchBut">
				<img src='${pageContext.request.contextPath}/images/search.PNG' />
			</button>
		</div>
	</form>

	<hr>
	<div class="selectNumberScreen">
		<div class="hasBeenSelected">
			<dl>
				<dt>已選擇條件：</dt>
				<dd style="DISPLAY: none" class=clearDd>
					<div class=clearList></div>
					<div style="DISPLAY: none" class="eliminateCriteria">清除筛选条件</div>
			</dl>
		</div>

		<hr>
		<div id="selectList" class="screenBox screenBackground">
			<div class="city" id="zipcode2"></div>

			<script>
				$("#zipcode2").twzipcode({
					countySel : "臺北市", // 城市預設值, 字串一定要用繁體的 "臺", 否則抓不到資料
					districtSel : "大安區", // 地區預設值
					zipcodeIntoDistrict : true, // 郵遞區號自動顯示在地區
					css : [ "city form-control", "town form-control" ], // 自訂 "城市"、"地區" class 名稱 
					countyName : "city", // 自訂城市 select 標籤的 name 值
					districtName : "town" // 自訂地區 select 標籤的 name 值
				});
			</script>

			<p class="listIndex" id="selectTypeId">
				類型：&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="allType">不限</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="整層住家">整層住家</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="獨立套房">獨立套房</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="分租套房">分租套房</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="雅房">雅房</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span class="selectType" id="其他">其他</span>
			</p>

			<p class="listIndex" id="listIndexId">
				租金： &nbsp;&nbsp;|&nbsp;&nbsp;<span>不限</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>5000以下</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>5000-10000</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>10000-20000</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>20000-30000</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>30000-40000</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>40000以上</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<input class="text" type="text">&nbsp;-&nbsp;<input
					class="text" type="text">&nbsp;元 <input type="button"
					value="確定" onclick="">
			</p>

			<p class="listIndex" id="selectSqftId">
				坪數： &nbsp;&nbsp;|&nbsp;&nbsp;<span>不限</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>10坪以下</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>10-20坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>20-30坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>30-40坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>40-50坪</span>
				&nbsp;&nbsp;|&nbsp;&nbsp;<span>50坪以上</span>
				&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;&nbsp;<input class="text"
					type="text">&nbsp;-&nbsp;<input class="text" type="text">&nbsp;坪
				<input type="button" value="確定" onclick="">
			</p>

			<p class="listIndex" id="selectBuildId">
				房屋型態： &nbsp;&nbsp;|&nbsp;&nbsp;<input type="checkbox" name="build"
					value="公寓">公寓 &nbsp;&nbsp;|&nbsp;&nbsp;<input
					type="checkbox" name="build" value="電梯大樓">電梯大樓
				&nbsp;&nbsp;|&nbsp;&nbsp;<input type="checkbox" name="build"
					value="透天厝">透天厝 &nbsp;&nbsp;|&nbsp;&nbsp;<input
					type="checkbox" name="build" value="別墅">別墅
			</p>

			<p class="listIndex" id="selectFloorId">
				樓層： <select name="floor">
					<option value="1">1樓</option>
					<option value="2">2-3樓</option>
					<option value="3">4樓以上</option>
				</select>
			</p>

			<p class="listIndex" id="selectMoreId">
				更多條件：&nbsp;&nbsp;|&nbsp;&nbsp; <input type="checkbox"
					name="appliance" value="電視">有電視 &nbsp;&nbsp;|&nbsp;&nbsp;<input
					type="checkbox" name="appliance" value="冰箱">有冰箱
				&nbsp;&nbsp;|&nbsp;&nbsp;<input type="checkbox" name="appliance"
					value="洗衣機">有洗衣機&nbsp;&nbsp;|&nbsp;&nbsp; <input
					type="checkbox" name="appliance" value="冷氣">有冷氣&nbsp;&nbsp;|&nbsp;&nbsp;
				<input type="checkbox" name="appliance" value="網路">有網路
				&nbsp;&nbsp;|&nbsp;&nbsp;<input type="checkbox" name="appliance"
					value="熱水器">有熱水器&nbsp;&nbsp;|&nbsp;&nbsp; <input
					type="checkbox" name="appliance" value="第四台">有第四台
				&nbsp;&nbsp;|&nbsp;&nbsp;<input type="checkbox" name="appliance"
					value="瓦斯">有瓦斯
			</p>

		</div>
	</div>
	<hr>

	<c:forEach var='objectlist' items="${Objectlists}">
		<div id="sitebody">
			<div id="sidebar_left">
				<img id="img" src="<c:url value='/getPicture/${objectlist[0]}' />" />
			</div>
			<div id="sidebar_right">
				<span class="font-25R">&nbsp;${objectlist[9]}&nbsp;元&nbsp;/&nbsp;月</span>
			</div>
			<div id="content">
				<span class="font-22B">${objectlist[1]}</span><br> <span
					class="font-16B">${objectlist[2]}&nbsp;&nbsp;|&nbsp;&nbsp;${objectlist[3]}坪&nbsp;&nbsp;|&nbsp;&nbsp;樓層:${objectlist[4]}/${objectlist[5]}</span><br>
				<span class="font-16B">${objectlist[6]}&nbsp;-&nbsp;${objectlist[7]}</span>
				<br> <span class="font-16B">屋主&nbsp;${objectlist[8]}&nbsp;&nbsp;/&nbsp;&nbsp;${objectlist[10]}</span>
			</div>

		</div>

	</c:forEach>

	<hr>

	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
	var pNum  =$("#selectList").find("p");
    for (i = 0; i < pNum.length; i++) {
        $(".hasBeenSelected .clearList").append("<div class=\"selectedInfor selectedShow\" style=\"display:none\"><span></span><label></label><em></em></div>");
    }

    var refresh = "true";

    $(".listIndex span ").click(function(){
        var text =$(this).text();
        var selectedShow = $(".selectedShow");
        var textTypeIndex =$(this).parents("p").index();
        var textType =$(this).parent("dd").siblings("dt").text();
        index = textTypeIndex -(2);
        $(".clearDd").show();
        $(".selectedShow").eq(index).show();
        $(this).addClass("selected").siblings().removeClass("selected");
        selectedShow.eq(index).find("span").text(textType);
        selectedShow.eq(index).find("label").text(text);
        var show = $(".selectedShow").length - $(".selectedShow:hidden").length;
        if (show > 1) {
            $(".eliminateCriteria").show();
        }

    });
    $(".selectedShow em").click(function(){
        $(this).parents(".selectedShow").hide();
        var textTypeIndex =$(this).parents(".selectedShow").index();
        index = textTypeIndex;
        $(".listIndex").eq(index).find("span").removeClass("selected");

        if($(".listIndex .selected").length < 2){
            $(".eliminateCriteria").hide();
        }
    });

    $(".eliminateCriteria").click(function(){
        $(".selectedShow").hide();
        $(this).hide();
        $(".listIndex span ").removeClass("selected");
    }); 
	
	
	
	
	
		$("#oo span").click(function() {
			$("#selectResult").append($(this).text());
			alert($("#selectResult").text());
		});
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