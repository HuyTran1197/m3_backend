<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Quản lý sản phẩm</title>
    <c:import url="/layout/bootstrap.jsp"/>
</head>
<body>
<div class="container mt-5">
    <div class="table-responsive shadow p-3 mb-5 bg-white rounded">
        <h1 class="h3">Quản lý sản phẩm rau củ quả</h1>
        <a href="/products?action=add" class="btn btn-success">Thêm mới sản phẩm</a>
        <form action="/products" method="get" style="float: right">
            <input hidden="hidden" name="action" value="search"/>
            <input name="name" placeholder="nhập tên hàng hóa" value="${name}"/>
            <input name="price" placeholder="nhập giá hàng hóa" value="${price}"/>
            <c:if test="${not empty priceErr}">
                <div class="invalid-feedback">${priceErr}</div>
            </c:if>
            <select name="type">
                <option value="">-- Chọn loại hàng --</option>
                <c:forEach var="type" items="${categoryTypeList}">
                    <option value="${type.id}">
                            ${type.name}
                    </option>
                </c:forEach>
            </select>
            <button>Tìm kiếm</button><br>
            <a href="/products" style="float: right" class="btn btn-dark">Quay lại</a>
        </form>
        <c:if test="${not empty param.mess}">
            <div class="alert alert-info">${param.mess}</div>
        </c:if>
        <table class="table table-striped table-bordered align-middle">
            <thead class="table-primary">
            <tr>
                <th>Mã hàng hóa</th>
                <th>Tên hàng hóa</th>
                <th>Đơn vị tính</th>
                <th>Giá</th>
                <th>Loại hàng</th>
                <th>Ngày thu hoạch</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${productDtoList}">
                <tr>
                    <td>${product.getProductId()}</td>
                    <td>${product.getName()}</td>
                    <td>${product.getProductsUnit()}</td>
                    <td>${product.getPrice()}</td>
                    <td>${product.getProductsType()}</td>
                    <td>${product.getDate()}</td>
                    <td>
                        <a href="/products?action=edit&id=${product.productId}" class="btn btn-dark btn-sm me-1">
                            Chỉnh sửa
                        </a>
                        <button type="button" class="btn btn-danger btn-sm"
                                data-bs-toggle="modal" data-bs-target="#deleteModal"
                                onclick="getInfoToDelete('${product.productId}','${product.name}')">
                            Xóa
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal xóa -->
<%--<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <form action="/products?action=delete" method="post">--%>
<%--                <div class="modal-header bg-danger text-white">--%>
<%--                    <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>--%>
<%--                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--                    <input type="hidden" id="deleteId" name="id">--%>
<%--                    <p>Bạn chắc chắn muốn xóa sản phẩm <strong id="deleteName"></strong> không?</p>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>--%>
<%--                    <button type="submit" class="btn btn-danger">Xóa</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="modal fade" id="deleteModal">
    <div class="modal-dialog">
        <form class="modal-content" action="/products?action=delete" method="post">
            <input type="hidden" id="deleteId" name="id">
            <div class="p-3">
                <p>Xóa <b id="deleteName"></b>?</p>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-danger">Xóa</button>
            </div>
        </form>
    </div>
</div>
<!-- Modal thông báo ngắn gọn -->
<div class="modal" id="messModal">
    <div class="modal-dialog">
        <div class="modal-content p-3 text-center">
            <p class="text-${messType}">${mess}</p>
            <button data-bs-dismiss="modal">Đóng</button>
        </div>
    </div>
</div>

<c:if test="${not empty mess}">
    <script>new bootstrap.Modal(document.getElementById('messModal')).show();</script>
</c:if>

<script>
    function getInfoToDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").textContent = name;
    }
</script>
</body>
</html>
