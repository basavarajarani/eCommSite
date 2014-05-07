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
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
<spring:url value="/static/css/settings.css" var="settingscss" />
<link rel="stylesheet" href="${settingscss}" media="screen" />
<!-- Animate css -->
<spring:url value="/static/css/animate.min.css" var="animatecss" />
<link href="${animatecss}" rel="stylesheet">
<!-- Dropdown menu -->
<spring:url value="/static/css/ddlevelsmenu-base.css"
	var="ddlevelsmenucss" />
<link href="${ddlevelsmenucss}" rel="stylesheet">

<spring:url value="/static/css/ddlevelsmenu-topbar.css"
	var="ddlevelsmenutopbarcss" />
<link href="${ddlevelsmenutopbarcss}" rel="stylesheet">
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

<body>

	<!-- Shopping cart Modal -->
	<div class="modal fade" id="shoppingcart" tabindex="-1" role="dialog"
		aria-hidden="true">
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
								<th>Name</th>
								<th>Quantity</th>
								<th>Price</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="single-item.html">HTC One</a></td>
								<td>2</td>
								<td>$250</td>
							</tr>
							<tr>
								<td><a href="single-item.html">Apple iPhone</a></td>
								<td>1</td>
								<td>$502</td>
							</tr>
							<tr>
								<td><a href="single-item.html">Galaxy Note</a></td>
								<td>4</td>
								<td>$1303</td>
							</tr>
							<tr>
								<th></th>
								<th>Total</th>
								<th>$2405</th>
							</tr>
						</tbody>
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
							<a href="index.html">Presens Health Care</a>
						</h1>
					</div>
				</div>
				<div class="col-md-5 col-sm-4"></div>
				<div class="col-md-4 col-sm-4">
					<div class="kart-links">
						<a href="login.html">Login</a> <a href="register.html">Signup</a>
						<a data-toggle="modal" href="#shoppingcart"><i
							class="fa fa-shopping-cart"></i> 3 Items - $300</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Logo & Navigation ends -->


	<div id="menubarcontainer" style="background:#0FA6BC;">
	<div id="menubar" class="row" style="width:80%; margin-right:auto;margin-left:auto;">
		<ul id="main-menu" class="sm sm-blue">
			<li id="HomeMenu"><a href="index.html">Home</a></li>
			<li id="ProductsSubMenu"><a href="#">Products</a>
				<ul id="prodsubmenu"></ul></li>
			<li><a href="#">Service</a></li>

		</ul>
	</div>
	</div>
	<div class="clearfix"></div>

	<!-- Slider starts -->
	<div class="tp-banner-container">
		<div class="tp-banner">
			<ul>
				<!-- SLIDE  -->
				<li data-transition="fade" data-slotamount="7"
					data-masterspeed="2000">
					<!-- MAIN IMAGE --> 
					<img src="img/slider/rs-1.jpg" alt="" data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat"> 
					<!-- LAYERS --> <!-- LAYERS NR. 1 -->
					<div class="tp-caption customin largepinkbg lft" data-x="center"
						data-y="65"
						data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						data-speed="800" data-start="1200" data-easing="Back.easeOut"
						data-endspeed="400" data-endeasing="Back.easeIn"
						data-captionhidden="on" style="z-index: 1">Special Offer</div> 
					<!-- Layer 2 -->
					<div class="tp-caption skewfromleft" data-x="150" data-y="240"
						data-speed="500" data-start="3500" data-easing="Elastic.easeOut"
						data-endspeed="400" data-endeasing="Elastic.easeOut"
						data-captionhidden="off" style="z-index: 3">
						<img src="img/slider/1.png" class="img-responsive" alt="product" />
					</div> <!-- LAYERS NR. 3.1 -->
					<div class="tp-caption skewfromleft img-tag" data-x="150"
						data-y="225" data-speed="800" data-start="4000"
						data-easing="Elastic.easeOut" data-endspeed="400"
						data-endeasing="Elastic.easeOut" data-captionhidden="off"
						style="z-index: 4">$299</div> <!-- LAYERS NR. 4 -->
					<div class="tp-caption skewfromleft" data-x="330" data-y="210"
						data-speed="500" data-start="4300" data-easing="Elastic.easeOut"
						data-endspeed="400" data-endeasing="Elastic.easeOut"
						data-captionhidden="off" style="z-index: 4">
						<img src="img/slider/5.png" class="img-responsive" alt="product" />
					</div> <!-- LAYERS NR. 4.1 -->
					<div class="tp-caption skewfromleft img-tag" data-x="400"
						data-y="240" data-speed="800" data-start="4500"
						data-easing="Elastic.easeOut" data-endspeed="400"
						data-endeasing="Elastic.easeOut" data-captionhidden="off"
						style="z-index: 5">$889</div> <!-- LAYERS NR. 5 -->
					<div class="tp-caption skewfromleft" data-x="520" data-y="235"
						data-speed="500" data-start="4800" data-easing="Elastic.easeOut"
						data-endspeed="400" data-endeasing="Elastic.easeOut"
						data-captionhidden="off" style="z-index: 5">
						<img src="img/slider/3.png" class="img-responsive" alt="product" />
					</div> <!-- LAYERS NR. 5.1 -->
					<div class="tp-caption skewfromleft img-tag" data-x="540"
						data-y="240" data-speed="800" data-start="5100"
						data-easing="Elastic.easeOut" data-endspeed="400"
						data-endeasing="Elastic.easeOut" data-captionhidden="off"
						style="z-index: 6">$499</div> <!-- LAYERS NR. 6 -->
					<div class="tp-caption skewfromleft" data-x="690" data-y="245"
						data-speed="500" data-start="5400" data-easing="Elastic.easeOut"
						data-endspeed="400" data-endeasing="Elastic.easeOut"
						data-captionhidden="off" style="z-index: 5">
						<img src="img/slider/4.png" class="img-responsive" alt="product" />
					</div> <!-- LAYERS NR. 6.1 -->
					<div class="tp-caption skewfromleft img-tag" data-x="710"
						data-y="230" data-speed="800" data-start="5700"
						data-easing="Elastic.easeOut" data-endspeed="400"
						data-endeasing="Elastic.easeOut" data-captionhidden="off"
						style="z-index: 6">$25</div>
				</li>
