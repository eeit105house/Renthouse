<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/login/js/jquery-tablepage-1.0.js"></script>
<table class="table table-striped" id="tbl">
  <thead>
    <tr>
      <th scope="col">標題</th>
      <th scope="col">分類</th>
      <th scope="col">日期</th>
       <th scope="col">狀態</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="mail" items="${allmail }">
    <tr>
    <c:choose>
    <c:when test="${mail.status=='已讀' }">
      <td><a href="<spring:url value='/membercontrol/memberservice/memberservicedetail/${mail.id }'/>">${mail.title }</a></td>
     </c:when>
     <c:otherwise>
      <td>${mail.title }</td>
     </c:otherwise>
     </c:choose>
	<td>${mail.type }</td>
      <td>${mail.datetime }</td>
      <td>${mail.status }</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
    <span id='table_page'></span>
    <script>$("#tbl").tablepage($("#table_page"), 10);</script>
</body>
</html>