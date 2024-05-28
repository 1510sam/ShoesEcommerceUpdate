<%@page import="com.entity.Shoes"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConn"%>
<%@page import="com.DAO.ShoesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List shoes</title>
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
						<h5 class="mb-4 text-center">All products</h5>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${ succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errMsg }">
							<p class="text-center text-danger">${ errMsg }</p>
							<c:remove var="errMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Shoes Name</th>
									<th scope="col">Brand</th>
									<th scope="col">Category</th>
									<th scope="col">Photo</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
								List<Shoes> list = dao.getAllShoes();
								int i = 1;
								for (Shoes s : list) {
								%>

								<tr>
									<th scope="row"><%=i++%></th>
									<td><%=s.getShoesName()%></td>
									<td><%=s.getShoesBrand()%></td>
									<td><%=s.getShoesCategory()%></td>
									<td><img src="../shoes/<%=s.getShoesPhoto()%>"
										style="width: 50px; height: 50px;"></td>
									<td><%=s.getShoesStatus()%></td>
									<td><a href="edit_shoes.jsp?id=<%=s.getShoesId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a
										href="../delete-shoes?id=<%=s.getShoesId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>

								<%
								}
								%>




							</tbody>


						</table>

						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</nav>
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