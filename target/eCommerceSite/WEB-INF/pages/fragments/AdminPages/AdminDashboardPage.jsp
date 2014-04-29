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
						<li><a href="#">Dashboard</a></li>
					</ul>
				</div>
				<div class="sortable row-fluid">
					<a data-rel="tooltip" title="6 new members."
						class="well span3 top-block" href="#"> <span
						class="icon32 icon-red icon-user"></span>
						<div>Total Users</div>
						<div>507</div> <span class="notification">6</span>
					</a> <a data-rel="tooltip" title="4 new pro members."
						class="well span3 top-block" href="#"> <span
						class="icon32 icon-color icon-star-on"></span>
						<div>This Month's Sales</div>
						<div>228</div> <span class="notification green">4</span>
					</a> <a data-rel="tooltip" title="$34 new sales."
						class="well span3 top-block" href="#"> <span
						class="icon32 icon-color icon-cart"></span>
						<div>This Year's Sales</div>
						<div>$13320</div> <span class="notification yellow">$34</span>
					</a> <a data-rel="tooltip" title="12 new messages."
						class="well span3 top-block" href="#"> <span
						class="icon32 icon-color icon-envelope-closed"></span>
						<div>Messages</div>
						<div>25</div> <span class="notification red">12</span>
					</a>
				</div>






				<hr>

				<jsp:include page="AdminFooter.jsp" />
			</div>
		</div>
	</div>
	<!--/.fluid-container-->

	<jsp:include page="AdminJSInclusions.jsp" />
</body>
</html>
