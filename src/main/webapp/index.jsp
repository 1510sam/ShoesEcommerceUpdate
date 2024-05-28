<%@page import="com.DB.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E Store - eCommerce HTML Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<%@include file="scripts/allCss.jsp"%>
</head>

<body>

	<%@include file="components/navbar.jsp"%>

	<!-- Main Slider Start -->
	<div class="header">
		<div class="container-fluid">
			<div class="row">
				<%@include file="components/menu.jsp"%>
				<%@include file="components/slider.jsp"%>
			</div>
		</div>
	</div>
	<!-- Main Slider End -->

	<!-- Brand Start -->
	<%@include file="components/brand.jsp"%>
	<!-- Brand End -->

	<!-- Feature Start-->
	<%@include file="components/featured.jsp"%>
	<!-- Feature End-->

	<!-- Category Start-->
	<%@include file="components/category.jsp"%>
	<!-- Category End-->

	<!-- Call to Action Start -->
	<%@include file="components/contact.jsp"%>
	<!-- Call to Action End -->


	<!-- Product Start -->
	<%@include file="components/products.jsp"%>
	<!-- Product End -->



	<!-- Footer Start -->
	<%@include file="components/footer.jsp"%>
	<!-- Footer End -->

	

	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%@include file="scripts/allJs.jsp"%>
</body>
</html>
