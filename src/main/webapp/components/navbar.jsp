<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!-- Top bar Start -->
<div class="top-bar">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				<i class="fa fa-envelope"></i> support@email.com
			</div>
			<div class="col-sm-6">
				<i class="fa fa-phone-alt"></i> +012-345-6789
			</div>
		</div>
	</div>
</div>
<!-- Top bar End -->

<!-- Nav Bar Start -->
<div class="nav">
	<div class="container-fluid">
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<a href="#" class="navbar-brand">MENU</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">

				<c:if test="${empty userObj }">
					<div class="navbar-nav mr-auto">
						<a href="index.jsp" class="nav-item nav-link active">Home</a> <a
							href="product_list.jsp" class="nav-item nav-link">Products</a>
					</div>
				</c:if>



				<c:if test="${not empty userObj }">
					<div class="navbar-nav mr-auto">
						<a href="index.jsp" class="nav-item nav-link active">Home</a> <a
							href="product-list.html" class="nav-item nav-link">Products</a><a href="cart.html" class="nav-item nav-link">Cart</a> <a
							href="checkout.html" class="nav-item nav-link">Checkout</a><a
							href="user.jsp" class="nav-item nav-link">My Account</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown">More Pages</a>
							<div class="dropdown-menu">
								<a href="wishlist.html" class="dropdown-item">Wishlist</a> <a
									href="login.html" class="dropdown-item">Login & Register</a> <a
									href="contact.html" class="dropdown-item">Contact Us</a>
							</div>
						</div>
					</div>
				</c:if>


				<div class="navbar-nav ml-auto">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-toggle="dropdown">User Account</a>


						<c:if test="${not empty userObj }">
							<div class="dropdown-menu">
								<a href="login.jsp" class="dropdown-item">${userObj.lastName }</a>
								<a class="dropdown-item" href="logout">Logout</a>
							</div>
						</c:if>

						<c:if test="${empty userObj }">
							<div class="dropdown-menu">
								<a href="./login.jsp" class="dropdown-item">Login</a> <a
									href="./register.jsp" class="dropdown-item">Register</a>
							</div>
						</c:if>

					</div>
				</div>
			</div>
		</nav>
	</div>
</div>
<!-- Nav Bar End -->

<!-- Bottom Bar Start -->
<div class="bottom-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-3">
				<div class="logo">
					<a href="index.jsp"> <img src="img/logo.png" alt="Logo">
					</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="search">
					<input type="text" placeholder="Search">
					<button>
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
			<div class="col-md-3">
				<div class="user">
					<a href="wishlist.html" class="btn wishlist"> <i
						class="fa fa-heart"></i> <span>(0)</span>
					</a> <a href="cart.jsp" class="btn cart"> <i
						class="fa fa-shopping-cart"></i> <span>(0)</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Bottom Bar End -->
