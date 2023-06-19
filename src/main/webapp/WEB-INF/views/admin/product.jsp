<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- cSpell:ignore: taglib -->
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ProductController</title>

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
            <h2>LIST OF PRODUCTS</h2>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Product</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <div class="card">
              <div class="card-header">
                <a href="product-form" class="btn btn-primary">
                  Add new product
                </a>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Id</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>CreateDate</th>
                    <th>Category</th>
                    <th>Available</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="item" items="${products}">
                    <tr>
                      <td>${item.id}</td>
                      <td class ="px-0 m-0 text-center"  style="width:10%;">
                        <img src="/template/admin/dist/img/products/${item.image}" alt="" width="50%" class="img-fluid">
                      </td>
                      <td>${item.name}</td>
                      <td>
                        <fmt:formatNumber value="${item.price}" type="currency" pattern="###,###.##"/>
                      </td>
                      <td>${item.createDate}</td>
                      <td>${item.category.name}</td>
                      <td>${item.available}</td>
                      <td class="d-flex justify-content-around">
                        <a class='btn btn-warning btn-xs' style="font-size: 16px; width: 40px" href="product/edit/${item.id}">
                          <span class="glyphicon glyphicon-edit"><i class="fas fa-edit"></i></span></a>
                        <a href="/admin/product/delete/${item.id}" style="font-size: 16px;width: 40px" class="btn btn-danger btn-xs">
                          <span class="glyphicon glyphicon-remove"><i class="fas fa-trash-alt"></i></span>
                        </a>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <!--  footer  -->
  <%@ include file="/common/admin/footer.jsp" %>

</body>
</html>
