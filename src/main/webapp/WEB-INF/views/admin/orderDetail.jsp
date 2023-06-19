<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- cSpell:ignore: taglib -->
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OrderController</title>

    <!-- head link -->
    <%@ include file="/common/admin/head.jsp" %>
    <!-- /.head link -->
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <%@ include file="/common/admin/navbar.jsp" %>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->

    <%@ include file="/common/admin/aside.jsp" %>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h5>ORDER DETAIL</h5>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">OrderDetail</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <div class="invoice p-3 mb-3 row">
            <!-- Table row -->
            <div class="col table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>DetailId</th>
                            <th style="width: 192px">Image</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${orderDetails}">
                            <tr>
                                <td>${item.id}</td>
                                <td>
                                    <img src="/template/admin/dist/img/products/${item.product.image}" alt="" width="30%" class="img-fluid">
                                </td>
                                <td>${item.product.name}</td>
                                <td>
                                    <fmt:formatNumber value="${item.product.price}" type="currency" pattern="###,###.##"/>
                                </td>
                                <td>${item.quantity}</td>
                                <td>
                                    <fmt:formatNumber value="${item.price * item.quantity}" type="currency" pattern="###,###.##"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            <!-- /.Table row -->
            <!-- Customer information-->
            <div class="col col-sm col-md-4 d-flex align-items-stretch flex-column" style="height: 272px;">
                <div class="card bg-light d-flex flex-fill">
                    <div class="card-header text-muted border-bottom-0">
                        Customer Info
                    </div>
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-7">
                                <h2 class="lead"><b>${ord.account.fullname}</b></h2>
                                <p class="text-muted text-sm"><b>Id: </b>${ord.account.username}</p>
                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> Address: ${ord.address}</li>
                                    <li class="small"><span class="fa-li"><i class="far fa-envelope"></i></span> Email: ${ord.account.email}</li>
                                </ul>
                            </div>
                            <div class="col-5 text-center">
                                <img src="/template/admin/dist/img/users/${ord.account.photo}" alt="user-avatar" class="img-circle img-fluid">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-between">
                            <div >OrderId: ${ord.id}</div>
                            <div>Order date: <fmt:formatDate type="both" value="${ord.createDate}" dateStyle="medium" timeStyle="medium"/></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.Customer information -->
        </div>
            <!-- Total price -->
            <div class="row">
                <div class="offset-6">
                    <div class="table-responsive">
                        <table class="table">
                            <tr style="font-size: 18px">
                                <th>Total:</th>
                                <c:set var="total" value="${0}"/>
                                <c:forEach var="item" items="${orderDetails}">
                                    <c:set var="total" value="${total+(item.price*item.quantity)}"/>
                                </c:forEach>
                                <th>${total}</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.Total price -->
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--  footer  -->
    <%@ include file="/common/admin/footer.jsp" %>

</body>
</html>
