
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="Header">
	<div id="HeaderUpper">


		<div id="TopMenu">
			<ul>
				<li style="display:" class="First"><a href=#>My Account</a></li>
				<li style="display:"><a href=#>Order Status</a></li>

				<li style="display:" class="CartLink"><a href=#>View Cart <span></span>
				</a></li>
				<li style="display:">
					<div>

						<sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
							<a href="<%=request.getContextPath()%>/login" onclick=''>Sign in</a>
													or 
						
						<a href="<%=request.getContextPath()%>/createUser" onclick=''>Create
								an account</a>
						</sec:authorize>
						<sec:authorize ifNotGranted="ROLE_ANONYMOUS">
							<a href="<c:url value="j_spring_security_logout" />">Sign out</a>
						</sec:authorize>


					</div>
				</li>
			</ul>
		</div>
		<div id="SearchForm">
			<form action="" method="get" onsubmit="">
				<label for="search_query">Search</label> <input type="text"
					name="search_query" id="search_query" class="Textbox"
					value="Search entire store" onclick="" /> <input type="image"
					src="http://cdn2.bigcommerce.com/rc71b9995f4a706510d16ad47d2472c26eb88e9bf/themes/ParallelLight/images/white/GoButton.gif"
					class="Button" />
			</form>
		</div>

		<div class="HTLine">
			<hr noshade size="1" color="grey">
		</div>
		<div id="Logo">
			<spring:url value="/static/images/Logo.jpg" var="LogoImage" />
			<a href=""><img src="${LogoImage}" border="0" id="LogoImage"
				alt="Presens Health Care" /></a>
		</div>

		<div class="HTLine">
			<hr noshade size="1" color="grey" />
		</div>
	</div>
</div>