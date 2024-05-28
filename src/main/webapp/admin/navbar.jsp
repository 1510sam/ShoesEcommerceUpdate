<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!-- Spinner Start -->
<div id="spinner"
	class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	<div class="spinner-border text-primary"
		style="width: 3rem; height: 3rem;" role="status">
		<span class="sr-only">Loading...</span>
	</div>
</div>
<!-- Spinner End -->


<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
	<nav class="navbar bg-light navbar-light">
		<a href="admin.jsp" class="navbar-brand mx-4 mb-3">
			<h3 class="text-primary">
				<i class="fa fa-hashtag me-2"></i>DASHMIN
			</h3>
		</a>
		<div class="d-flex align-items-center ms-4 mb-4">
			<div class="position-relative">
				<img class="rounded-circle" src="img/user.jpg" alt=""
					style="width: 40px; height: 40px;">
				<div
					class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
			</div>

			<c:if test="${not empty adminObj }">
				<div class="ms-3">
					<span>${ adminObj.lastName }</span>
				</div>
			</c:if>


		</div>
		<div class="navbar-nav w-100">
			<a href="admin.jsp" class="nav-item nav-link active"><i
				class="fa fa-tachometer-alt me-2"></i>Dashboard</a><a
				href="addBrand.jsp" class="nav-item nav-link"><i
				class="fas fa-copyright me-2"></i>Add brand</a> <a
				href="add_shoes.jsp" class="nav-item nav-link"><i
				class="fas fa-plus-square me-2"></i>Add Shoes</a><a
				href="list_brands.jsp" class="nav-item nav-link"><i
				class="fa fa-table me-2"></i>All brands</a> <a
				href="list_shoes.jsp" class="nav-item nav-link"><i
				class="fa fa-table me-2"></i>All shoes</a> <a href="orders.jsp"
				class="nav-item nav-link"><i class="fas fa-box me-2"></i>Orders</a>

		</div>
	</nav>
</div>
<!-- Sidebar End -->