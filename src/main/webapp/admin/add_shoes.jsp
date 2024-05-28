<%@page import="com.entity.Brand"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConn"%>
<%@page import="com.DAO.BrandDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add shoes</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container-fluid position-relative bg-white d-flex p-0">
		<%@include file="navbar.jsp"%>
		<div class="content">
			<%@include file="content.jsp"%>

			<div class="container-fluid pt-4 px-4">
				<div class="col-sm-12 col-xl-12 mx-auto">
					<div class="bg-light rounded h-100 p-4">
						<h5 class="mb-4 text-center">
							Add shoes form
							</h6>

							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${ succMsg }</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty errMsg }">
								<p class="text-center text-danger">${ errMsg }</p>
								<c:remove var="errMsg" scope="session" />
							</c:if>

							<form action="../add-shoes" method="post"
								enctype="multipart/form-data">
								<div class="mb-3">
									<label for="sname" class="form-label">Shoes name</label> <input
										type="text" name="sName" class="form-control" id="sname">

								</div>
								<div class="mb-3">
									<label for="price" class="form-label">Price</label> <input
										type="number" name="sPrice" class="form-control" id="price">
								</div>
								<div class="mb-3">
									<label for="brand" class="form-label">Shoes brand</label> <select
										class="form-select" id="brand" name="brand">
										<option selected>--Select--</option>
										<%
										BrandDAOImpl dao = new BrandDAOImpl(DBConn.getConnection());
										List<Brand> list = dao.getAllBrand();
										int i = 1;
										for (Brand b : list) {
										%>
											<option value="<%=b.getBrandName() %>"><%=b.getBrandName() %></option>

										<%
										}
										%>
									</select>
								</div>
								<div class="mb-3">
									<label for="cate" class="form-label">Shoes category</label> <select
										class="form-select" id="cate" name="sCate">
										<option selected>--Select--</option>
										<option value="New">New</option>
										<option value="Featured">Featured</option>
										<option value="Recent">Recent</option>
									</select>
								</div>
								<div class="mb-3">
									<label for="status" class="form-label">Shoes status</label> <select
										class="form-select" id="floatingSelect" name="sStatus">
										<option selected>--Select--</option>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									</select>
								</div>

								<div class="mb-3">
									<label for="formFile" class="form-label">Upload photo</label> <input
										class="form-control" name="sImg" type="file" id="formFile">
								</div>
								<button type="submit" class="btn btn-primary">Add shoes</button>
							</form>
					</div>
				</div>
			</div>

			<%@include file="footer.jsp"%>
		</div>
	</div>


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/chart/chart.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/tempusdominus/js/moment.min.js"></script>
	<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>