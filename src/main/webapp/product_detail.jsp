<%@page import="com.entity.User"%>
<%@page import="com.entity.Brand"%>
<%@page import="com.DAO.BrandDAOImpl"%>
<%@page import="com.entity.Shoes"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ShoesDAOImpl"%>
<%@page import="com.DB.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E Store - Product Detail</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<%@include file="scripts/allCss.jsp"%>
</head>

<body>
	<%
	User us = (User)session.getAttribute("userObj");
	%>
	<%@include file="components/navbar.jsp"%>

	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">Product Detail</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<%
	int sid = Integer.parseInt(request.getParameter("sid"));
	ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
	Shoes s = dao.getShoesById(sid);
	%>

	<!-- Product Detail Start -->
	<div class="product-detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="product-detail-top">
						<div class="row align-items-center">
							<div class="col-md-5">
								<div class="product-slider-single normal-slider">
									<img src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
									<img src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
									<img src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
								</div>
								<div class="product-slider-single-nav normal-slider">
									<div class="slider-nav-img">
										<img src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
									</div>
									<div class="slider-nav-img">
										<img src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
									</div>
									<div class="slider-nav-img">
										<img src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
									</div>
									<div class="slider-nav-img">
										<img src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
									</div>
									<div class="slider-nav-img">
										<img src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
									</div>
								</div>
							</div>
							<div class="col-md-7">
								<div class="product-content">
									<div class="title">
										<h2><%=s.getShoesName()%></h2>
									</div>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="price">
										<h4>Price:</h4>
										<p>
											<%=s.getShoesPrice()%>
											$
										</p>
									</div>
									<div class="quantity">
										<h4>Quantity:</h4>
										<div class="qty">
											<button class="btn-minus">
												<i class="fa fa-minus"></i>
											</button>
											<input type="text" value="1">
											<button class="btn-plus">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
									<div class="p-size">
										<h4>Size:</h4>
										<div class="btn-group btn-group-sm">
											<button type="button" class="btn">36.5</button>
											<button type="button" class="btn">37</button>
											<button type="button" class="btn">37.5</button>
											<button type="button" class="btn">38</button>
											<button type="button" class="btn">38.5</button>
										</div>
									</div>
									<%
										if(us == null) {
									%>
									<div class="action">
										<a class="btn" href="login.jsp"><i class="fa fa-shopping-cart"></i>Add
											to Cart</a> <a class="btn" href="login.jsp"><i
											class="fa fa-shopping-bag"></i>Buy Now</a>
									</div>
									<%} else { %>
									<div class="action">
										<a class="btn" href="cart?sid=<%=s.getShoesId()%>&&uid=<%=us.getId()%>"><i class="fa fa-shopping-cart"></i>Add
											to Cart</a> <a class="btn" href="#"><i
											class="fa fa-shopping-bag"></i>Buy Now</a>
									</div>
									<%} %>
								</div>
							</div>
						</div>
					</div>

					<div class="row product-detail-bottom">
						<div class="col-lg-12">
							<ul class="nav nav-pills nav-justified">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="pill" href="#description">Status</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="pill"
									href="#specification">Specification</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="pill"
									href="#reviews">Reviews (1)</a></li>
							</ul>

							<div class="tab-content">
								<div id="description" class="container tab-pane active">
									<h4>Product status</h4>
									<%
									if (s.getShoesStatus() != "Active") {
									%>
									<h5>In stock</h5>
									<%
									} else {
									%>
									<h5>Out of stock</h5>
									<%
									}
									%>
								</div>
								<div id="specification" class="container tab-pane fade">
									<h4>Product specification</h4>
									<ul>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
									</ul>
								</div>
								<div id="reviews" class="container tab-pane fade">
									<div class="reviews-submitted">
										<div class="reviewer">
											Phasellus Gravida - <span>01 Jan 2020</span>
										</div>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
										<p>Sed ut perspiciatis unde omnis iste natus error sit
											voluptatem accusantium doloremque laudantium, totam rem
											aperiam.</p>
									</div>
									<div class="reviews-submit">
										<h4>Give your Review:</h4>
										<div class="ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i>
										</div>
										<div class="row form">
											<div class="col-sm-6">
												<input type="text" placeholder="Name">
											</div>
											<div class="col-sm-6">
												<input type="email" placeholder="Email">
											</div>
											<div class="col-sm-12">
												<textarea placeholder="Review"></textarea>
											</div>
											<div class="col-sm-12">
												<button>Submit</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="product">
						<div class="section-header">
							<h1>Related Products</h1>
						</div>

						<div
							class="row align-items-center product-slider product-slider-3">

							<%
							ShoesDAOImpl dao2 = new ShoesDAOImpl(DBConn.getConnection());
							List<Shoes> list2 = dao2.getAllShoes();
							for (Shoes s2 : list2) {
							%>

							<div class="col-lg-3">
								<div class="product-item">
									<div class="product-title">
										<a href="product_detail.jsp?sid=<%=s2.getShoesId()%>"><%=s2.getShoesName()%></a>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<div class="product-image">
										<a href="product-detail.html"> <img width="300px"
											height="300px" src="shoes/<%=s2.getShoesPhoto()%>"
											alt="Product Image">
										</a>
										<div class="product-action">
											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart"></i></a> <a href="#"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
									<div class="product-price">
										<h3>
											<%=s2.getShoesPrice()%>$
										</h3>
										<%
										if (us == null) {
										%>
										<a class="btn" href="login.jsp"><i
											class="fa fa-shopping-cart"></i>Buy Now</a>
										<%
										} else {
										%>
										<a class="btn"
											href="cart?sid=<%=s.getShoesId()%>&&uid=<%=us.getId()%>"><i
											class="fa fa-shopping-cart"></i>Buy Now</a>
										<%
										}
										%>
									</div>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>

				<!-- Side Bar Start -->
				<div class="col-lg-4 sidebar">
					<div class="sidebar-widget category">
						<h2 class="title">Category</h2>
						<nav class="navbar bg-light">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link"
									href="all_featured_shoes.jsp"><img
										style="margin-right: 14px" width="14px" height="16.8px"
										src="https://i.pinimg.com/736x/dc/53/50/dc5350243970437d9fff2c8db3a9975b.jpg">Featured
										Shoes</a></li>
								<li class="nav-item"><a class="nav-link" href="#"><img
										style="margin-right: 10px" width="14px" height="16.8px"
										src="https://t3.ftcdn.net/jpg/04/59/83/98/360_F_459839852_CcutU8xMpaEawDM7s9xsnYyxEI1rBtSs.jpg">
										New Shoes</a></li>
								<li class="nav-item"><a class="nav-link"
									href="all_recent_shoes.jsp"><img style="margin-right: 10px"
										width="14px" height="16.8px"
										src="https://png.pngtree.com/template/20191203/ourmid/pngtree-shoes-design-logo-vector-image_337938.jpg">Recent
										Shoes</a></li>
							</ul>
						</nav>
					</div>

					<div class="sidebar-widget widget-slider">
						<div class="sidebar-slider normal-slider">
							<%
							ShoesDAOImpl dao3 = new ShoesDAOImpl(DBConn.getConnection());
							List<Shoes> list3 = dao3.getAllShoes();
							for (Shoes s3 : list3) {
							%>
							<div class="product-item">
								<div class="product-title">
									<a href="#"><%=s3.getShoesName()%></a>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<div class="product-image">
									<a href="product-detail.html"> <img width="900px"
										height="800px" src="shoes/<%=s3.getShoesPhoto()%>"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-price">
									<h3>
										<span>$</span><%=s3.getShoesPrice()%>
									</h3>
									<%
										if (us == null) {
										%>
										<a class="btn" href="login.jsp"><i
											class="fa fa-shopping-cart"></i>Buy Now</a>
										<%
										} else {
										%>
										<a class="btn"
											href="cart?sid=<%=s.getShoesId()%>&&uid=<%=us.getId()%>"><i
											class="fa fa-shopping-cart"></i>Buy Now</a>
										<%
										}
										%>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>

					<div class="sidebar-widget brands">
						<h2 class="title">Our Brands</h2>
						<ul>
							<%
							BrandDAOImpl dao4 = new BrandDAOImpl(DBConn.getConnection());
							List<Brand> list4 = dao4.getAllBrand();
							for (Brand b : list4) {
							%>
							<li><a href="#"><%=b.getBrandName()%></a></li>
							<%
							}
							%>
						</ul>
					</div>


				</div>
				<!-- Side Bar End -->
			</div>
		</div>
	</div>
	<!-- Product Detail End -->


	<!-- Brand Start -->
	<%@include file="components/brand.jsp"%>
	<!-- Brand End -->


	<!-- Footer Start -->
	<%@include file="components/footer.jsp"%>
	<!-- Footer End -->



	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%@include file="scripts/allJs.jsp"%>
</body>
</html>
