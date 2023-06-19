<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- cSpell:ignore: taglib -->
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="icon" type="image/png" sizes="16x16" href="/template/user/img/cr7-logo.png" style="border-radius: 50%">
    <title>CR7 SHOP - Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">


    <%@ include file="/common/user/headLink.jsp" %>

</head>

<body>

<%@ include file="/common/user/header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-3 ">
            <div class="list-group ">
                <a href="#" class="list-group-item list-group-item-action active">Setting</a>
                <a href="#" data-toggle="modal" data-target="#myModalChangePass" class="list-group-item list-group-item-action">Change Password</a>
                <a href="#" data-toggle="modal" data-target="#myModalForgotPass" class="list-group-item list-group-item-action">Forgot Password</a>
            </div>
        </div>
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="row ml-1">
                        <h4>Your Profile</h4>
                        <img src="/template/admin/dist/img/users/${userInfo.photo}"
                             alt="image user" class="photo-user rounded-circle" style="opacity: .8; max-height: 36px">
                    </div>
                    <hr>
                    <div class="">
                        <div class="">
                            ${MESSAGEUpdate}
                            <form action="/home/update-account" method="post" class="row" enctype="multipart/form-data">
                                <div class="col-md-4">
                                    <img class="img-fluid w-100 pt-3" src="/template/admin/dist/img/users/${userInfo.photo}" alt="">
                                    <div class="form-group">
                                        <input type="file" class="mt-2" id="photo" name="photo" placeholder="photo"/>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group ">
                                        <label for="username" class="col-4 col-form-label">User Name*</label>
                                        <div class="col-12">
                                            <input id="username" name="username" value="${userInfo.username}" class="form-control here" required="required" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="name" class="col-4 col-form-label">Full Name</label>
                                        <div class="col-12">
                                            <input id="name" name="fullname" value="${userInfo.fullname}" class="form-control here" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="email" class="col-4 col-form-label">Email*</label>
                                        <div class="col-12">
                                            <input id="email" name="email" value="${userInfo.email}" class="form-control here" required="required" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-8">
                                            <button name="submit" type="submit" class="btn btn-primary">Update My Profile</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- The Modal Change Password -->
<div class="modal fade" id="myModalChangePass">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Change Password <span class="text-danger">|${MESSAGE}</span></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="/home/change-pass" method="post">
                    <input name="username" type="hidden" value="${sessionScope.currentUser.username}">
                    <div class="form-group row">
                        <label class="col-4 col-form-label">Current Pass</label>
                        <div class="col-8">
                            <input id="currentPass" name="currentPass" class="form-control here" type="text">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-4 col-form-label">New Password</label>
                        <div class="col-8">
                            <input id="newPass" name="newPass" class="form-control here" type="text">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-4 col-form-label">Confirm New Password</label>
                        <div class="col-8">
                            <input id="cfmNewPass" name="cfmNewPass"  class="form-control here" type="text">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-4 col-8">
                            <button name="submit" type="submit" class="btn btn-primary">Update Change Password</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- The Modal Change Password End -->
<!-- The Modal Forgot Password -->
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
<!-- The Modal Forgot Password End -->
<%@ include file="/common/user/footer.jsp" %>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<%@ include file="/common/user/footLink.jsp" %>

</body>

</html>