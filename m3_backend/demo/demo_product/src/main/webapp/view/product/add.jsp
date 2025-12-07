<%--
  Created by IntelliJ IDEA.
  User: tranvanphathuy
  Date: 29/11/25
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <c:import url="../layout/library.jsp"/>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Form add new product</h1>--%>
<%--<form action="/products?action=add" method="post">--%>
<%--    Name: <input name="name">--%>
<%--    <c:if test="${not empty nameErr}">--%>
<%--        <div style="color: red">${nameErr}</div>--%>
<%--    </c:if><br>--%>
<%--    Description: <input name="description">--%>
<%--    <c:if test="${not empty desErr}">--%>
<%--        <div style="color: red">${desErr}</div>--%>
<%--    </c:if><br>--%>
<%--    Price: <input name="price">--%>
<%--    <c:if test="${not empty priceErr}">--%>
<%--        <div style="color: red">${priceErr}</div>--%>
<%--    </c:if>--%>
<%--    <br>--%>
<%--    <button>Submit</button>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add New Product</title>
    <c:import url="../layout/library.jsp"/>  <!-- Thư viện Bootstrap -->
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-sm border-0">
                <div class="card-body p-4">

                    <h3 class="text-center mb-4">Add New Product</h3>

                    <form action="/products?action=add" method="post">
                        <div class="mb-3">
                            <label class="form-label">CategoryId</label>
                            <input
                                    type="text"
                                    name="categoryIdStr"
                                    class="form-control ${not empty categoryErr ? 'is-invalid' : ''}"
                                    value="${categoryIdStr}"
                            >
                            <c:if test="${not empty categoryErr}">
                                <div class="invalid-feedback">
                                        ${categoryErr}
                                </div>
                            </c:if>
                        </div>
                        <!-- NAME -->
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input
                                    type="text"
                                    name="name"
                                    class="form-control ${not empty nameErr ? 'is-invalid' : ''}"
                                    value="${name}"
                            >
                            <c:if test="${not empty nameErr}">
                                <div class="invalid-feedback">
                                        ${nameErr}
                                </div>
                            </c:if>
                        </div>

                        <!-- DESCRIPTION -->
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <input
                                    type="text"
                                    name="description"
                                    class="form-control ${not empty desErr ? 'is-invalid' : ''}"
                                    value="${description}"
                            >
                            <c:if test="${not empty desErr}">
                                <div class="invalid-feedback">
                                        ${desErr}
                                </div>
                            </c:if>
                        </div>

                        <!-- PRICE -->
                        <div class="mb-3">
                            <label class="form-label">Price</label>
                            <input
                                    type="text"
                                    name="price"
                                    class="form-control ${not empty priceErr ? 'is-invalid' : ''}"
                                    value="${price}"
                            >
                            <c:if test="${not empty priceErr}">
                                <div class="invalid-feedback">
                                        ${priceErr}
                                </div>
                            </c:if>
                        </div>

                        <!-- BUTTON -->
                        <button class="btn btn-primary w-100">Submit</button>
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>

