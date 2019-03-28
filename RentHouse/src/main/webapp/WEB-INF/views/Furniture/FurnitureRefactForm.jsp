<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

	<script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script>
	<!-- KICKSTART -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
	<!-- KICKSTART -->
	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet"
		type="text/css" />

	<title>二手家具</title>
	<script>
		$(document).ready(function () {
			$('input').keypress(function (e) { //禁止按enter送出
				code = e.keyCode ? e.keyCode : e.which; // in case of browser compatibility
				if (code == 13) {
					e.preventDefault();
					// do something
					/* also can use return false; instead. */
				}
			});

			$("#price").keydown(function (e) {//限制數字.1
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

			$('#price').keyup(function () { //限制數字.1
				if (/[^0-9\.-]/g.test(this.value)) {
					this.value = this.value.replace(/[^0-9\.-]/g, '');
				}

				if (/-/g.test(this.value) && !/^-/g.test(this.value)) {
					this.value = this.value.replace(/-/g, '');
				}
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

            <!-- <div class="bg-light border-right" id="sidebar-wrapper">
                <div class="sidebar-heading list-group-item bg-warning">會員中心</div>
                <div class="list-group list-group-flush">
                    <a href="<c:url value='/membercontrol/${user.id}'/>"
                        class="list-group-item list-group-item-action bg-light">&gt;&gt;會員資料修改</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
                </div>
            </div> -->
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
                    <div class="post">
				<form:form modelAttribute="furnitureBean" method="post" enctype="multipart/form-data">
					<fieldset>
						<legend class="legendK">二手家具修改</legend>
						<div>
							<label for="title">標題：</label>
							<form:input path="title"/>
							<p>${errorMsgFu.titleE}</p>
						</div>
						<div>
							<label for="">簡介：</label>
							<textarea name="infoN" id="infoN" cols="30" rows="10">${furnitureInfo}</textarea>
							<p></p>
						</div>
						<div>
							<label for="">類型：</label>
							<form:select path="type">
								<form:option value="">-請選擇-</form:option>
								<form:option value="電器">電器</form:option>
								<form:option value="桌椅">桌椅</form:option>
								<form:option value="櫃子">櫃子</form:option>
								<form:option value="床具">床具</form:option>
								<form:option value="其它">其它</form:option>
							</form:select>
<%-- 							<input type="text" id="typeN" name="typeN" value="${furnitureBean.type}"> --%>
							<p>${errorMsgFu.typeE}</p>
						</div>
						<div>
							<label for="price">價格：</label>
							<form:input path="price" value="${furnitureBean.price}"/>
							<p>${errorMsgFu.priceE}</p>
						</div>
						<div>
							<label for="addr">地址：</label>
							<form:input path="addr" value="${furnitureBean.addr}" class="col_7"/>
							<p>${errorMsgFu.addrE}</p>
						</div>
						<div>
							<label for="delvery">取貨方式：</label>
							<form:input path="delvery" value="${furnitureBean.delvery}"/>
							<p>${errorMsgFu.delveryE}</p>
						</div>
						<div>
							<img alt="" src="<c:url value='/furnitureView/fuPic/${furnitureBean.id}'/>" height="100px"/>
							<label for="pic">上傳照片：</label>
							<input type="file" name="pic" id="pic" accept="image/jpeg">
							<p>*請使用jpeg檔</p>
							<p>${errorMsgFu.picNone}</p>
						</div>
						<input class="green button" type="submit" value="修改">
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