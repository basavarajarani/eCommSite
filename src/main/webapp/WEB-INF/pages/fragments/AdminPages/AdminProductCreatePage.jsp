<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<jsp:include page="AdminHeadTag.jsp" />
<spring:url value="/static/css/w2ui-1.3.2.min.css" var="w2uicss"/>
<link rel="stylesheet" type="text/css"
	href="${w2uicss }" />

<spring:url value="/static/js/w2ui-1.3.2.min.js" var="w2uijs"/>
<script type="text/javascript" src="${w2uijs}"></script>

</head>

<body>
	<jsp:include page="AdminNavBar.jsp" />
	<div class="container-fluid">
		<div class="row-fluid">

			<!--  Include the Left Menu Component -->
			<jsp:include page="AdminLeftMenu.jsp" />


			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="span10">
				<!-- content starts -->


				<div>
					<ul class="breadcrumb">
						<li><a href="#">Home</a> <span class="divider">/</span></li>
						<li><a href="#">Products</a><span class="divider">/</span></li>
						<li><a href="#">Create Product</a></li>
					</ul>
				</div>

				<jsp:include page="AdminProductCreateForm.jsp" />

				<jsp:include page="AdminFooter.jsp" />
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	<jsp:include page="AdminJSInclusions.jsp" />
</body>
</html>
