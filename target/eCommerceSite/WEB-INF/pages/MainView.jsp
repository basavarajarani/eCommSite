<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html xml:lang="en" lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="fragments/headTag.jsp" />

</head>
<body>


	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<jsp:include page="fragments/adminHeader.jsp" />
	</sec:authorize>
	<sec:authorize access="hasAnyRole('ROLE_ANONYMOUS', 'ROLE_USER')">
		<div id="container">
			<jsp:include page="fragments/header.jsp" />
	</sec:authorize>
	<jsp:include page="fragments/SiteMenu.jsp" />
	<c:choose>
		<c:when test="${module eq 'WelcomePage'}">
			<jsp:include page="fragments/body.jsp" />
		</c:when>
		<c:when test="${module eq 'AccountCreationForm'}">
			<jsp:include page="fragments/accountForm.jsp" />
		</c:when>

		<c:when test="${module eq 'UserOperationsForm' }">
			<jsp:include page="fragments/adminUserNew.jsp" />
		</c:when>
		<c:when test="${module eq 'ProductOperationsForm'}">
			<jsp:include page="fragments/product.jsp" />
		</c:when>
		<c:when test="${module eq 'ProductCreationForm' }">
			<jsp:include page="fragments/ProductCreateForm.jsp" />
		</c:when>
		<c:when test="${module eq 'ProductsListingForm' }">
			<jsp:include page="fragments/ProductsListing.jsp" />
		</c:when>
	</c:choose>



	<sec:authorize access="hasAnyRole('ROLE_ANONYMOUS', 'ROLE_USER')">

		<jsp:include page="fragments/footer.jsp" />
		</div>
	</sec:authorize>
</body>
</html>