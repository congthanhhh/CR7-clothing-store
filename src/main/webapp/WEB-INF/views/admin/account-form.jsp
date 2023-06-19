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
            <form:form name="qryform" id="qryform" action="/admin/account"
                       class="px-3" modelAttribute="item" enctype="multipart/form-data">
                <div class="card">
                    <div class="card-header">
                        <h3 class="alert alert-info">
                            Account Control <a href="/admin/account"
                                               class="btn btn-success float-right text-decoration-none">Account List</a>
                        </h3>
                        <div class="bg-success text-light px-3">${message}</div>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-6">
                                <div class="form-group">
                                    <form:input type="text" class="form-control" id="username"
                                                path="username" aria-describedby="usHid"
                                                placeholder="Username"/>
                                    <small id="usHid" class="form-text text-muted">Username
                                        ID is invalid</small>
                                </div>
                                <div class="form-group">
                                    <form:input type="password" class="form-control" id="password"
                                                path="password" aria-describedby="passHid"
                                                placeholder="Password"/>
                                    <small id="passHid" class="form-text text-muted">Password
                                        is invalid</small>
                                </div>
                                <div class="form-group">
                                    <form:input type="file" class="form-control" id="photo"
                                                path="photo" aria-describedby="photoHid" placeholder="photo"/>
                                    <small id="photoHid" class="form-text text-muted">photo
                                        is invalid</small>
                                </div>
                                <div class="form-group">
                                    Activity:
                                    <form:radiobuttons class="mx-2" path="activated"
                                                       items="${activatedItem}" delimiter=""/>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <form:input type="text" class="form-control" id="fullname"
                                                path="fullname" aria-describedby="fullnameHid"
                                                placeholder="fullname"/>
                                    <small id="fullnameHid" class="form-text text-muted">Fullname
                                        is invalid</small>
                                </div>
                                <div class="form-group">
                                    <form:input type="email" class="form-control" id="email"
                                                path="email" aria-describedby="emailHid" placeholder="email"/>
                                    <small id="emailHid" class="form-text text-muted">Email
                                        is invalid</small>
                                </div>
                                <div class="form-group">
                                    Role:
                                    <form:radiobuttons class="mx-2" path="admin"
                                                       items="${adminItem}" delimiter=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-muted">
                        <button type="submit" class="btn btn-primary "
                                formaction="/admin/account/create">Insert
                        </button>
                        <button type="submit" class="btn btn-warning"
                                formaction="/admin/account/create">Update
                        </button>
                        <button type="submit" class="btn btn-danger"
                                formaction="/admin/account/delete/${item.username}">Delete
                        </button>
                        <button type="submit" class="btn btn-success"
                                formaction="/admin/account-form">Reset
                        </button>
                    </div>
                </div>
            </form:form>
        </div>
        <%--        old form--%>
    </div>
    <!-- /.content-wrapper -->
    <!--  footer  -->
    <%@ include file="/common/admin/footer.jsp" %>

</body>
</html>


