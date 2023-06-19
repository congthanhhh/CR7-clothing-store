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
                    <span class="breadcrumb-item active">Shopping Cart</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Cart Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <c:forEach var="item" items="${cart.items}">
                        <form action="/home/cart/update" method="get">
                            <input type="hidden" name="id" value="${item.id}">
                        <tr>
                            <td class="align-middle"><img src="/template/admin/dist/img/products/${item.image}" alt="" style="width: 50px;">${item.name}</td>
                            <td class="align-middle"><fmt:formatNumber value="${item.price}" type="currency" pattern="###,###.## VND"/></td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <a href="/home/cart/sub/${item.id}" class="btn btn-sm btn-primary btn-minus" >
                                            <i class="fa fa-minus"></i>
                                        </a>
                                    </div>
                                    <input type="text" name="qty" class="form-control form-control-sm bg-secondary border-0 text-center" value="${item.qty}" onblur="this.form.submit()">
                                    <div class="input-group-btn">
                                        <a href="/home/cart/add/${item.id}" class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </a>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle"><fmt:formatNumber value="${item.price * item.qty}" type="currency" pattern="###,###.## VND"/></td>
                            <td class="align-middle"><a href="/home/cart/remove/${item.id}" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></a></td>
                        </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <div class="mb-30">
                    <div class="input-group d-flex justify-content-around">
                        <div class="input-group-append ">
                            <a href="/home/shop" class="btn btn-primary">CONTINUE SHOPPING</a>
                        </div>
                        <div class="input-group-append">
                            <a href="/home/cart/clear" class="btn btn-primary">CLEAR CARD</a>
                        </div>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5><fmt:formatNumber value="${cart.amount}" type="currency" pattern="###,###.## VND"/></h5>
                        </div>

                        <c:choose>
                            <c:when test="${not empty sessionScope.currentUser}">
                                <a href="${pageContext.request.contextPath}/home/checkout" class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed To Checkout</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/home/login" class="btn btn-block btn-primary font-weight-bold my-3 py-3">Login</a>
                            </c:otherwise>
                        </c:choose>
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