<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <h4 class="mb-0">Product Detail</h4>
        </div>

        <div class="card-body p-4">
          <!-- Nếu product null -->
          <c:if test="${productDto == null}">
            <div class="alert alert-danger text-center">
              Product not found!
            </div>
          </c:if>
          <!-- Nếu product tồn tại -->
          <c:if test="${productDto != null}">
            <table class="table table-bordered">
              <thead class="table-light">
              <tr>
                <th>Id</th>
                <th>Category</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
              </tr>
              </thead>
              <tr>
                <td>${productDto.getId()}</td>
                <td>${productDto.getCategoryName()}</td>
                <td>${productDto.getName()}</td>
                <td>${productDto.getDescription()}</td>
                <td>${productDto.getPrice()}</td>
              </tr>
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
