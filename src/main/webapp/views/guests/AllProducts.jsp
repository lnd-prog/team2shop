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
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row content">
		<div class="col-md-3">
			<h1>
				<small>Loại Sản Phẩm</small>
			</h1>
			<ul class="nav nav-pills nav-stacked" data-spy="affixx"
				data-offset-top="333">
				<li><a href="/shop">Tất cả sản phẩm</a></li>
				<c:forEach var="cate" items="${ categories }">
					<li><a href="/shop/${ cate.id }">${ cate.name }</a></li>
				</c:forEach>
			</ul>
		</div>
		<br>
		<div class="col-md-9">
			<h4 class="text-primary">${ category }</h4>
			<c:if test="${ products.isEmpty() }">
				<h1 style="padding: 169px;">
					<small>Không có sản phẩm</small>
				</h1>
			</c:if>
			<c:forEach var="p" items="${ products }">
				<div class="col-sm-4">
					<div class="panel panel-primary text-center">
						<div class="panel-heading"><h4>${ p.name }</h4></div>
						<div class="panel-body">
							<a href="#"> <img
								src="/image/${ p.image }"
								class="img-responsive" style="width: 100%" alt="Image">
							</a>
						</div>
						<div class="panel-footer">
							<h4 class="text-info">
								<b> ${ p.price.toString().replace(".0", " VNĐ") }</b>
							</h4>
							<a href="/cart/add/${p.id}"><br>
							<button class="btn btn-primary addToCart">Thêm Vào Giỏ Hàng</button>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>
