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

<div class="col-lg-6 offset-3">
    <h5 class="section-title position-relative text-uppercase mb-3"><span
            class="bg-secondary pr-3">Order cancellation confirmation</span></h5>
    <div class="bg-light p-30 mb-5">
        <div class="border-bottom">
            <div class="row m-0">
                    <div class="alert alert-danger">
                        <strong>Note.</strong> This will cancel all products in the order and cannot be undone
                    </div>
            </div>
        </div>
        <div class="border-bottom pt-3 pb-2 row ">
                <h6 class="mb-3">Please select a reason to cancel the order.</h6>
            <div class="col-7 mb-3">
                <div class="form-group">
                    <input type="radio" name="orderCancel">
                    <label>Want to enter/change Voucher</label>
                </div>
                <div class="form-group">
                    <input type="radio" name="orderCancel">
                    <label>Want to change your shipping address?</label>
                </div>
                <div class="form-group">
                    <input type="radio" name="orderCancel">
                    <label>Find cheaper products elsewhere</label>
                </div>
                <div class="form-group">
                    <input type="radio" name="orderCancel">
                    <label>Change my mind and don't buy anymore</label>
                </div>
                <div class="form-group">
                    <input type="radio" name="orderCancel">
                    <label>Other</label>
                </div>
            </div>
            <div class="col-5 border-left">
                <div class="bg-light p-30 mb-2">
                    <div><strong>Order ID:</strong> ${ordId.id }</div>
                    <div><strong>Name:</strong> ${ordId.account.fullname }</div>
                    <div><strong>Email:</strong> ${ordId.account.email }</div>
                    <div><strong>Address:</strong> ${ordId.address }</div>
                    <div><strong>Create Date:</strong>
                        <fmt:formatDate type="both" value="${ordId.createDate}" dateStyle="medium" timeStyle="medium"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="pt-2">
            <div class="d-flex justify-content-end mt-2">
                <div class="" >
                    <a href="/home/myOrder" class="btn btn-success mr-2" style="font-size: 20px">Not now</a>
                    <a href="/home/myOrder/delete/${ordId.id}" class="btn btn-danger" style="font-size: 20px">CANCEL</a>
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


