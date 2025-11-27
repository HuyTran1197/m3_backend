<%--
  Created by IntelliJ IDEA.
  User: tranvanphathuy
  Date: 27/11/25
  Time: 20:55
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
<div class="container mt-5">
    <div class="table-responsive shadow p-3 mb-5 bg-white rounded border-blue">
        <h1 class="text-center fw-bold mb-4">Student List</h1>
        <table class="table table-bordered align-middle">
            <thead class="table-light">
            <tr>
                <th>Name</th>
                <th>Birthday</th>
                <th>Address</th>
                <th>Face</th>
            </tr>
            </thead>
            <c:forEach var="student" items="${studentList}" varStatus="status">
                <tr>
                    <td>${student.getName()}</td>
                    <td>${student.getBirthday()}</td>
                    <td>${student.getAddress()}</td>
                    <td>
                        <img
                                src="
                    <c:choose>
                        <c:when test='${student.isGender()}'>
                            https://randomuser.me/api/portraits/men/${status.index % 50}.jpg
                        </c:when>
                        <c:otherwise>
                            https://randomuser.me/api/portraits/women/${(status.index % 50) + 50}.jpg
                        </c:otherwise>
                    </c:choose>
                "
                                class="img-fluid rounded"
                                style="max-width:80px;">
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
