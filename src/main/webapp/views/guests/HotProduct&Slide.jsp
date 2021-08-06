<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<style type="text/css">
.addToCart{
	transition: 0.2s;
}
.addToCart:hover{
	background: #fff;
	border: 1px solid red;
	color: red;
}
.more{
	transition: 0.2s;
}
</style>
</head>
<body>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">

		<div class="item active">
			<img
				src="http://nguyengiatelecom.com/wp-content/uploads/2018/09/gm100_banner_1400x650_50f36e48-1ac7-4e58-b8d9-574c5c12f42e.jpg"
				alt="Mouse" style="width: 100%; height: 20cm;">
			<div class="carousel-caption">
				<h3>Mouse Gaming</h3>
				<p>Ultimate Pro Luxury!</p>
			</div>
		</div>

		<div class="item">
			<img
				src="https://www.aocmonitorap.com/aoc_public/web_kb/images/banner_gk500.jpg"
				alt="Chicago" style="width: 100%; height: 20cm;">
			<div class="carousel-caption">
				<h3>Mechanical Keyboard</h3>
				<p>1.6 Million Colors!</p>
			</div>
		</div>

		<div class="item">
			<img src="https://cdn.shopify.com/s/files/1/0475/2123/5108/files/banner_f2d0e891-f333-44e3-8b76-f9a82b503c9f.jpg?v=1600910647"
				alt="New York" style="width: 100%; height: 20cm;">
			<div class="carousel-caption">
				<h3>Headphone Gaming</h3>
				<p>Extremely Diversity!</p>
			</div>
		</div>

	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span> <span
		class="sr-only">Next</span>
	</a>
</div>

<div class="container" align="center">
	<br>
	<h3>Sản Phẩm Nổi Bật</h3>
	<br>
	<div class="row">
		<c:forEach var="hp" items="${ hotProducts }" end="2">
			<div class="col-sm-4">
				<div class="panel panel-primary text-center">
					<div class="panel-heading"><h4>${ hp.name }</h4></div>
					<div class="panel-body">
						<a href="#"> <img
							src="/image/${ hp.image }"
							class="img-responsive" style="width: 100%" alt="Image">
						</a>
					</div>
					<div class="panel-footer">
						<h4 class="text-info">
							<b> ${ hp.price.toString().replace(".0", " VNĐ") }</b>
						</h4>
						<a href="/cart/add/${hp.id}"><br>
							<button class="btn btn-primary addToCart">Thêm Vào Giỏ Hàng</button>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<hr>
</div>

<div class="container" align="center">
	<h3>Sản Phẩm Mới</h3>
	<br>
	<div class="row">
		<c:forEach var="np" items="${ newProducts }" end="2">
			<div class="col-sm-4">
				<div class="panel panel-primary text-center">
					<div class="panel-heading"><h4>${ np.name }</h4></div>
					<div class="panel-body">
						<a href="#"> <img
							src="/image/${ np.image }"
							class="img-responsive" style="width: 100%" alt="Image">
						</a>
					</div>
					<div class="panel-footer">
						<h4 class="text-info">
							<b> ${ np.price.toString().replace(".0", " VNĐ") }</b>
						</h4>
						<a href="/cart/add/${np.id}"><br>
							<button class="btn btn-primary addToCart">Thêm Vào Giỏ Hàng</button>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<hr>
</div>

<div class="container" align="center">
	<h3>Đang Giảm Giá</h3>
	<br>
	<div class="row">
		<c:forEach var="sp" items="${ saleProducts }" end="7">
			<div class="col-sm-3">
				<div class="panel panel-primary text-center">
					<div class="panel-heading">${ sp.name }</div>
					<div class="panel-body">
						<a href="#"> <img
							src="/image/${ sp.image }"
							class="img-responsive" style="width: 100%" alt="Image">
						</a>
					</div>
					<div class="panel-footer">
						<mark>
							<del>${ sp.price / 0.8 } VNĐ</del>
						</mark>
						<h4 class="text-info">
							<b>${ sp.price.toString().replace(".0", " VNĐ") }</b>
						</h4>
						<a href="/cart/add/${sp.id}"><br>
							<button class="btn btn-primary addToCart">Thêm Vào Giỏ Hàng</button>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<hr>
	<a href="/shop">
		<button type="button" class="btn-lg btn-info more"
			style="align-content: center;">Xem Thêm</button>
	</a>
	<hr>
</div>
</body>
</html>