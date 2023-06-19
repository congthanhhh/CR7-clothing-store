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
        <div class="col-6 offset-3 pt-md-4">
            <form:form name="qryform" id="qryform" action="/admin/product"
                       class="px-3" modelAttribute="item" enctype="multipart/form-data">
                <div class="card">
                    <div class="card-header">
                        <h3 class="alert alert-info">
                            Product Control <a href="/admin/product"
                                               class="btn btn-success float-right text-decoration-none">Product List</a>
                        </h3>
                        <div class="bg-success text-light px-3">${message}</div>
                    </div>
                    <div class="card-body">
                        <div class="col row">
                            <div class="col-6">
                                <div class="form-group">
                                    <form:input type="text" class="form-control" id="id" name="id" path="id"
                                                 aria-describedby="usHid"
                                                placeholder="Product ID" readonly="true" />
                                    <small id="usHid" class="form-text text-muted">Product
                                        ID is invalid</small>
                                </div>
                                <div class="form-group">
                                    <form:input type="name" class="form-control" id="name"
                                                path="name" aria-describedby="nameHid"
                                                placeholder="Product Name" />
                                    <small id="nameHid" class="form-text text-muted">Product
                                        Name is invalid</small>
                                </div>
                                <div class="form-group">
                                    <form:input type="number" class="form-control" id="price"
                                                path="price" aria-describedby="priceHid" placeholder="Price" />
                                    <small id="priceHid" class="form-text text-muted">Price
                                        is invalid</small>
                                </div>
                                <div class="form-group">
                                    <form:input type="file" class="form-control" id="image"
                                                path="image" aria-describedby="imageHid" placeholder="image" />
                                    <small id="imageHid" class="form-text text-muted">Image
                                        is invalid</small>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <form:input type="date" class="form-control" id="createDate"
                                                disabled="true" path="createDate"
                                                aria-describedby="createDateHid" placeholder="createDate" />
                                    <small id="createDateHid" class="form-text text-muted">Create
                                        Date is invalid</small>
                                </div>
                                <div class="form-group ">
                                    Category:
                                    <form:select path="category" cssClass="form-control">
                                        <form:options items="${categories }" itemLabel="name" />
                                    </form:select>
                                </div>
                                <div class="form-group ">
                                    Available: <br />
                                    <form:radiobuttons class="mx-3 " path="available"
                                                       items="${availables }" delimiter="" />
                                </div>
                                    <!-- display image user-->
                                    <img src="/template/admin/dist/img/products/${item.image}" alt="" width="60%" class="img-fluid">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-muted">
                        <button type="submit" class="btn btn-primary "
                                formaction="/admin/product/create">Insert</button>
                        <button type="submit" class="btn btn-warning"
                                formaction="/admin/product/create">Update</button>
                        <button type="submit" class="btn btn-danger"
                                formaction="/admin/product/delete/${item.id}">Delete</button>
                        <button type="submit" class="btn btn-success"
                                formaction="/admin/product-form">Reset</button>
                    </div>
                </div>
            </form:form>
        </div>

    </div>
    <!-- /.content-wrapper -->
    <!--  footer  -->
    <%@ include file="/common/admin/footer.jsp" %>

</body>
</html>

