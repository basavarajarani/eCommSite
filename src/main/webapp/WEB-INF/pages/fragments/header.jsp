
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="header">
	<div id="logo">
	<spring:url value="/static/images/Logo.jpg" var="LogoImage" />
		<img src="${LogoImage}" title="Your Store" alt="Your Store" width="120"
			height="90" />
	</div>
	<div id="cart">
		<div class="heading">
			<h4>Shopping Cart</h4>
			<a><span id="cart-total">0 item(s) - &#8377 0.00</span></a>
		</div>
		<div class="content">
			<div class="empty">Your shopping cart is empty!</div>
		</div>
	</div>
	<div id="search">
		<div class="button-search"></div>
		<input type="text" name="filter_name" value="Search"
			onclick="this.value = '';" onkeydown="this.style.color = '#000000';" />
	</div>
	<div id="welcomeuser">
		Welcome visitor you can <a href="<%=request.getContextPath()%>/login">login</a> or <a href="<%=request.getContextPath()%>/createUser">Sign up</a>.
	</div>
	<div class="links">
		<a href="#">Home</a><a href="#" id="wishlist-total">Wish List (0)</a><a
			href="#">My Account</a><a href="#">Shopping Cart</a><a href="#">Checkout</a>
	</div>
</div>