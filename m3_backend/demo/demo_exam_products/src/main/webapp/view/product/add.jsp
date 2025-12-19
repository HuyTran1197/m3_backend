<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm mới sản phẩm</title>
    <c:import url="/layout/bootstrap.jsp"/>
</head>
<body>
<div class="container mt-4">
    <h3 class="mb-4">Thêm mới sản phẩm</h3>

    <form action="/products?action=add" method="post">

        <!-- ID -->
        <div class="mb-3">
            <label class="form-label">Mã hàng hóa</label>
            <input type="text" name="id"
                   value="${id}"
                   class="form-control ${not empty idErr ? 'is-invalid' : ''}">
            <c:if test="${not empty idErr}">
                <div class="invalid-feedback">${idErr}</div>
            </c:if>
        </div>

        <!-- Đơn vị tính -->
        <div class="mb-3">
            <label class="form-label">Đơn vị tính</label>
            <select name="unitId"
                    class="form-select ${not empty unitErr ? 'is-invalid' : ''}">
                <option value="">-- Chọn đơn vị --</option>
                <c:forEach var="unit" items="${categoryUnitList}">
                    <option value="${unit.id}"
                        ${unit.id == unitId ? 'selected' : ''}>
                            ${unit.name}
                    </option>
                </c:forEach>
            </select>
            <c:if test="${not empty unitErr}">
                <div class="invalid-feedback">${unitErr}</div>
            </c:if>
        </div>

        <!-- Loại hàng -->
        <div class="mb-3">
            <label class="form-label">Loại hàng</label>
            <select name="typeId"
                    class="form-select ${not empty typeErr ? 'is-invalid' : ''}">
                <option value="">-- Chọn loại --</option>
                <c:forEach var="type" items="${categoryTypeList}">
                    <option value="${type.id}"
                        ${type.id == typeId ? 'selected' : ''}>
                            ${type.name}
                    </option>
                </c:forEach>
            </select>
            <c:if test="${not empty typeErr}">
                <div class="invalid-feedback">${typeErr}</div>
            </c:if>
        </div>

        <!-- Tên hàng -->
        <div class="mb-3">
            <label class="form-label">Tên hàng hóa</label>
            <input type="text" name="name"
                   value="${name}"
                   class="form-control ${not empty nameErr ? 'is-invalid' : ''}">
            <c:if test="${not empty nameErr}">
                <div class="invalid-feedback">${nameErr}</div>
            </c:if>
        </div>

        <!-- Giá -->
        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input name="price"
                   value="${price}"
                   class="form-control ${not empty priceErr ? 'is-invalid' : ''}">
            <c:if test="${not empty priceErr}">
                <div class="invalid-feedback">${priceErr}</div>
            </c:if>
        </div>

        <!-- Ngày thu hoạch -->
        <div class="mb-3">
            <label class="form-label">Ngày thu hoạch</label>
            <input type="date"
                   name="date"
                   value="${date}"
                   class="form-control ${not empty dateErr ? 'is-invalid' : ''}">
            <c:if test="${not empty dateErr}">
                <div class="invalid-feedback">
                        ${dateErr}
                </div>
            </c:if>
        </div>

        <button class="btn btn-primary">Xác nhận</button>
    </form>
</div>
</body>
</html>
