
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- cSpell:ignore taglib -->
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="icon" type="image/png" sizes="16x16" href="/template/user/img/cr7-logo.png">
    <title>CR7 SHOP - Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <%@ include file="/common/user/headLink.jsp" %>

</head>

<body>

<%@ include file="/common/user/header.jsp" %>

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="/home/index">Home</a>
                <a class="breadcrumb-item text-dark" href="/home/shop">Shop</a>
                <span class="breadcrumb-item active">My Order Detail</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Cart Start -->
<div class="container-fluid">
    <div class="row px-xl-5 justify-content-center">
        <div class="col-lg-10 table-responsive mb-5">
            <table class="table table-light table-borderless table-hover text-center mb-0">
                <thead class="thead-dark">
                <tr>
                    <th>No.</th>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:set var="i" value="0"/>
                <c:forEach var="item" items="${orderDetails}">
                    <tr>
                        <td class="align-middle">${i=i+1}</td>
                        <td class="align-middle"><img src="/template/admin/dist/img/products/${item.product.image}" alt="" style="width: 50px;"></td>
                        <td class="align-middle">${item.product.name}</td>
                        <td class="align-middle">
                            <fmt:formatNumber value="${item.price}" type="currency" pattern="###,###.## VND"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="mb-30">
        <div class="input-group d-flex justify-content-center">
            <div class="input-group-append mr-2">
                <a href="/home/myOrder" class="btn btn-primary">My Order</a>
            </div>
            <div class="input-group-append ml-2">
                <a href="/home/shop" class="btn btn-primary">CONTINUE SHOPPING</a>
            </div>
        </div>
    </div>
</div>
<!-- Cart End -->

<%@ include file="/common/user/footer.jsp" %>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<%@ include file="/common/user/footLink.jsp" %>

</body>


</html>


