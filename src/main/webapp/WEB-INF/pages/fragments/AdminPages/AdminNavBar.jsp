
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
					<li><a
						href="<%=request.getContextPath()%>/<c:url value="j_spring_security_logout" />">Logout</a></li>
				</ul>
			</div>
			<div class="nav-collapse">
				<ul class="nav	">
					<li><a class="ajax-link" href="<%=request.getContextPath()%>"><i
							class="fa fa-dashboard"></i><span class="hidden-tablet">
								Dashboard</span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-tags"></i>Catalog <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a class="ajax-link"
								href="<%=request.getContextPath()%>/createProductCategory"><i
									class="fa fa-tags"></i><span class="hidden-tablet">
										Product Categories</span></a></li>
							<li><a class="ajax-link"
								href="<%=request.getContextPath()%>/productoperations"><i
									class="fa fa-tags"></i><span class="hidden-tablet">
										Products</span></a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class="fa fa-shopping-cart"></i> Sales <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a class="ajax-link" href="#"><i
									class="fa fa-shopping-cart"></i><span class="hidden-tablet"> Orders</span></a></li>
							<li><a class="ajax-link" href="#"><i class="fa fa-file-text-o"></i> Invoices</a></li>
							<li><a class="ajax-link" href="#"><i class="fa fa-truck"></i> Returns</a></li>
							<li><a class="ajax-link" href="#"><i class="fa fa-gift"></i> Coupons</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-gears"></i> System <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a class="ajax-link"
								href="<%=request.getContextPath()%>/useroperations"><i
									class="fa fa-users"></i><span class="hidden-tablet"> Users</span></a></li>
							<li><a class="ajax-link" href="#"><i class="fa fa-google"></i> Google Settings</a></li>
							<li><a
								href="<%=request.getContextPath()%>/SliderDesignerPage"><i class="fa fa-code"></i> Slider
									Designer</a></li>
						</ul></li>
				</ul>
				<!-- 				<ul class="nav">
					<li class="dropdown"><a href="category.html"
						class="dropdown-toggle" data-toggle="dropdown">Dashboard <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="listings.html">PC</a></li>
							<li><a href="listings.html">Mac</a></li>
							<li class="divider"></li>
							<li class="nav-header">Accessories</li>
							<li><a href="listings.html">Keyboard</a></li>
							<li><a href="listings.html">Speakers</a></li>
						</ul></li>
					<li><a href="category.html">Laptops</a></li>

					<li><a href="category.html">Components</a></li>
					<li><a href="category.html">Tablets</a></li>
					<li class="dropdown"><a href="category.html"
						class="dropdown-toggle" data-toggle="dropdown">Software <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="listings.html">Business & Office</a></li>
							<li><a href="listings.html">Children's Fun & Learning</a></li>
							<li><a href="listings.html"> Digital Imaging</a></li>
							<li class="divider"></li>
							<li class="nav-header">PC Games</li>
							<li><a href="listings.html">Action & Shooter</a></li>
							<li><a href="listings.html">Adventure</a></li>
							<li><a href="listings.html">Fighting</a></li>
						</ul></li>
					<li><a href="listings.html">Phones &amp; PDAs</a></li>

				</ul>
 -->
			</div>
			<!-- /.nav-collapse -->
			<!-- user dropdown ends -->
			<!--/.nav-collapse -->
		</div>
	</div>
</div>
<!-- topbar ends -->
<!-- /navbar -->
<!-- end nav -->
