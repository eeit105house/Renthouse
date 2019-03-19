
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
		
		$(".onlyIndex span ").click(function() {
			var text = $(this).text();
			var id = $(this).attr("id");
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

		$(".listIndex input ").click(function() {
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

		$(".floor").change(function() {
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
