<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Checkout Page</title>
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
				<li class="breadcrumb-item active">Checkout</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Checkout Start -->
	<div class="checkout">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="checkout-inner">
						<div class="billing-address">
							<h2>Billing Address</h2>
							<div class="row">
								<div class="col-md-6">
									<label>First Name</label> <input class="form-control"
										type="text" placeholder="First Name">
								</div>
								<div class="col-md-6">
									<label>Last Name"</label> <input class="form-control"
										type="text" placeholder="Last Name">
								</div>
								<div class="col-md-6">
									<label>E-mail</label> <input class="form-control" type="text"
										placeholder="E-mail">
								</div>
								<div class="col-md-6">
									<label>Mobile No</label> <input class="form-control"
										type="text" placeholder="Mobile No">
								</div>
								<div class="col-md-12">
									<label>Address</label> <input class="form-control" type="text"
										placeholder="Address">
								</div>
								<div class="col-md-6">
									<label>Country</label> <select class="custom-select">
										<option selected>United States</option>
										<option>Afghanistan</option>
										<option>Albania</option>
										<option>Algeria</option>
									</select>
								</div>
								<div class="col-md-6">
									<label>City</label> <input class="form-control" type="text"
										placeholder="City">
								</div>
								<div class="col-md-6">
									<label>State</label> <input class="form-control" type="text"
										placeholder="State">
								</div>
								<div class="col-md-6">
									<label>ZIP Code</label> <input class="form-control" type="text"
										placeholder="ZIP Code">
								</div>
								<div class="col-md-12">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="newaccount"> <label class="custom-control-label"
											for="newaccount">Create an account</label>
									</div>
								</div>
								<div class="col-md-12">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="shipto"> <label class="custom-control-label"
											for="shipto">Ship to different address</label>
									</div>
								</div>
							</div>
						</div>

						<div class="shipping-address">
							<h2>Shipping Address</h2>
							<div class="row">
								<div class="col-md-6">
									<label>First Name</label> <input class="form-control"
										type="text" placeholder="First Name">
								</div>
								<div class="col-md-6">
									<label>Last Name"</label> <input class="form-control"
										type="text" placeholder="Last Name">
								</div>
								<div class="col-md-6">
									<label>E-mail</label> <input class="form-control" type="text"
										placeholder="E-mail">
								</div>
								<div class="col-md-6">
									<label>Mobile No</label> <input class="form-control"
										type="text" placeholder="Mobile No">
								</div>
								<div class="col-md-12">
									<label>Address</label> <input class="form-control" type="text"
										placeholder="Address">
								</div>
								<div class="col-md-6">
									<label>Country</label> <select class="custom-select">
										<option selected>United States</option>
										<option>Afghanistan</option>
										<option>Albania</option>
										<option>Algeria</option>
									</select>
								</div>
								<div class="col-md-6">
									<label>City</label> <input class="form-control" type="text"
										placeholder="City">
								</div>
								<div class="col-md-6">
									<label>State</label> <input class="form-control" type="text"
										placeholder="State">
								</div>
								<div class="col-md-6">
									<label>ZIP Code</label> <input class="form-control" type="text"
										placeholder="ZIP Code">
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				User us = (User) session.getAttribute("userObj");
				CartDAOImpl dao = new CartDAOImpl(DBConn.getConnection());
				List<Cart> cart = dao.getShoesByUser(us.getId());
				Double totalPrice = 0.00;
				Double shippingPrice = 1.18;
				for (Cart c : cart) {
					totalPrice += c.getTotalPrice();
				%>
				<div class="col-lg-4">
					<div class="checkout-inner">
						<div class="checkout-summary">
							<h1>Cart Total</h1>
							<p class="sub-total">
								Sub Total<span>$<%=Math.floor(totalPrice) %></span>
							</p>
							<p class="ship-cost">
								Shipping Cost<span>$<%=shippingPrice%></span>
							</p>
							<h2>
								Grand Total<span>$<%=totalPrice + shippingPrice%></span>
							</h2>
						</div>

						<div class="checkout-payment">
							<div class="payment-methods">
								<h1>Payment Methods</h1>
								<div class="payment-method">
									<div class="custom-control custom-radio">
										<input type="radio" class="custom-control-input"
											id="payment-1" name="payment"> <label
											class="custom-control-label" for="payment-1">Paypal</label>
									</div>
								</div>
								<div class="payment-method">
									<div class="custom-control custom-radio">
										<input type="radio" class="custom-control-input"
											id="payment-3" name="payment"> <label
											class="custom-control-label" for="payment-3">Check
											Payment</label>
									</div>
								</div>
								<div class="payment-method">
									<div class="custom-control custom-radio">
										<input type="radio" class="custom-control-input"
											id="payment-5" name="payment"> <label
											class="custom-control-label" for="payment-5">Cash on
											Delivery</label>
									</div>
								</div>
							</div>
							<div class="checkout-btn">
								<button>Place Order</button>
							</div>
						</div>
					</div>
				</div>
				<%} %>
			</div>
		</div>
	</div>
	<!-- Checkout End -->


	<!-- Footer Start -->
	<%@include file="components/footer.jsp"%>
	<!-- Footer End -->



	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%@include file="scripts/allJs.jsp"%>
</body>
</html>
