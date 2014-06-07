<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Title here -->
<title>Presens Health Care</title>
<!-- Description, Keywords and Author -->
<meta name="description" content="Your description">
<meta name="keywords" content="Your,Keywords">
<meta name="author" content="ResponsiveWebInc">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Styles -->
<!-- Bootstrap CSS -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
<spring:url value="/static/css/settings.css" var="settingscss" />
<link rel="stylesheet" href="${settingscss}" media="screen" />
<!-- Animate css -->
<spring:url value="/static/css/animate.min.css" var="animatecss" />
<link href="${animatecss}" rel="stylesheet">

<!-- Countdown -->
<spring:url value="/static/css/jquery.countdown.css"
	var="jquerycountdowncss" />
<link href="${jquerycountdowncss}" rel="stylesheet">
<!-- Font awesome CSS -->
<spring:url value="/static/css/font-awesome.min.css"
	var="fontawesomecss" />
<link href="${fontawesomecss}" rel="stylesheet">
<!-- Custom CSS -->
<spring:url value="/static/css/style.css" var="stylecss" />
<link href="${stylecss}" rel="stylesheet">

<link rel="stylesheet"
	href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />

<!-- Favicon -->
<link rel="shortcut icon" href="#">

<!-- SmartMenus core CSS (required) -->
<spring:url value="/static/css/sm-core-css.css" htmlEscape="true"
	var="smCoreCss" />
<link href="${smCoreCss}" rel="stylesheet" type="text/css" />
<spring:url value="/static/css/sm-blue.css" htmlEscape="true"
	var="smBlueCss" />

<link href="${smBlueCss }" rel="stylesheet" type="text/css" />

<!-- #main-menu config - instance specific stuff not covered in the theme -->
<style type="text/css">
#main-menu {
	position: relative;
	z-index: 5555;
	width: auto;
	background: none repeat scroll 0% 0% #0FA6BC;
}

#main-menu ul {
	width: 12em;
	/* fixed width only please - you can use the "subMenusMinWidth"/"subMenusMaxWidth" script options to override this if you like */
}
</style>

</head>

