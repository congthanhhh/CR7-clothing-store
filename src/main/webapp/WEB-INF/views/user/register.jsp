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

<!-- Contact Start -->
<div class="container-fluid">
    <div id="LoginForm">
        <div class="container">
            <div class="login-form">
                <div class="main-div" style="max-width: 60%;">
                    <div class="panel">
                        <a href="" class="text-decoration-none">
                            <span class="h5 text-uppercase text-primary bg-dark px-2">CR7</span>
                            <span class="h5 text-uppercase text-dark bg-primary px-2 ml-n1">Register</span>
                        </a>
                        <p class="text-info">${MESSAGE} <a href="/home/login">login now</a></p>
                    </div>
                    <form:form id="Login" modelAttribute="item"
                               action="/home/register/create" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <form:input path="username" type="text" name="username" class="form-control" placeholder="Username" required="required"/>
                            <form:errors path="username"/>
                        </div>
                        <div class="form-group">
                            <form:input path="password" type="password" name="password" class="form-control" placeholder="Password" required="required"/>
                            <form:errors path="password"/>
                        </div>
                        <div class="form-group">
                            <form:input path="fullname" type="text" name="fullname" class="form-control" placeholder="Fullname" required="required"/>
                            <form:errors path="fullname"/>
                        </div>
                        <div class="form-group">
                            <form:input path="email" type="email" name="email" class="form-control" placeholder="Email" required="required"/>
                            <form:errors path="email"/>
                        </div>
                        <div class="form-group" style="padding: 5px">
                            Image
                            <form:input type="file" id="photo" path="photo" placeholder="Choose your pictuter"/>
                        </div>

                        <button type="submit" class="btn btn-primary">Sign up</button>
                    </form:form>
                </div>
            </div>

        </div>


        <%@ include file="/common/user/footer.jsp" %>

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

        <%@ include file="/common/user/footLink.jsp" %>

</body>

</html>