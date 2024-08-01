<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E Store - Login Page</title>
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
			<c:if test="${not empty errMsg }">
				<h5 class="text-center text-danger">${ errMsg }</h5>
				<c:remove var="errMsg" scope="session" />
			</c:if>
			
			<c:if test="${not empty succMsg }">
				<h5 class="text-center text-danger">${ succMsg }</h5>
				<c:remove var="succMsg" scope="session" />
			</c:if>
			<div class="row">
				<h1 class="mx-auto my-4">Login</h1>
				<div class="col-lg-12">
					<form action="login" method="post">
						<div class="login-form">
							<div class="row">
								<div class="col-md-6">
									<label>E-mail</label> <input class="form-control" type="email"
										name="email" placeholder="E-mail">
								</div>
								<div class="col-md-6">
									<label>Password</label> <input class="form-control" name="pass"
										type="password" placeholder="Password">
								</div>
								<div class="col-md-12">
									<button class="btn">Login</button>
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
