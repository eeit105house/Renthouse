<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<table class="table table-striped">
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
      <td>${mail.title }</td>
      <td>${mail.type }</td>
      <td>${mail.datetime }</td>
      <td>${mail.status }</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
    <input type="hidden" id="herenow" value="customer"/> 
</body>
</html>