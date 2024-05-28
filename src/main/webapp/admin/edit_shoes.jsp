<%@page import="com.DB.DBConn"%>
<%@page import="com.DAO.ShoesDAOImpl"%>
<%@page import="com.entity.Shoes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit shoes</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container-fluid position-relative bg-white d-flex p-0">
		<%@include file="navbar.jsp"%>
		<div class="content">
			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
				<a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-hashtag"></i>
					</h2>
				</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
					class="fa fa-bars"></i>
				</a>
				<form class="d-none d-md-flex ms-4">
					<input class="form-control border-0" type="search"
						placeholder="Search">
				</form>
				<div class="navbar-nav align-items-center ms-auto">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa fa-envelope me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">Message</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">
								<div class="d-flex align-items-center">
									<img class="rounded-circle" src="img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="ms-2">
										<h6 class="fw-normal mb-0">Jhon send you a message</h6>
										<small>15 minutes ago</small>
									</div>
								</div>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<div class="d-flex align-items-center">
									<img class="rounded-circle" src="img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="ms-2">
										<h6 class="fw-normal mb-0">Jhon send you a message</h6>
										<small>15 minutes ago</small>
									</div>
								</div>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<div class="d-flex align-items-center">
									<img class="rounded-circle" src="img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="ms-2">
										<h6 class="fw-normal mb-0">Jhon send you a message</h6>
										<small>15 minutes ago</small>
									</div>
								</div>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item text-center">See all message</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa fa-bell me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">Notificatin</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">Profile updated</h6> <small>15
									minutes ago</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">New user added</h6> <small>15
									minutes ago</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">Password changed</h6> <small>15
									minutes ago</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item text-center">See all
								notifications</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2" src="img/user.jpg" alt=""
							style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex">John Doe</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">My Profile</a> <a href="#"
								class="dropdown-item">Settings</a> <a href="#"
								class="dropdown-item">Log Out</a>
						</div>
					</div>
				</div>
			</nav>
			<!-- Navbar End -->

			<div class="container-fluid pt-4 px-4">
				<div class="col-sm-12 col-xl-12 mx-auto">
					<div class="bg-light rounded h-100 p-4">
						<h5 class="mb-4 text-center">
							Edit shoes form
							</h6>

							
							
							<%
							int id = Integer.parseInt(request.getParameter("id"));
						    ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
						    Shoes s = dao.getShoesById(id);
							%>

							<form action="../edit-shoes" method="post">
								<input type="hidden" name="sId" value="<%=s.getShoesId() %>">
								<div class="mb-3">
									<label for="sname" class="form-label">Shoes name</label> <input
										type="text" value="<%=s.getShoesName() %>" name="sName" class="form-control" id="sname">

								</div>
								<div class="mb-3">
									<label for="price" class="form-label">Price</label> <input
										type="number" value="<%=s.getShoesPrice() %>" name="sPrice" class="form-control" id="price">
								</div>
								<div class="mb-3">
									<label for="brand" class="form-label">Shoes brand</label> <select
										class="form-select" id="brand" name="sBrand">
										
										<%
										if("Nike".equals(s.getShoesCategory())) {
										%>
										
										<option value="Nike">Nike</option>
										<option value="Adidas">Adidas</option>
										<option value="Yeezy">Yeezy</option>
									
										<%
										} else if("Adidas".equals(s.getShoesCategory())) {
										%>
										<option value="Adidas">Adidas</option>
										<option value="Nike">Nike</option>
										<option value="Yeezy">Yeezy</option>
										<% } else { %>
										<option value="Yeezy">Yeezy</option>
										<option value="Adidas">Adidas</option>
										<option value="Nike">Nike</option>
										
										<% } %>
									</select>
									
										
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Shoes
										status</label> <select class="form-select" id="floatingSelect"
										name="sStatus">
										<%
											if("Active".equals(s.getShoesStatus())) {
										%>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
										<%
											} else {
										%>
										<option value="Inactive">Inactive</option>
										<option value="Active">Active</option>
										<%
											}
										%>
									</select>
								</div>

								
								<button type="submit" class="btn btn-primary">Edit shoes</button>
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