<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
    <c:import url="/layout/bootstrap.jsp"/>
</head>
<body>
<div class="container my-5">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h3 class="mb-0">Chỉnh sửa sản phẩm</h3>
        </div>
        <div class="card-body">
            <form action="/products?action=edit" method="post">
                <!-- ID ẩn -->
                <input type="hidden" name="id" value="${product.productId}">

                <!-- Đơn vị tính -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Đơn vị tính</label>
                    <select name="unitId" class="form-select ${not empty unitErr ? 'is-invalid' : ''}">
                        <option value="">-- Chọn đơn vị --</option>
                        <c:forEach var="unit" items="${categoryUnitList}">
                            <option value="${unit.id}" ${unit.id == unitId ? 'selected' : ''}>${unit.name}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${not empty unitErr}">
                        <div class="invalid-feedback">${unitErr}</div>
                    </c:if>
                </div>

                <!-- Loại hàng -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Loại hàng</label>
                    <select name="typeId" class="form-select ${not empty typeErr ? 'is-invalid' : ''}">
                        <option value="">-- Chọn loại --</option>
                        <c:forEach var="type" items="${categoryTypeList}">
                            <option value="${type.id}" ${type.id == typeId ? 'selected' : ''}>${type.name}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${not empty typeErr}">
                        <div class="invalid-feedback">${typeErr}</div>
                    </c:if>
                </div>

                <!-- Tên sản phẩm -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Tên sản phẩm</label>
                    <input type="text" name="name" value="${name}"
                           class="form-control ${not empty nameErr ? 'is-invalid' : ''}" placeholder="Nhập tên sản phẩm">
                    <c:if test="${not empty nameErr}">
                        <div class="invalid-feedback">${nameErr}</div>
                    </c:if>
                </div>

                <!-- Giá -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Giá</label>
                    <input type="number" name="price" value="${price}"
                           class="form-control ${not empty priceErr ? 'is-invalid' : ''}" placeholder="Nhập giá sản phẩm">
                    <c:if test="${not empty priceErr}">
                        <div class="invalid-feedback">${priceErr}</div>
                    </c:if>
                </div>

                <!-- Ngày thu hoạch -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Ngày thu hoạch</label>
                    <input type="date" name="date" value="${date}"
                           class="form-control ${not empty dateErr ? 'is-invalid' : ''}">
                    <c:if test="${not empty dateErr}">
                        <div class="invalid-feedback">${dateErr}</div>
                    </c:if>
                </div>

                <!-- Nút xác nhận -->
                <button type="submit" class="btn btn-success w-100 fw-bold">
                    Cập nhật sản phẩm
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
