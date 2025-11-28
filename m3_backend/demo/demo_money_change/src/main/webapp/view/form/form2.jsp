<%--
  Created by IntelliJ IDEA.
  User: tranvanphathuy
  Date: 28/11/25
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Calculate</title>
    <c:import url="../layout/library.jsp"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">

            <!-- Card tổng -->
            <div class="card shadow-sm border-primary">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">Simple Calculate</h4>
                </div>
                <div class="card-body">

                    <!-- Form -->
                    <form action="/calculate" class="mb-3">

                        <div class="mb-3">
                            <label class="form-label">Calculator</label>
                            <input name="n1" type="number" class="form-control mb-2" placeholder="First operand" required>
                        </div>

                        <div class="mb-3">
                            <select name="choice" class="form-select mb-2" required>
                                <option value="addition">addition</option>
                                <option value="substraction">substraction</option>
                                <option value="multip">multip</option>
                                <option value="divide">divide</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <input name="n2" type="number" class="form-control mb-2" placeholder="Second operand" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Calculate</button>
                    </form>

                    <!-- Hiển thị kết quả -->
                    <div class="mt-3 text-center">
                        <h5>Result = ${result}</h5>
                        <c:if test="${not empty invalid}">
                            <div class="text-danger fw-bold">---${invalid}---</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
