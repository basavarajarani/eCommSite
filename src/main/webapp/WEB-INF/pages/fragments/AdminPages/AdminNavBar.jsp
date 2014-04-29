
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- topbar starts -->
<div class="navbar">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse"> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a> <a class="brand pull-left" href="index.html"> <span>Presens
					Health Care</span></a>

			<!-- user dropdown starts -->
			<div class="btn-group pull-right">
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="icon-user"></i><span class="hidden-phone"> <sec:authentication
							property="principal.username" /></span> <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">Profile</a></li>
					<li class="divider"></li>
					<li><a href="<%=request.getContextPath()%>/<c:url value="j_spring_security_logout" />">Logout</a></li>
				</ul>
			</div>
			<!-- user dropdown ends -->

			<div class="top-nav nav-collapse">
				<ul class="nav">
					<li><a href="#">Visit Site</a></li>
					<li>
						<form class="navbar-search pull-left">
							<input placeholder="Search" class="search-query span2"
								name="query" type="text">
						</form>
					</li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>
<!-- topbar ends -->
