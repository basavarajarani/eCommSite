<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<jsp:include page="fragments/AdminPages/AdminHeadTag.jsp" />
</head>

<body ng-app="AdminApp">
	<jsp:include page="fragments/AdminPages/AdminNavBar.jsp" />
	<div class="container-fluid">
		<div class="row-fluid">

			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="span12" ng-view></div>
			<div id="content" class="span12">

			</div>
		</div>
		
	</div>
	<!--/.fluid-container-->
	<jsp:include page="fragments/AdminPages/AdminFooter.jsp" />

	<jsp:include page="fragments/AdminPages/AdminJSInclusions.jsp" />
	
</body>
</html>
