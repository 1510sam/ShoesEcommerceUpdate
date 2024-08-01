<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DB.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Cart Page</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<%@include file="scripts/allCss.jsp"%>
<style type="text/css">
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -150px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
	border-radius: 5px;
	/* Optional: Add some border radius for better look */
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
/* toast */

.cart-page .cart-summary .cart-btn button a {
    color: #333;
    background: #FF6F61;
    text-decoration: none;
}



.cart-page .cart-summary .cart-btn button a:hover {
	color: #333;
    background: #fff;
    text-decoration: none;
} 
</style>
</head>

<body>
	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty addCart}">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast()
		{
			const toastElement = document.getElementById("toast");
            toastElement.classList.add("display");
            setTimeout(() => {
                toastElement.classList.remove("display");
            }, 2000); // 0.5s fadeIn + 1s display + 0.5s fadeOut = 2s
        }

        // Gọi hàm showToast
        document.addEventListener("DOMContentLoaded", function() {
            showToast();
        });
		
	</script>
	</c:if>

	<%@include file="components/navbar.jsp"%>


	<c:if test="${ not empty succMsg }">
		<div class="alert alert-success" role="alert">${ succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${ not empty failedMsg }">
		<div class="alert alert-danger" role="alert">${ failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">Cart</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Cart Start -->
	<div class="cart-page">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="cart-page-inner">
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead class="thead-dark">
									<tr>
										<th>Product</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Total</th>
										<th>Remove</th>
									</tr>
								</thead>
								<tbody class="align-middle">
									<%
									User us = (User) session.getAttribute("userObj");
									CartDAOImpl dao = new CartDAOImpl(DBConn.getConnection());
									List<Cart> cart = dao.getShoesByUser(us.getId());
									Double totalPrice = 0.00;
									Double shippingPrice = 1.18;
									if (cart.isEmpty()) {
									%>
									<tr>
										<td colspan="5" style="text-align: center;">No shoes in
											cart</td>
									</tr>
									<%
									} else {
									for (Cart c : cart) {
										totalPrice += c.getTotalPrice();
									%>
									<tr>
										<td>
											<div class="img">
												<p><%=c.getShoesName()%></p>
											</div>
										</td>
										<td><%=c.getPrice()%></td>
										<td>
											<div class="qty">
												<button class="btn-minus">
													<i class="fa fa-minus"></i>
												</button>
												<input type="text" value="1">
												<button class="btn-plus">
													<i class="fa fa-plus"></i>
												</button>
											</div>
										</td>
										<td><%=c.getPrice()%></td>
										<td><a class="btn"
											href="remove_shoes?cid=<%=c.getCartId()%>"> <i
												class="fa fa-trash"></i>
										</a></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>


				<div class="col-lg-4">
					<div class="cart-page-inner">
						<div class="row">
							<div class="col-md-12">
								<div class="cart-summary">
									<div class="cart-content">
										<h1>Cart Summary</h1>
										<p>
											Sub Total<span>$<%=Math.floor(totalPrice)%></span>
										</p>
										<p>
											Shipping Cost<span>$<%=shippingPrice%></span>
										</p>
										<h2>
											Grand Total<span>$<%=totalPrice + shippingPrice%></span>
										</h2>
									</div>
									<div class="cart-btn">
										<button>
											<a href="index.jsp">Update Cart</a>
										</button>
										<button>
											<a href="checkout.jsp">Checkout</a>
										</button>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- Cart End -->


	<!-- Footer Start -->
	<%@include file="components/footer.jsp"%>
	<!-- Footer End -->



	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


	<%@include file="scripts/allJs.jsp"%>
</body>
</html>
