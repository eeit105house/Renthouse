<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>上傳圖片</title>
    <script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script> <!-- KICKSTART -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
    <!-- KICKSTART -->
      	<!-- house模板CSS	 -->
	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet" type="text/css" />

    <script>
        $("*").ready(function () {
            $('input').keypress(function (e) {
                code = e.keyCode ? e.keyCode : e.which; // in case of browser compatibility
                if (code == 13) {
                    e.preventDefault();
                    // do something
                    /* also can use return false; instead. */
                }
            });
            $("input:hidden").val("");
            $("input:text").val("");
        });
    </script>
</head>

<body>


    <div id="header">

    </div>
    <!-- end #header -->
    <div id="menu">

    </div>
    <!-- end #menu -->
    <div id="content">
        <div>
            <div class="post">
                <form:form method="post" enctype="multipart/form-data">
                    <fieldset>
                        <legend>第1張圖片</legend>
                        <div>
                            <p>請使用JPEG檔</p>
                            <p>${errorMsg.typeE}</p>
                        </div>
                        <div>
                            <img src="<c:url value='/houseView/hPic/${picId0}'/>" accept="image/jpeg" width="150" />
                            <label for="0">上傳圖片：</label>
                            <input type="file" class="file" accept="image/jpeg" name="pic"
                                id="0">${errorMsg.pic0None}*將作為封面
                            <input type="hidden" name="picNo" value="0">
                        </div>
                        ${errorMsg.typeE}
                        <input type="submit" class="medium green" value="上傳">
                    </fieldset>
                </form:form>
                <c:forEach var="i" begin="1" end="9">
                    <form:form method="post" enctype="multipart/form-data">
                        <fieldset>
                            <legend>第${i+1}張圖片</legend>
                            <div>
                                <img src="<c:url value='/houseView/hPic/${picIds[i]}'/>" accept="image/jpeg" width="150" alt="未上傳圖片" />
                                <label for="${i}">上傳圖片：</label>
                                <input type="file" name="pic" class="file" id="${i}">
                                <input type="hidden" name="picNo" value="${i}">
                            </div>
                            ${errorMsg.typeE}
                            <input type="submit" class="medium green" value="上傳">
                        </fieldset>
                    </form:form>
                </c:forEach>

            </div>
        </div>
        <!-- end #posts -->
        <div id="links">

        </div>
        <!-- end #links -->
        <div style="clear: both;">&nbsp;</div>
    </div>
    <!-- end #content -->
    <div id="footer">
        <!-- <p id="legal">Copyright &copy; Logistix. Designed by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>
				</p> -->
    </div>
    <!-- end #footer -->

</body>

</html>