<%--
  Created by IntelliJ IDEA.
  User: tranvanphathuy
  Date: 29/11/25
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout/library.jsp"/>
</head>
<body>
<h1>Form add new product</h1>
<form action="/products?action=add" method="post">
    Name: <input name="name">
    <c:if test="${not empty nameErr}">
        <h2 style="color: red">${nameErr}</h2>
    </c:if><br>
    Description: <input name="description">
    <c:if test="${not empty desErr}">
        <h2 style="color: red">${desErr}</h2>
    </c:if><br>
    Price: <input value="0" name="price"><br>
    <button>Submit</button>
</form>
</body>
</html>
