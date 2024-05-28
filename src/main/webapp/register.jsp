<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E Store - Register Page</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<%@include file="scripts/allCss.jsp"%>
</head>

<body>
	<%@include file="components/navbar.jsp"%>

	<!-- Register Page Start -->
	<div class="login">
		<div class="container-fluid">
			<div class="row">
				<h1 class="mx-auto my-4">Register</h1>

				<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${ succMsg }</p>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty errMsg }">
					<p class="text-center text-danger">${ errMsg }</p>
					<c:remove var="errMsg" scope="session" />
				</c:if>



				<div class="col-lg-12">
					<form action="register" method="post">
						<div class="register-form">
							<div class="row">
								<div class="col-md-6">
									<label>First Name*</label> <input class="form-control"
										type="text" name="fName" required="required"
										placeholder="First Name">
								</div>
								<div class="col-md-6">
									<label>Last Name*</label> <input class="form-control"
										type="text" name="lName" required="required"
										placeholder="Last Name">
								</div>
								<div class="col-md-6">
									<label>E-mail*</label> <input class="form-control"
										required="email" name="email" type="text" placeholder="E-mail">
								</div>
								<div class="col-md-6">
									<label>Mobile No*</label> <input class="form-control"
										type="text" required="required" name="tel"
										placeholder="Mobile No">
								</div>
								<div class="col-md-6">
									<label>Password*</label> <input class="form-control"
										type="password" required="required" name="pass"
										placeholder="Password">
								</div>
								<div class="col-md-12">
									<button class="btn">Register</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Register Page Start -->


	<!-- Footer Start -->
	<%@include file="components/footer.jsp"%>
	<!-- Footer End -->



	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%@include file="scripts/allJs.jsp"%>
</body>
</html>
