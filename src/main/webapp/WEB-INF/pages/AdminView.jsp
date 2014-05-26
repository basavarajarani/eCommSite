<!DOCTYPE html >
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xml:lang="en" lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>

	<c:choose>
		<c:when test="${module eq 'Dashboard'}">
			<jsp:include page="fragments/AdminPages/AdminDashboardPage.jsp" />
		</c:when>
		<c:when test="${module eq 'AccountCreationForm'}">
			<jsp:include page="fragments/accountForm.jsp" />
		</c:when>
		<c:when test="${module eq 'ProductCategory'}">
			<jsp:include
				page="fragments/AdminPages/AdminProductCategoriesPage.jsp" />
		</c:when>
		<c:when test="${module eq 'UserOperationsForm' }">
			<jsp:include page="fragments/AdminPages/AdminUserPage.jsp" />
		</c:when>
		<c:when test="${module eq 'ProductOperationsForm'}">
			<jsp:include page="fragments/AdminPages/AdminProductsPage.jsp" />
		</c:when>
		<c:when test="${module eq 'ProductCreationPage'}">
			<jsp:include page="fragments/AdminPages/AdminProductCreatePage.jsp" />
		</c:when>
		<c:when test="${module eq 'FeaturedProductsPage'}">
			<jsp:include page="fragments/AdminPages/AdminFeaturedProductsPage.jsp"/>
		</c:when>
	</c:choose>
</body>
</html>