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
                    <a class="breadcrumb-item text-dark" href="#">Home</a>
                    <a class="breadcrumb-item text-dark" href="#">Shop</a>
                    <span class="breadcrumb-item active">Order Detail</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Cart Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-3">
                    <thead class="thead-dark">
                        <tr>
                            <th>No.</th>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <c:set var="i" value="0"/>
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td class="align-middle">${i=i+1}</td>
                            <td class="align-middle">${item.product.name}</td>
                            <td class="align-middle"><fmt:formatNumber value="${item.price}" type="currency" pattern="###,###.## VND"/></td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <input type="text" name="qty" class="form-control form-control-sm bg-secondary border-0 text-center" value="${item.quantity}">
                                </div>
                            </td>
                            <td class="align-middle">
                                <fmt:formatNumber value="${item.price * item.quantity}" type="currency" pattern="###,###.## VND"/>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="mb-30 mt-10">
                    <div class="input-group d-flex justify-content-end">
                        <div class="input-group-append ">
                            <a href="/home/shop" class="btn btn-primary">CONTINUE SHOPPING</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title text-uppercase mb-3 alert alert-success ">
                    <span class="alert-success pr-3">Order Successfully!</span></h5>
                <div class="bg-light p-30 mb-2">
                    <div><strong>Order ID:</strong> ${order.id }</div>
                    <div><strong>Name:</strong> ${order.account.fullname }</div>
                    <div><strong>Email:</strong> ${order.account.email }</div>
                    <div><strong>Address:</strong> ${order.address }</div>
                    <div><strong>Create Date:</strong>
                        <fmt:formatDate type="both" value="${order.createDate}" dateStyle="medium" timeStyle="medium"/>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3"></span></h5>
                <div class="bg-primary p-30 mb-5">
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h3 class="">Total:</h3>
                            <c:set var="total" value="${0}"/>
                            <c:forEach var="item" items="${items}">
                                <c:set var="total" value="${total+(item.price*item.quantity)}"/>
                            </c:forEach>
                            <h3 class=""><fmt:formatNumber value="${total}" type="currency" pattern="###,###.## VND"/></h3>
                        </div>
                    </div>
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