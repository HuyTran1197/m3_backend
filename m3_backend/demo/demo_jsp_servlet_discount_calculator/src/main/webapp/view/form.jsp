<%--
  Created by IntelliJ IDEA.
  User: tranvanphathuy
  Date: 26/11/25
  Time: 09:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/display-discount" method="post">
    <text aria-placeholder="Product description"></text>
    <input name="price" placeholder="Enter price">
    <input name="discount" placeholder="enter discount percent">
    <button>Calculate Discount</button>
</form>
<h2>Discount = ${discount_amount}</h2>
<h2>Last Price = ${last_price}</h2>
</body>
</html>
