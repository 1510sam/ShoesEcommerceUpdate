<%@page import="com.DAO.BrandDAOImpl"%>
<%@page import="com.DB.DBConn"%>
<%@page import="com.entity.Brand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit brand</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BrandDAOImpl dao = new BrandDAOImpl(DBConn.getConnection());
	Brand b = dao.getBrandById(id);
	%>

	<div class="container-fluid position-relative bg-white d-flex p-0">
		<%@include file="navbar.jsp"%>
		<div class="content">
			<%@include file="content.jsp"%>

			<div class="container-fluid pt-4 px-4">
				<div class="col-sm-12 col-xl-12 mx-auto">
					<div class="bg-light rounded h-100 p-4">
						<h5 class="mb-4 text-center">
							Edit brand form
							</h6>

							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${ succMsg }</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty errMsg }">
								<p class="text-center text-danger">${ errMsg }</p>
								<c:remove var="errMsg" scope="session" />
							</c:if>

							<form action="../edit-brand" method="post" enctype="multipart/form-data">
								<input type="hidden" name="id" value="<%= b.getBrandId() %>">
								<div class="mb-3">
									<label for="bName" class="form-label">Brand name</label> <input
										type="text" value="<%=b.getBrandName() %>" name="bName" class="form-control" id="bName">

								</div>

								<div class="mb-3">
									<label for="formFile" class="form-label">Upload photo</label> <input
										class="form-control" value="<%=b.getBrandPhoto() %>" name="bImg" type="file" id="formFile">
								</div>
								<button type="submit" class="btn btn-primary">Edit brand</button>
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