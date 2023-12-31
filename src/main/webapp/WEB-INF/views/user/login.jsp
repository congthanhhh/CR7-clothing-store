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
                <div class="main-div">
                    <div class="panel">
                        <a href="" class="text-decoration-none">
                            <span class="h5 text-uppercase text-primary bg-dark px-2">CR7</span>
                            <span class="h5 text-uppercase text-dark bg-primary px-2 ml-n1">Login</span>
                        </a>
                        <p>Please enter your username and password</p>
                    </div>
                    <form id="Login" action="/home/login" method="post">

                        <div class="form-group">
                            <input type="text" name="username" class="form-control" id="inputEmail"
                                   placeholder="Username" required="required">

                        </div>

                        <div class="form-group">
                            <input type="password" name="password" class="form-control" id="inputPassword"
                                   placeholder="Password" required="required">

                        </div>
                        <div style="font-size: 14px">
                            <div class="text-left">
                                <input type="checkbox" name="remember"><label>Remember</label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                        <div class="forgot">
                            <a href="/home/register">Create account</a>
                        </div>
                        <div class="forgot">
                            <a href="#" data-toggle="modal" data-target="#myModalForgotPass">Forgot password</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModalForgotPass">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Forgot Password <span class="text-danger">|${MESSAGEMail}</span></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="/home/forgot-pass" method="post">
                            <div class="form-group row">
                                <label class="col-4 col-form-label">Username</label>
                                <div class="col-8">
                                    <input id="userPass" name="username" class="form-control here" type="text">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-4 col-form-label">Email</label>
                                <div class="col-8">
                                    <input id="forGotPass" name="email" class="form-control here" type="email">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="offset-4 col-8">
                                    <button name="submit" type="submit" class="btn btn-primary">Send To Email</button>
                                </div>
                            </div>
                        </form>
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