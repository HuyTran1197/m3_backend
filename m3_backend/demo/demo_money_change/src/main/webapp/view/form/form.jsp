<%--
  Created by IntelliJ IDEA.
  User: tranvanphathuy
  Date: 28/11/25
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="/converter">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <button>Converter</button>
</form>
<h2>Rate= ${rate}</h2>
<h2>USD= ${usd}</h2>
<h2>VND= ${vnd}</h2>
</body>
</html>
