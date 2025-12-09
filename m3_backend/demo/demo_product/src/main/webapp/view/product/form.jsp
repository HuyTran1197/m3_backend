<%--
  Created by IntelliJ IDEA.
  User: tranvanphathuy
  Date: 29/11/25
  Time: 20:37
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
        <h1 class="text-center fw-bold mb-4">Product Management</h1>
        <a class="btn btn-sm btn-success" href="/products?action=add">Add new product</a>
        <h2>${param.mess}</h2>
        <table class="table table-bordered align-middle">
            <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
            </tr>
            </thead>
            <c:forEach var="product" items="${productList}" varStatus="status">
                <tr>
                    <td>${product.getId()}</td>
                    <td>${product.getName()}</td>
                    <td>${product.getPrice()}</td>
                    <td>
                        <button onclick="getInfoToDelete('${product.id}','${product.name}')" type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Delete
                        </button>
                        <a href="/products?action=detail&id=${product.id}" class="btn btn-info btn-sm">
                            Detail
                        </a>
                        <a href="/products?action=edit&id=${product.id}" class="btn btn-dark btn-sm color-white">
                            Edit
                        </a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <c:if test="${productList.isEmpty()}">
                    <td colspan="3" class="text-center text-danger">
                        List Product Null
                    </td>
                </c:if>
            </tr>
        </table>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/products?action=delete" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" id="deleteId" name="deleteId">
                    <span id="deleteName" class="p-2"></span><span class="text-danger">Do you want to delete this product?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function getInfoToDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerHTML = "---"+name+"---";
    }
</script>
</html>
