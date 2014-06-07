<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<jsp:include page="AdminHeadTag.jsp" />
</head>

<body>
	<jsp:include page="AdminNavBar.jsp" />
	<div class="container">
		<div class="row">

			<!--  Include the Left Menu Component -->
			<jsp:include page="AdminLeftMenu.jsp" />


			<noscript>
				<div class="alert alert-block span12">
					<h4 class="alert-heading">Warning!</h4>
					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="span12">
				<!-- content starts -->


				<div>
					<ul class="breadcrumb">
						<li><a href="#">Home</a> <span class="divider">/</span></li>
						<li><a href="#">Products</a></li>
					</ul>
				</div>

				<div class="row">
					<div class="span12">
						<div class="btn-group pull-right">
							<button id="AddNewProduct" class="btn">Add Product</button>
							<button id="EditCurrentProduct" class="btn">Edit Product</button>
							<button id="DeleteCurrentProduct" class="btn">Delete
								Product</button>
						</div>
					</div>
				</div>

				<jsp:include page="AdminProductsGrid.jsp" />

				<jsp:include page="AdminFooter.jsp" />
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	<jsp:include page="AdminJSInclusions.jsp" />
	<spring:url value="/static/js/productOperations.js"
		var="productoperationsjs" />
	<script src="${productoperationsjs}"></script>
</body>
</html>
