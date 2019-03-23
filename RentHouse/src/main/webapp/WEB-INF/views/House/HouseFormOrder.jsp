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
  <script src="${pageContext.request.contextPath}/HouseResorce/js/kickstart.js"></script> <!-- KICKSTART -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/HouseResorce/css/kickstart.css" media="all" />
  <!-- KICKSTART -->
  	<!-- house模板CSS	 -->
	<link href="${pageContext.request.contextPath}/HouseResorce/css/houseview/default.css" rel="stylesheet" type="text/css" />
  <title>選擇刊登方案</title>
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
        <form:form>
          <fieldset>
            <legend>請選擇付款方案</legend>
            <p>${errorMsg.orderE}</p>
            <c:forEach var="VipProject" items="${VipProjects}">
              <div>
                <input type="radio" name="vip" id="${VipProject.pNumber}" value="${VipProject.pNumber}">
                <label for="${VipProject.pNumber}">${VipProject.pName}</label>
                <p>${VipProject.pInfo}</p>
                <p>${VipProject.pPrice}元</p>
              </div>
            </c:forEach>
          </fieldset>
          <input type="submit" class="large green" value="前往付款">
        </form:form>
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