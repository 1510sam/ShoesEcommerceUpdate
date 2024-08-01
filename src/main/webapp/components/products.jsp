<!-- Featured Product Start -->
<%@page import="com.entity.User"%>
<%@page import="com.entity.Shoes"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConn"%>
<%@page import="com.DAO.ShoesDAOImpl"%>
<div class="featured-product product">
	<%
	User us = (User) session.getAttribute("userObj");
	%>
	<div class="container-fluid">
		<div class="section-header">
			<h1>Featured Product</h1>
		</div>
		<div class="row align-items-center product-slider product-slider-4">
			<%
			ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
			List<Shoes> list = dao.getFeaturedShoes();
			for (Shoes s : list) {
			%>

			<div class="col-lg-12">
				<div class="product-item">
					<div class="product-title">
						<a href="#"><%=s.getShoesName()%></a>
						<div class="ratting">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
					</div>
					<div class="product-image">
						<a href="product-detail.html"> <img width="300" height="300"
							src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
						</a>
						<div class="product-action">
							<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
								class="fa fa-heart"></i></a> <a
								href="product_detail.jsp?sid=<%=s.getShoesId()%>"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="product-price">
						<h3>
							<%=s.getShoesPrice()%><span>$</span>
						</h3>
						<%
						if (us == null) {
						%>
						<a class="btn" href="login.jsp"><i class="fa fa-shopping-cart"></i>Buy
							Now</a>
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
<!-- Featured Product End -->

<!-- Newsletter Start -->
<div class="newsletter">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<h1>Subscribe Our Newsletter</h1>
			</div>
			<div class="col-md-6">
				<div class="form">
					<input type="email" value="Your email here">
					<button>Submit</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Newsletter End -->

<!-- Recent Product Start -->
<div class="recent-product product">
	<div class="container-fluid">
		<div class="section-header">
			<h1>Recent Product</h1>
		</div>
		<div class="row align-items-center product-slider product-slider-4">
			<%
			ShoesDAOImpl dao2 = new ShoesDAOImpl(DBConn.getConnection());
			List<Shoes> list2 = dao2.getRecentShoes();
			for (Shoes s : list2) {
			%>

			<div class="col-lg-12">
				<div class="product-item">
					<div class="product-title">
						<a href="#"><%=s.getShoesName()%></a>
						<div class="ratting">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
					</div>
					<div class="product-image">
						<a href="product-detail.html"> <img width="300" height="300"
							src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
						</a>
						<div class="product-action">
							<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
								class="fa fa-heart"></i></a> <a
								href="product_detail.jsp?sid=<%=s.getShoesId()%>"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="product-price">
						<h3>
							<%=s.getShoesPrice()%><span>$</span>
						</h3>
						<%
						if (us == null) {
						%>
						<a class="btn" href="login.jsp"><i class="fa fa-shopping-cart"></i>Buy
							Now</a>
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
<!-- Recent Product End -->

<!-- Recent Product Start -->
<div class="recent-product product">
	<div class="container-fluid">
		<div class="section-header">
			<h1>New Product</h1>
		</div>
		<div class="row align-items-center product-slider product-slider-4">
			<%
			ShoesDAOImpl dao3 = new ShoesDAOImpl(DBConn.getConnection());
			List<Shoes> list3 = dao3.getAllNewShoes();
			for (Shoes s : list3) {
			%>

			<div class="col-lg-12">
				<div class="product-item">
					<div class="product-title">
						<a href="#"><%=s.getShoesName()%></a>
						<div class="ratting">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
					</div>
					<div class="product-image">
						<a href="product-detail.html"> <img width="300" height="300"
							src="shoes/<%=s.getShoesPhoto()%>" alt="Product Image">
						</a>
						<div class="product-action">
							<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
								class="fa fa-heart"></i></a> <a
								href="product_detail.jsp?sid=<%=s.getShoesId()%>"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="product-price">
						<h3>
							<%=s.getShoesPrice()%><span>$</span>
						</h3>
						<%
						if (us == null) {
						%>
						<a class="btn" href="login.jsp"><i class="fa fa-shopping-cart"></i>Buy
							Now</a>
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
<!-- Recent Product End -->