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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" /> <!-- KICKSTART -->
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
    <div class="col_7">
        <form:form method="post" enctype="multipart/form-data">
            <fieldset>
            <legend>上傳圖片</legend>
                <div>
                    <label for="0">第1張圖片：</label>
                    <input type="file" class="file" name="pic0" id="0">${errorMsg.pic0None}*將作為封面<br>

                    <c:forEach var="i" begin="2" end="10">
                        <label for="${i}">第${i}張圖片：</label>
                        <input type="file" name="pics" class="file" id="${i}">
                        <br>
                    </c:forEach>
                </div>
                ${errorMsg.typeE}
                <input type="submit" class="medium green" value="送出">
            </fieldset>
        </form:form>
    </div>
</body>

</html>