<body ng-app="PHCApp">

	<!-- Shopping cart Modal -->
	<div class="modal fade" id="shoppingcart" tabindex="-1" role="dialog"
		aria-hidden="true" ng-controller="ShoppingCartController"
		style="position: absolute; overflow-y: auto;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Shopping Cart</h4>
				</div>
				<div class="modal-body">

					<!-- Items table -->
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Cart Items</th>
								<th>Qty</th>
								<th>Item Price</th>
								<th>Item Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="item in shoppingcartlist()">
								<td><a href="single-item.html">{{item.name}}</a></td>
								<td><input my-directive class="spinner" type="text"
									name="{{item.id}}" ng-model="item.quantity"
									ng-change="update()" style="width: 20px;"></td>
								<td>&#36;{{item.price}}</td>
								<td>&#36;{{item.total}}</td>
								<td>
									<div>
										<a data-productid="{{item.id}}" class="removeitem"
											target="_blank" ng-click="removeItem($event)"><span
											data-productid="{{item.id}}"
											class="glyphicon glyphicon-trash"></span></a>
									</div>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td>Subtotal:</td>
								<td id="cartsubtotal">&#36;{{shoppingCartTotal()}}</td>
								<td></td>
							</tr>
						</tfoot>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Continue
						Shopping</button>
					<button type="button" class="btn btn-info">Checkout</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Logo & Navigation starts -->

	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-4">
					<!-- Logo -->
					<div class="logo">
						<h1>
							<a href="#index.html">Presens Health Care</a>
						</h1>
					</div>
				</div>
				<div class="col-md-5 col-sm-4"></div>
				<div class="col-md-4 col-sm-4">
					<div class="kart-links" ng-controller="ViewCartController">
						<a href="#loginregister"><span
							class="glyphicon glyphicon-user"></span> MyAccount</a><a
							id="viewcartcount" data-toggle="modal"
							data-target="#shoppingcart" ng-click="updateViewCart()"> <span
							id="viewcartcountspan" class="glyphicon glyphicon-shopping-cart">0
								Items - $0</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Logo & Navigation ends -->

	<div id="maincontainer"
		style="width: 80%; margin-right: auto; margin-left: auto;">
		<div id="menubarcontainer" style="background: #0FA6BC;">
			<div id="menubar">
				<ul id="main-menu" class="sm sm-blue">
					<li id="HomeMenu"><a href="#index.html"><span
							class="glyphicon glyphicon-home"> </span> Home</a></li>
					<li id="ProductsSubMenu"><a href="#"><span
							class="glyphicon glyphicon-tags"></span> Products</a>
						<ul id="prodsubmenu"></ul></li>
					<li><a href="#"><span class="glyphicon glyphicon-wrench"></span>
							Service</a></li>
					<li><a href="#"><span
							class="glyphicon glyphicon-info-sign"></span> About Us</a></li>
					<li class="pull-right">
						<form class="form-inline" role="search" style="padding:5px;">
							<div class="form-group">
								<label class="sr-only" for="searchtext">Search</label> 
								<input type="text" id="searchtext" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default btn-xs"><span class=" glyphicon glyphicon-search"></span></button>
						</form>
					</li>

				</ul>
			</div>
		</div>
		<div class="clearfix"></div>

		<div ng-view></div>


	</div>

	<!-- Footer starts -->
	<footer>
		<div class="container">

			<div class="row">

				<div class="col-md-4 col-sm-4">
					<div class="fwidget">

						<h4>
							Oslon de<span class="color">'</span> Techno
						</h4>
						<hr />
						<p>Duis leo risus, vehicula luctus nunc. Quiue rhoncus, a
							sodales enim arcu quis turpis. Duis leo risus, condimentum ut
							posuere ac, vehicula luctus nunc. Quisque rhoncus, a sodales enim
							arcu quis turpis.</p>

						<div class="social">
							<a href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a
								href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a
								href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a> <a
								href="#" class="pinterest"><i class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-4">
					<div class="fwidget">
						<h4>Categories</h4>
						<hr />
						<ul>
							<li><a href="#">Sed eu leo orci, condimentum gravida
									metus</a></li>
							<li><a href="#">Etiam at nulla ipsum, in rhoncus purus</a></li>
							<li><a href="#">Fusce vel magna faucibus felis dapibus
									facilisis</a></li>
							<li><a href="#">Vivamus scelerisque dui in massa</a></li>
							<li><a href="#">Pellentesque eget adipiscing dui semper</a></li>
						</ul>
					</div>
				</div>



				<div class="col-md-4 col-sm-4">
					<div class="fwidget">

						<h4>Get In Touch</h4>
						<hr />
						<div class="address">
							<p>
								<i class="fa fa-home color contact-icon"></i> 23 Grace Park
								Avenue
							</p>
							<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Springvale 3171</p>
							<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Victoria, Australia</p>
							<p>
								<i class="fa fa-phone color contact-icon"></i> +61 435879852
							</p>
							<p>
								<i class="fa fa-envelope color contact-icon"></i> <a
									href="mailto:sales.support@presenshealthcare.com.au">sales.support@presenshealthcare.com.au</a>
							</p>
						</div>

					</div>
				</div>

			</div>



			<hr />

			<div class="copy text-center">
				Copyright 2014 &copy; - <a href="#">Presens Health Care</a>
			</div>
		</div>
	</footer>
	<!-- Footer ends -->

	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>

	<!-- Javascript files -->
	<!-- jQuery -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
	<spring:url value="/static/js/jquery.themepunch.plugins.min.js"
		var="jquerythemepunchjs" />
	<script src="${jquerythemepunchjs}"></script>
	<spring:url value="/static/js/jquery.themepunch.revolution.min.js"
		var="jquerythemepunchrevolutionjs" />
	<script src="${jquerythemepunchrevolutionjs}"></script>
	<!-- Countdown -->
	<spring:url value="/static/js/jquery.countdown.min.js"
		var="jquerycountdownjs" />
	<script src="${jquerycountdownjs}"></script>
	<!-- jQuery Navco -->
	<spring:url value="/static/js/jquery.navgoco.min.js"
		var="jquerynavgocojs" />
	<script src="${jquerynavgocojs}"></script>
	<!-- Filter for support page -->
	<spring:url value="/static/js/filter.js" var="filterjs" />
	<script src="${filterjs}"></script>
	<!-- Respond JS for IE8 -->
	<spring:url value="/static/js/respond.min.js" var="respondjs" />
	<script src="${respondjs}"></script>
	<!-- HTML5 Support for IE -->
	<spring:url value="/static/js/html5shiv.js" var="html5shivjs" />
	<script src="${html5shivjs}"></script>
	<!-- Custom JS -->
	<spring:url value="/static/js/custom.js" var="customjs" />
	<script src="${customjs}"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.7/angular.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.7/angular-route.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.7/angular-sanitize.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

	<spring:url value="/static/js/bootstrap.touchspin.js" var="touchspinjs" />
	<script type="text/javascript" src="${touchspinjs }"></script>

	<spring:url value="/static/js/StoreCart.js" var="storecartjs" />
	<script type="text/javascript" src="${storecartjs }"></script>
	<spring:url value="/static/js/phcmvw.js" var="phcmvwjs" />
	<script src="${phcmvwjs}"></script>

	<spring:url value="/static/js/jquery.smartmenus.min.js"
		var="jQuerySmartMenuJs" />
	<!-- SmartMenus jQuery plugin -->
	<script type="text/javascript" src="${jQuerySmartMenuJs}"></script>



</body>
</html>