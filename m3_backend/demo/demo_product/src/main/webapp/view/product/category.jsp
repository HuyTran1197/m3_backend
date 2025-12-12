<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Product Detail</title>
    <c:import url="../layout/library.jsp"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg border-0 rounded-3">
                <div class="card-header bg-primary text-white text-center py-3 rounded-top">
                    <h4 class="mb-0">Category List</h4>
                </div>

                <div class="card-body p-4">
                    <!-- Nếu category null -->
                    <c:if test="${showCategory == null}">
                        <div class="alert alert-danger text-center">
                            Product not found!
                        </div>
                    </c:if>
                    <!-- Nếu category tồn tại -->
                    <c:if test="${showCategory != null}">
                        <table class="table table-bordered">
                            <thead class="table-light">
                            <tr>
                                <th>Id</th>
                                <th>Category</th>
                                <th>Products</th>
                            </tr>
                            </thead>
                            <c:forEach var="ctg" items="${showCategory}">
                                <tr>
                                    <td>${ctg.getId()}</td>
                                    <td>${ctg.getName()}</td>
                                    <c:forEach var="p" items="${ctg.getProductList()}">
                                        <td>${p.getName()}</td>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </table>
                        <div class="text-center mt-4">
                            <a href="/products" class="btn btn-danger btn-sm px-4">Back to list</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
