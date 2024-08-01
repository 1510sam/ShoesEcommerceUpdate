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
<title>E Store - Featured Shoes</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<%@include file="scripts/allCss.jsp"%>
</head>

<body>
	<%@include file="components/navbar.jsp"%>

	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">Featured Shoes</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Product List Start -->
	<div class="product-view">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
						<div class="col-md-12">
							<div class="product-view-top">
								<div class="row">
									<div class="col-md-4">
										<div class="product-search">
											<input type="email" value="Search">
											<button>
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
									<div class="col-md-4">
										<div class="product-short">
											<div class="dropdown">
												<div class="dropdown-toggle" data-toggle="dropdown">Product
													short by</div>
												<div class="dropdown-menu dropdown-menu-right">
													<a href="#" class="dropdown-item">Newest</a> <a href="#"
														class="dropdown-item">Popular</a> <a href="#"
														class="dropdown-item">Most sale</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="product-price-range">
											<div class="dropdown">
												<div class="dropdown-toggle" data-toggle="dropdown">Product
													price range</div>
												<div class="dropdown-menu dropdown-menu-right">
													<a href="#" class="dropdown-item">$0 to $50</a> <a href="#"
														class="dropdown-item">$51 to $100</a> <a href="#"
														class="dropdown-item">$101 to $150</a> <a href="#"
														class="dropdown-item">$151 to $200</a> <a href="#"
														class="dropdown-item">$201 to $250</a> <a href="#"
														class="dropdown-item">$251 to $300</a> <a href="#"
														class="dropdown-item">$301 to $350</a> <a href="#"
														class="dropdown-item">$351 to $400</a> <a href="#"
														class="dropdown-item">$401 to $450</a> <a href="#"
														class="dropdown-item">$451 to $500</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<%
						ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
						List<Shoes> list = dao.getAllFeaturedShoes();
						for (Shoes s : list) {
						%>

						<div class="col-md-4">
							<div class="product-item">
								<div class="product-title">
									<a style="font-size: 16px" href="#"><%=s.getShoesName()%></a>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<div class="product-image">
									<a href="product-detail.html"> <img width="215px"
										height="215px" src="shoes/<%=s.getShoesPhoto()%>"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-price">
									<h3 style="font-size: 16px">
										<%=s.getShoesPrice()%><span>VND</span>
									</h3>
									<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
										Now</a>
								</div>
							</div>
						</div>

						<%
						}
						%>

					</div>

					<!-- Pagination Start -->
					<div class="col-md-12">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">Previous</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
					</div>
					<!-- Pagination Start -->
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
							ShoesDAOImpl dao2 = new ShoesDAOImpl(DBConn.getConnection());
							List<Shoes> list2 = dao2.getAllShoes();
							for (Shoes s2 : list2) {
							%>
						
							<div class="product-item">
								<div class="product-title">
									<a href="#"><%= s2.getShoesName() %></a>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<div class="product-image">
									<a href="product-detail.html"> <img
										src="shoes/<%= s2.getShoesPhoto() %>" alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-price">
									<h3 style="font-size: 16px">
										<%= s2.getShoesPrice() %><span>VND</span>
									</h3>
									<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
										Now</a>
								</div>
							</div>
							<%} %>
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
	<!-- Product List End -->


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
