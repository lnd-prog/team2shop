<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ TitlePage }</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,900,900i" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.home{
	font-size: 24px;
}

.header{
	height: 64px;
	padding-top: 8px;
}

.affix+.container-fluid {
	padding-top: 70px;
}
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
	background-image: url("https://mir-s3-cdn-cf.behance.net/9759694bf2849d2fd29b78774602a7a7/2f80647e-2821-41af-8513-cafc8aede8dd_rwc_0x337x1920x240x1920.jpg?h=de509e3bb22055b1065279766b0e2a7b");
 	background-color: #cccccc;
 	color: white;
 	font-weight: bold;
}

.text-top{
	text-shadow: 3px 0 0 #000, -3px 0 0 #000, 0 3px 0 #000, 0 -3px 0 #000, 2px 2px #000, -2px -2px 0 #000, 2px -2px 0 #000, -2px 2px 0 #000;
}
.pro{
	text-shadow: 2px 0 0 #000, -2px 0 0 #000, 0 2px 0 #000, 0 -2px 0 #000, 1px 1px #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000;
}

/* Add a gray background color and some padding to the footer */
.headerFooter{
	background-color: #666;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	color: white;
	padding: 10px 380px;
	grid-gap: 100px;
}
footer {
	background-color: #555;
	padding: 10px;
	color: white;
}
.footerCate{
	padding-left: 10px;
}
.text{
	font-size: 16px;
}
.cate{
	color: #1ec6d9;
}
.cates:hover{
	color: #66efff;
}
.ins{
	margin-left: 5px;
}
#button {
  display: inline-block;
  background-color: #1ec6d9;
  width: 46px;
  height: 52px;
  text-align: center;
  border-radius: 4px;
  position: fixed;
  bottom: 30px;
  right: 30px;
  transition: background-color .3s, 
    opacity .5s, visibility .5s;
  opacity: 0;
  visibility: hidden;
  z-index: 1000;
  padding-bottom: 2px;
}
#button::after {
  content: "\f077";
  font-family: FontAwesome;
  font-weight: normal;
  font-style: normal;
  font-size: 2em;
  line-height: 50px;
  color: #fff;
}
#button:hover {
  cursor: pointer;
  background-color: #46e0f2;
  text-decoration: none;
}
#button:active {
  background-color: #555;
}
#button.show {
  opacity: 1;
  visibility: visible;
}

/* Styles for the content section */
@media (min-width: 500px) {
  #button {
    margin: 10px;
  }
}
</style>
</head>
<body>
	<a id="button"></a>
	<div class="jumbotron">
		<div class="container text-center shadow-lg p-3 mb-5 bg-white rounded">
			<h1 class="text-top">TEAM2 SHOP</h1>
			<p class="pro">PRO1041</p>
		</div>
	</div>

	<nav class="navbar-inverse header" data-spy="affix" data-offset-top="197">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand home" href="/">Trang chủ</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="">Loại
							Sản Phẩm<span class="caret"></span>
					</a>
						<ul class="nav dropdown-menu">
							<c:forEach var="cate" items="${ categories }">
								<li><a href="/shop/${ cate.id }">${ cate.name }</a></li>
							</c:forEach>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${ User == null }">
						<li><a href="/login"> <span
								class="glyphicon glyphicon-log-in"></span> Đăng Nhập
						</a></li>
					</c:if>
					<c:if test="${ User != null }">
						<li><a class="dropdown-toggle" data-toggle="dropdown"
							href="/#"><span class="glyphicon glyphicon-user"></span> Tài
								Khoản</a>
							<ul class="nav dropdown-menu">
								<c:if test="${ User.isRole() == true }">
									<li><a href="/admin">Quản Lý Bán Hàng</a></li>
								</c:if>
								<li><a href="/myAcc/historyOrder/${ User.getUsername() }">Lịch Sử Order</a></li>
								<li><a href="/myAcc/myProfile/${ User.getUsername() }">Quản Lý Tài Khoản</a></li>
								<li><a href="/login">Đăng Xuất</a></li>
							</ul></li>
					</c:if>

					<li><a href="/cart/view"> <span
							class="glyphicon glyphicon-shopping-cart"></span> Giỏ Hàng <span
							class="badge">${ Count }</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<jsp:include page="${ view }"></jsp:include>

	<br>
	<br>
	<div class="headerFooter">
		<div>
			<h3>Về chúng tôi</h3>
			<p class="text">Đây là website chính thức và duy nhất của Team2Shop!</p>
		</div>
		<div class="footerCate">
			<h3>Danh mục sản phẩm</h3>
			<ul class="text cate">
				<c:forEach var="cate" items="${ categories }">
					<li class="cates"><a class="cate cates" href="/shop/${ cate.id }">${ cate.name }</a></li>
				</c:forEach>
			</ul></li>
		</div>
		<div>
			<h3>Liên hệ</h3>
			<p class="text">Mọi góp ý và thắc mắc cần hỗ xin vui lòng liên hệ Fanpage và Instagram</p>
			<div class="social">
				<a class="fb" href="https://www.facebook.com/luannguyenduc.lnd/" target="_blank">
					<img alt="fb" src="https://cdn3.iconfinder.com/data/icons/capsocial-round/500/facebook-512.png" width="25px" height="25px">
				</a>
				<a class="ins" href="https://www.instagram.com/_.naulll/" target="_blank">
					<img alt="ins" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1024px-Instagram_icon.png" width="25px" height="25px">
				</a>
			</div><br>
		</div>
	</div>
	<footer class="text-center">
		<p>
			<p>Copyright 2021 ©<b> Team2Shop</b></p>
		</p>
	</footer>
	<script type="text/javascript">
		var btn = $('#button');
	
		$(window).scroll(function() {
		  if ($(window).scrollTop() > 300) {
		    btn.addClass('show');
		  } else {
		    btn.removeClass('show');
		  }
		});
	
		btn.on('click', function(e) {
		  e.preventDefault();
		  $('html, body').animate({scrollTop:0}, '300');
		});
	</script>
</body>
</html>