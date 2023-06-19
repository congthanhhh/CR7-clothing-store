<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- cSpell:ignore: taglib -->
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Account form</title>

    <!-- head link -->
    <%@ include file="/common/admin/head.jsp" %>
    <!-- /.head link -->
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <%@ include file="/common/admin/aside.jsp" %>

    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <div class="col-6 offset-3 pt-md-5">
        <form:form name="qryform" id="qryform" action="/admin/category"
                   class="px-3" modelAttribute="item">
            <div class="card">
                <div class="card-header">
                    <h3 class="alert alert-info">
                        Category Form <a href="/admin/category"
                                         class="btn btn-success float-right text-decoration-none">Category List</a>
                    </h3>
                    <div class="bg-success text-light px-3">${message }</div>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <form:input type="text" class="form-control" id="id" path="id"
                                    aria-describedby="idHid" placeholder="Category ID"/>
                        <small id="idHid" class="form-text text-muted">Category
                            ID is invalid</small>
                    </div>
                    <div class="form-group">
                        <form:input type="text" class="form-control" id="name"
                                    path="name" aria-describedby="nameHid"
                                    placeholder="Category Name"/>
                        <small id="nameHid" class="form-text text-muted">Category
                            name is invalid</small>
                    </div>
                </div>
                <div class="card-footer text-muted">
                    <button type="submit" class="btn btn-primary"
                            formaction="/admin/category/create">Insert
                    </button>
                    <button type="submit" class="btn btn-warning"
                            formaction="/admin/category/update">Update
                    </button>
                    <button type="submit" class="btn btn-danger"
                            formaction="/admin/category/delete/${item.id}"><i class="fas fa-trash-alt"></i>
                    </button>
                    <button type="submit" class="btn btn-success"
                            formaction="/admin/category-form">Reset
                    </button>
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