<!-- 				SLIDE 
				<li data-transition="incube" data-slotamount="6"
					data-masterspeed="500">
					MAIN IMAGE <img src="img/slider/rs-3.jpg" alt=""
					data-bgfit="cover" data-bgposition="left center"
					data-bgrepeat="no-repeat"> LAYERS LAYER NR. 1
					<div class="tp-caption customin customout large_bold_white"
						data-x="20" data-y="120"
						data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
						data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						data-speed="1000" data-start="1200" data-easing="Back.easeInOut"
						data-endspeed="300" style="z-index: 1">Multi Brands</div> LAYER NR. 2
					<div class="tp-caption medium_light_white customin customout"
						data-x="20" data-y="190"
						data-customin="x:0;y:100;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:1;scaleY:3;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:0% 0%;"
						data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						data-speed="1000" data-start="2800" data-easing="Power4.easeOut"
						data-endspeed="500" data-endeasing="Power4.easeIn"
						data-captionhidden="on" style="z-index: 3">
						Bazaar, theme developers and everyday<br />slide-based displaying
						solution, thousands of<br /> people use and love!
					</div> LAYER NR. 3
					<div class="tp-caption customin customout" data-x="20" data-y="300"
						data-customin="x:0;y:100;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:1;scaleY:3;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:0% 0%;"
						data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						data-speed="800" data-start="3400" data-easing="Power4.easeOut"
						data-endspeed="500" data-endeasing="Power4.easeIn"
						data-captionhidden="on" style="z-index: 4">
						<a class="btn btn-danger black" href="#">Buy it Now for $50.99</a>
					</div> LAYER NR. 4
					<div class="tp-caption skewfromright customout" data-x="right"
						data-hoffset="-50" data-y="bottom"
						data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						data-speed="600" data-start="3800" data-easing="Power4.easeOut"
						data-endspeed="300" data-endeasing="Power1.easeIn"
						data-captionhidden="on" style="z-index: 5">
						<img class="img-responsive" src="img/slider/girl.png" alt="" />
					</div>
				</li>
 --><!-- 				SLIDE 
				<li data-transition="3dcurtain-vertical" data-slotamount="7"
					data-masterspeed="500">
					MAIN IMAGE <img src="img/slider/rs-2.jpg" alt=""
					data-bgfit="cover" data-bgposition="center center"
					data-bgrepeat="no-repeat" /> LAYERS LAYER NR. 1
					<div class="tp-caption lfr" data-x="right" data-hoffset="-40"
						data-y="90" data-speed="1200" data-start="1500"
						data-easing="Power4.easeOut" data-endspeed="300"
						data-endeasing="Power1.easeIn" data-captionhidden="on"
						style="z-index: 1">
						<img class="img-responsive" src="img/slider/s31.png" alt="" />
					</div> LAYER NR. 2
					<div class="tp-caption lfr" data-x="right" data-hoffset="-20"
						data-y="204" data-speed="1200" data-start="1800"
						data-easing="Power4.easeOut" data-endspeed="300"
						data-endeasing="Power1.easeIn" data-captionhidden="on"
						style="z-index: 2">
						<img class="img-responsive" src="img/slider/s32.png" alt="" />
					</div> LAYER NR. 3
					<div class="tp-caption lfr" data-x="right" data-hoffset="-370"
						data-y="252" data-speed="1200" data-start="2100"
						data-easing="Power4.easeOut" data-endspeed="300"
						data-endeasing="Power1.easeIn" data-captionhidden="on"
						style="z-index: 3">
						<img class="img-responsive" src="img/slider/s33.png" alt="" />
					</div> LAYER NR. 4
					<div class="tp-caption customin customout large_bold_white"
						data-x="20" data-y="120"
						data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
						data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						data-speed="1000" data-start="3000" data-easing="Back.easeInOut"
						data-endspeed="300" style="z-index: 4">Fully Responsive</div> LAYER NR. 5
					<div class="tp-caption medium_light_white customin customout"
						data-x="20" data-y="200"
						data-customin="x:0;y:100;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:1;scaleY:3;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:0% 0%;"
						data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						data-speed="1000" data-start="3800" data-easing="Power4.easeOut"
						data-endspeed="500" data-endeasing="Power4.easeIn"
						data-captionhidden="on" style="z-index: 5">
						Bazaar, theme developers and everyday<br />slide-based displaying
						solution, thousands of<br /> people use and love!
					</div> LAYER NR. 6
					<div class="tp-caption customin customout" data-x="20" data-y="300"
						data-customin="x:0;y:100;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:1;scaleY:3;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:0% 0%;"
						data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						data-speed="800" data-start="4400" data-easing="Power4.easeOut"
						data-endspeed="500" data-endeasing="Power4.easeIn"
						data-captionhidden="on" style="z-index: 6">
						<a class="btn btn-danger" href="#">Purchase Now</a>&nbsp; <a
							class="btn btn-info hidden-xs" href="#">Get Features</a>
					</div>
				</li>
 -->			</ul>
		</div>
	</div>
	<!-- Slider ends -->

	<!-- Hero starts -->

	<div class="hero">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Catchy title -->
					<h3>
						It<span class="color">'</span>s Lorem ipsum <span class="color">dolor</span>
						sit amet consectetur
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec tristique est sit amet diam interdum semper. Vestibulum
						condimentum ante urna, vel interdum odio accumsan id.</p>
				</div>
			</div>
			<div class="sep-bor"></div>
		</div>
	</div>

	<!-- Hero ends -->

	<!-- Items List starts -->

	<div class="shop-items blocky">
		<div class="container">

			<div class="row">
				<!-- Item #1 -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="item">
						<!-- Use the below link to put HOT icon -->
						<div class="item-icon">
							<span>HOT</span>
						</div>
						<!-- Item image -->
						<div class="item-image">
							<a href="single-item.html"><img src="img/items/2.png" alt=""
								class="img-responsive" /></a>
						</div>
						<!-- Item details -->
						<div class="item-details">
							<!-- Name -->
							<h5>
								<a href="single-item.html">HTC One V</a>
							</h5>
							<div class="clearfix"></div>
							<!-- Para. Note more than 2 lines. -->
							<p>Something about the product goes here. Not More than 2
								lines.</p>
							<hr />
							<!-- Price -->
							<div class="item-price pull-left">$360</div>
							<!-- Add to cart -->
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm">Add to Cart</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<!-- Item #2 -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="item">
						<!-- Item image -->
						<div class="item-image">
							<a href="single-item.html"><img src="img/items/3.png" alt=""
								class="img-responsive" /></a>
						</div>
						<!-- Item details -->
						<div class="item-details">
							<!-- Name -->
							<h5>
								<a href="single-item.html">Dell One V</a>
							</h5>
							<!-- Para. Note more than 2 lines. -->
							<p>Something about the product goes here. Not More than 2
								lines.</p>
							<hr />
							<!-- Price -->
							<div class="item-price pull-left">$264</div>
							<!-- Add to cart -->
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm">Add to Cart</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="item">
						<!-- Item image -->
						<div class="item-image">
							<a href="single-item.html"><img src="img/items/4.png" alt=""
								class="img-responsive" /></a>
						</div>
						<!-- Item details -->
						<div class="item-details">
							<!-- Name -->
							<h5>
								<a href="single-item.html">Cannon One V</a>
							</h5>
							<!-- Para. Note more than 2 lines. -->
							<p>Something about the product goes here. Not More than 2
								lines.</p>
							<hr />
							<!-- Price -->
							<div class="item-price pull-left">$160</div>
							<!-- Add to cart -->
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm">Add to Cart</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="item">
						<!-- Item image -->
						<div class="item-image">
							<a href="single-item.html"><img src="img/items/5.png" alt=""
								class="img-responsive" /></a>
						</div>
						<!-- Item details -->
						<div class="item-details">
							<!-- Name -->
							<h5>
								<a href="single-item.html">Apple One V</a>
							</h5>
							<!-- Para. Note more than 2 lines. -->
							<p>Something about the product goes here. Not More than 2
								lines.</p>
							<hr />
							<!-- Price -->
							<div class="item-price pull-left">$420</div>
							<!-- Add to cart -->
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm">Add to Cart</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="item">

						<!-- Item image -->
						<div class="item-image">
							<a href="single-item.html"><img src="img/items/6.png" alt=""
								class="img-responsive" /></a>
						</div>
						<!-- Item details -->
						<div class="item-details">
							<!-- Name -->
							<h5>
								<a href="single-item.html">Samsung One V</a>
							</h5>
							<!-- Para. Note more than 2 lines. -->
							<p>Something about the product goes here. Not More than 2
								lines.</p>
							<hr />
							<!-- Price -->
							<div class="item-price pull-left">$300</div>
							<!-- Add to cart -->
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm">Add to Cart</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="item">
						<div class="item-icon">
							<span>HOT</span>
						</div>
						<!-- Item image -->
						<div class="item-image">
							<a href="single-item.html"><img src="img/items/7.png" alt=""
								class="img-responsive" /></a>
						</div>
						<!-- Item details -->
						<div class="item-details">
							<!-- Name -->
							<h5>
								<a href="single-item.html">Micromax One V</a>
							</h5>
							<!-- Para. Note more than 2 lines. -->
							<p>Something about the product goes here. Not More than 2
								lines.</p>
							<hr />
							<!-- Price -->
							<div class="item-price pull-left">$240</div>
							<!-- Add to cart -->
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm">Add to Cart</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="item">
						<!-- Item image -->
						<div class="item-image">
							<a href="single-item.html"><img src="img/items/8.png" alt=""
								class="img-responsive" /></a>
						</div>
						<!-- Item details -->
						<div class="item-details">
							<!-- Name -->
							<h5>
								<a href="single-item.html">Nokia One V</a>
							</h5>
							<!-- Para. Note more than 2 lines. -->
							<p>Something about the product goes here. Not More than 2
								lines.</p>
							<hr />
							<!-- Price -->
							<div class="item-price pull-left">$50</div>
							<!-- Add to cart -->
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm">Add to Cart</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="item">
						<!-- Item image -->
						<div class="item-image">
							<a href="single-item.html"><img src="img/items/9.png" alt=""
								class="img-responsive" /></a>
						</div>
						<!-- Item details -->
						<div class="item-details">
							<!-- Name -->
							<h5>
								<a href="single-item.html">Sony One V</a>
							</h5>
							<!-- Para. Note more than 2 lines. -->
							<p>Something about the product goes here. Not More than 2
								lines.</p>
							<hr />
							<!-- Price -->
							<div class="item-price pull-left">$100</div>
							<!-- Add to cart -->
							<div class="pull-right">
								<a href="#" class="btn btn-danger btn-sm">Add to Cart</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Items List ends -->

	<!-- Catchy starts -->
	<div class="catchy blocky">
		<div class="catchy-inner1">
			<div class="catchy-inner2">
				<div class="container">
					<div class="row">
						<div class="col-md-5">
							<div class="catchy-subscribe">
								<h3>Join Us!</h3>
								<p>Lorem tristique est sit amet diam ipsum dolor sit diam
									interdum diam ipsum dolor sit diam ipsum dolor sit tristique
									semper.</p>
								<br />
								<form class="form-inline" role="form">
									<div class="form-group">
										<input type="text" class="form-control "
											id="exampleInputEmail2" placeholder="Enter your email">
									</div>
									<button type="submit" class="btn btn-danger">Subscribe</button>
								</form>

							</div>
						</div>
						<div class="col-md-7">

							<div class="report">
								<div class="report-bor">
									<div class="row">
										<!-- Report data starts -->
										<div class="col-md-4 col-sm-4">
											<div class="report-data">
												<div class="row">
													<div class="col-md-4 col-sm-4 col-xs-4">
														<!-- Icon -->
														<div class="report-icon">
															<i class="fa fa-group color"></i>
														</div>
													</div>
													<div class="col-md-8 col-md-8 col-xs-8">
														<!-- Details -->
														<span class="report-big color">40,000</span> <span>Customers</span>
													</div>
												</div>
											</div>
										</div>
										<!-- Report data ends -->

										<!-- Report data starts -->
										<div class="col-md-4 col-sm-4">
											<div class="report-data">
												<div class="row">
													<div class="col-md-4 col-sm-4 col-xs-4">
														<!-- Icon -->
														<div class="report-icon">
															<i class="fa fa-calendar color"></i>
														</div>
													</div>
													<div class="col-md-8 col-md-8 col-xs-8">
														<!-- Details -->
														<span>Since</span><span class="report-big color">1857</span>
													</div>
												</div>
											</div>
										</div>
										<!-- Report data ends -->

										<!-- Report data starts -->
										<div class="col-md-4 col-sm-4">
											<div class="report-data">
												<div class="row">
													<div class="col-md-4 col-sm-4 col-xs-4">
														<!-- Icon -->
														<div class="report-icon">
															<i class="fa fa-android color"></i>
														</div>
													</div>
													<div class="col-md-8 col-md-8 col-xs-8">
														<!-- Details -->
														<span class="report-big color">30,000</span> <span>Revenue</span>
													</div>
												</div>
											</div>
										</div>
										<!-- Report data ends -->

									</div>

									<hr class="hidden-xs">

									<div class="row">

										<!-- Report data starts -->
										<div class="col-md-4 col-sm-4">
											<div class="report-data">
												<div class="row">
													<div class="col-md-4 col-sm-4 col-xs-4">
														<!-- Icon -->
														<div class="report-icon">
															<i class="fa fa-building-o color"></i>
														</div>
													</div>
													<div class="col-md-8 col-md-8 col-xs-8">
														<!-- Details -->
														<span class="report-big color">150 +</span> <span>Companies</span>
													</div>
												</div>
											</div>
										</div>
										<!-- Report data ends -->

										<!-- Report data starts -->
										<div class="col-md-4 col-sm-4">
											<div class="report-data">
												<div class="row">
													<div class="col-md-4 col-sm-4 col-xs-4">
														<!-- Icon -->
														<div class="report-icon">
															<i class="fa fa-signal color"></i>
														</div>
													</div>
													<div class="col-md-8 col-md-8 col-xs-8">
														<!-- Details -->
														<span class="report-big color">50.60%</span> <span>Growth</span>
													</div>
												</div>
											</div>
										</div>
										<!-- Report data ends -->

										<!-- Report data starts -->
										<div class="col-md-4 col-sm-4">
											<div class="report-data">
												<div class="row">
													<div class="col-md-4 col-sm-4 col-xs-4">
														<!-- Icon -->
														<div class="report-icon">
															<i class="fa fa-truck color"></i>
														</div>
													</div>
													<div class="col-md-8 col-md-8 col-xs-8">
														<!-- Details -->
														<span class="report-big color">100 +</span> <span>Employees</span>
													</div>
												</div>
											</div>
										</div>
										<!-- Report data ends -->

									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Catchy ends -->

	<!-- Recent posts Starts -->

	<div class="recent-posts blocky">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Section title -->
					<div class="section-title">
						<h4>
							<i class="fa fa-desktop color"></i> &nbsp;Whats New
						</h4>
					</div>

					<div id="item-carousel" class="carousel slide" data-ride="carousel">

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<div class="row">
									<div class="col-md-3 col-sm-6">
										<!-- single item -->
										<div class="s-item">
											<!-- Image link -->
											<a href="single-item.html"> <img src="img/items/2.png"
												class="img-responsive" alt="" />
											</a>
											<!-- portfolio caption -->
											<div class="s-caption">
												<!-- heading and paragraph -->
												<h4>
													<a href="#">Finibus Bonorum</a>
												</h4>
												<p>Clintock, a Lat Hampden-Sydney College in Virginia.</p>
											</div>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="s-item">
											<a href="single-item.html"> <img src="img/items/3.png"
												class="img-responsive" alt="" />
											</a>
											<div class="s-caption">
												<h4>
													<a href="#">Finibus Bonorum</a>
												</h4>
												<p>Clintock, a Lat Hampden-Sydney College in Virginia.</p>
											</div>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="s-item">
											<a href="single-item.html"> <img src="img/items/4.png"
												class="img-responsive" alt="" />
											</a>
											<div class="s-caption">
												<h4>
													<a href="#">Finibus Bonorum</a>
												</h4>
												<p>Clintock, a Lat Hampden-Sydney College in Virginia.</p>
											</div>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="s-item">
											<a href="single-item.html"> <img src="img/items/5.png"
												class="img-responsive" alt="" />
											</a>
											<div class="s-caption">
												<h4>
													<a href="#">Finibus Bonorum</a>
												</h4>
												<p>Clintock, a Lat Hampden-Sydney College in Virginia.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-md-3 col-sm-6">
										<div class="s-item">
											<a href="single-item.html"> <img src="img/items/6.png"
												class="img-responsive" alt="" />
											</a>
											<div class="s-caption">
												<h4>
													<a href="#">Finibus Bonorum</a>
												</h4>
												<p>Clintock, a Lat Hampden-Sydney College in Virginia.</p>
											</div>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="s-item">
											<a href="single-item.html"> <img src="img/items/7.png"
												class="img-responsive" alt="" />
											</a>
											<div class="s-caption">
												<h4>
													<a href="#">Finibus Bonorum</a>
												</h4>
												<p>Clintock, a Lat Hampden-Sydney College in Virginia.</p>
											</div>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="s-item">
											<a href="single-item.html"> <img src="img/items/8.png"
												class="img-responsive" alt="" />
											</a>
											<div class="s-caption">
												<h4>
													<a href="#">Finibus Bonorum</a>
												</h4>
												<p>Clintock, a Lat Hampden-Sydney College in Virginia.</p>
											</div>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="s-item">
											<a href="single-item.html"> <img src="img/items/9.png"
												class="img-responsive" alt="" />
											</a>
											<div class="s-caption">
												<h4>
													<a href="#">Finibus Bonorum</a>
												</h4>
												<p>Clintock, a Lat Hampden-Sydney College in Virginia.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Controls -->
						<a class="left c-control" href="#item-carousel" data-slide="prev">
							<i class="fa fa-chevron-left"></i>
						</a> <a class="right c-control" href="#item-carousel"
							data-slide="next"> <i class="fa fa-chevron-right"></i>
						</a>

					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Recent posts Ends -->


	<!-- CTA Starts -->
	<div class="blocky">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cta">
						<div class="row">
							<div class="col-md-8 col-sm-8">
								<h5>
									<i class="fa fa-angle-right"></i> Lorem trist iquest <span
										class="color">siamet diam</span> ipsum dolor sitamt
								</h5>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="cta-buttons pull-right">
									<a href="#" class="btn btn-info btn-lg">Download</a> &nbsp; <a
										href="#" class="btn btn-danger btn-lg">Get It Now</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CTA Ends -->

	<!-- Clients starts -->
	<div class="clients blocky">
		<div class="container">

			<div class="row">
				<div class="col-md-2 col-sm-4 col-xs-12">
					<div class="client">
						<img src="img/clients/1.png" alt="" class="img-responsive" />
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-12">
					<div class="client">
						<img src="img/clients/1.png" alt="" class="img-responsive" />
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-12">
					<div class="client">
						<img src="img/clients/1.png" alt="" class="img-responsive" />
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-12">
					<div class="client">
						<img src="img/clients/4.png" alt="" class="img-responsive" />
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-12">
					<div class="client">
						<img src="img/clients/5.png" alt="" class="img-responsive" />
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-12">
					<div class="client">
						<img src="img/clients/6.png" alt="" class="img-responsive" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Clients ends -->

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
								<i class="fa fa-home color contact-icon"></i> #12, Plot No.14,
								Raj Karmara Street,
							</p>
							<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5th Stage, Koramangala,
								Madiwala,</p>
							<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Bangalore - 493922,
								Karananana.</p>
							<p>
								<i class="fa fa-phone color contact-icon"></i> +94-948-323-5532
							</p>
							<p>
								<i class="fa fa-envelope color contact-icon"></i> <a
									href="mailto:something@gmail.com">some.thing@gmail.com</a>
							</p>
						</div>

					</div>
				</div>

			</div>



			<hr />

			<div class="copy text-center">
				Copyright 2013 &copy; - <a
					href="http://responsivewebinc.com/bootstrap-themes">Bootstrap
					Themes</a>
			</div>
		</div>
	</footer>
	<!-- Footer ends -->

	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>

	<!-- Javascript files -->
	<!-- jQuery -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
	<spring:url value="/static/js/jquery.themepunch.plugins.min.js"
		var="jquerythemepunchjs" />
	<script src="${jquerythemepunchjs}"></script>
	<spring:url value="/static/js/jquery.themepunch.revolution.min.js"
		var="jquerythemepunchrevolutionjs" />
	<script src="${jquerythemepunchrevolutionjs}"></script>
	<!-- Dropdown menu -->
	<spring:url value="/static/js/ddlevelsmenu.js" var="ddlevelsmenujs" />
	<script src="${ddlevelsmenujs}"></script>
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
	<spring:url value="/static/js/jquery.smartmenus.min.js"
		var="jQuerySmartMenuJs" />
	<!-- SmartMenus jQuery plugin -->
	<script type="text/javascript" src="${jQuerySmartMenuJs}"></script>
	<script>
		/* JS for SLIDER REVOLUTION */
		jQuery(document).ready(function() {
			jQuery('.tp-banner').revolution({
				delay : 9000,
				startheight : 450,

				hideThumbs : 10,

				navigationType : "none",

				hideArrowsOnMobile : "on",

				touchenabled : "on",
				onHoverStop : "on",

				navOffsetHorizontal : 0,
				navOffsetVertical : 20,

				stopAtSlide : -1,
				stopAfterLoops : -1,

				shadow : 0,

				fullWidth : "on",
				fullScreen : "off"
			});
		});
	</script>
</body>
</html>