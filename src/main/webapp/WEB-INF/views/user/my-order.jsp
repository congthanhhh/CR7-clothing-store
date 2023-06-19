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
        <span class="breadcrumb-item active">My Order</span>
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
          <th>Create Date</th>
          <th>Address</th>
          <th>Order Id</th>
          <th>Order Detail</th>
        </tr>
        </thead>
        <tbody class="align-middle">
        <c:set var="i" value="0"/>
        <c:forEach var="item" items="${items}">
            <tr>
              <td class="align-middle">${i=i+1}</td>
              <td class="align-middle">
                <fmt:formatDate type="both" value="${item.createDate}" dateStyle="medium" timeStyle="medium"/>
              </td>
              <td class="align-middle">${item.address}</td>
              <td class="align-middle">${item.id}</td>
              <td class="align-middle">
                <a href="/home/myOrderDetail?id=${item.id}"
                   class="btn btn-sm btn-outline-info">Order detail</a>
                <a href="/home/myOrder/deleteConfirm/${item.id}"
                   class="btn btn-sm btn-outline-danger"><i class="fas fa-trash-alt"></i></a>
              </td>
            </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <div class="col-lg">
    <div class="mb-30">
      <div class="input-group d-flex justify-content-around">
        <div class="input-group-append ">
          <a href="/home/shop" class="btn btn-primary">CONTINUE SHOPPING</a>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Cart End -->

<!-- The Modal Delete Order -->
<div class="modal fade" id="myModalOrder">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Delete Order</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <a href="#"
           class="btn btn-sm btn-outline-danger"
           data-toggle="modal" data-target="#myModalOrder"><i class="fas fa-trash-alt"></i></a>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<%@ include file="/common/user/footer.jsp" %>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<%@ include file="/common/user/footLink.jsp" %>

</body>


</html>