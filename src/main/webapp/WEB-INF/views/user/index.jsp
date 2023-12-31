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

<!-- Carousel Start -->
<div class="container-fluid mb-3">
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#header-carousel" data-slide-to="1"></li>
                    <li data-target="#header-carousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item position-relative active" style="height: 430px;">
                        <img class="position-absolute w-100 h-100" src="/template/user/img/carousel-1.jpg" style="object-fit: cover;">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Men
                                    Fashion</h1>
                                <p class="mx-md-5 px-5 animate__animated animate__bounceIn"></p>
                                <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                   href="/home/shop">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item position-relative" style="height: 430px;">
                        <img class="position-absolute w-100 h-100" src="/template/user/img/carousel-2.jpg" style="object-fit: cover;">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Women
                                    Fashion</h1>
                                <p class="mx-md-5 px-5 animate__animated animate__bounceIn"></p>
                                <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                   href="#/home/shop">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item position-relative" style="height: 430px;">
                        <img class="position-absolute w-100 h-100" src="/template/user/img/carousel-3.jpg" style="object-fit: cover;">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Kids
                                    Fashion</h1>
                                <p class="mx-md-5 px-5 animate__animated animate__bounceIn"></p>
                                <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                   href="/home/shop">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="product-offer mb-30" style="height: 200px;">
                <img class="img-fluid" src="/template/user/img/offer-1.jpg" alt="">
                <div class="offer-text">
                    <h6 class="text-white text-uppercase">Save 20%</h6>
                    <h3 class="text-white mb-3">Special Offer</h3>
                    <a href="/home/shop" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
            <div class="product-offer mb-30" style="height: 200px;">
                <img class="img-fluid" src="/template/user/img/offer-2.jpg" alt="">
                <div class="offer-text">
                    <h6 class="text-white text-uppercase">Save 20%</h6>
                    <h3 class="text-white mb-3">Special Offer</h3>
                    <a href="/home/shop" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Carousel End -->


<!-- Featured Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
            </div>
        </div>
    </div>
</div>
<!-- Featured End -->

<!-- Products Start -->
<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Top 10 Products</span>
    </h2>
    <div class="row px-xl-5">
            <c:forEach var="item" items="${topProducts}">
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">

                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100"
                             src="${pageContext.request.contextPath}/template/admin/dist/img/products/${item.product.image}" alt="">
                        <div class="product-action">
                            <c:choose>
                                <c:when test="${not empty sessionScope.currentUser}">
                                    <a class="btn btn-outline-dark btn-square" href="/home/cart/add/${item.product.id}"><i class="fa fa-shopping-cart"></i></a>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn btn-outline-dark btn-square" href="/home/login"><i class="fa fa-shopping-cart"></i></a>
                                </c:otherwise>
                            </c:choose>
                            <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                            <a class="btn btn-outline-dark btn-square" href="/home/detail/${item.product.id}"><i
                                    class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate text-wrap" href="/home/detail/${item.product.id}">${item.product.name}</a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5><fmt:formatNumber value="${item.product.price}" type="currency" pattern="###,###.## VND"/></h5>
                            <h6 class="text-muted ml-2">
                                /${item.sum} sold
                            </h6>
                        </div>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small>(99)</small>
                        </div>
                    </div>
                </div>
        </div>
            </c:forEach>

    </div>
</div>
<!-- Products End -->


<!-- Vendor Start -->
<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel vendor-carousel">
                <div class="bg-light p-4">
                    <img src="/template/user/img/vendor-1.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/template/user/img/vendor-2.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/template/user/img/vendor-3.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/template/user/img/vendor-4.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/template/user/img/vendor-5.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/template/user/img/vendor-6.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/template/user/img/vendor-7.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/template/user/img/vendor-8.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Vendor End -->


<%@ include file="/common/user/footer.jsp" %>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<%@ include file="/common/user/footLink.jsp" %>

</body>

</html>