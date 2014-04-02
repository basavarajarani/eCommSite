<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xml:lang="en" lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="fragments/headTag.jsp" />

</head>
<body>

	<jsp:include page="fragments/header.jsp" />
	<jsp:include page="fragments/SiteMenu.jsp" />
	<c:choose>
		<c:when test="${module eq 'WelcomePage'}">
			<jsp:include page="fragments/body.jsp" />
		</c:when>
		<c:when test="${module eq 'AccountCreationForm'}">
			<jsp:include page="fragments/accountForm.jsp" />
		</c:when>
		<c:when test="${module eq 'ProductCategoryBody'}">
			<jsp:include page="fragments/productCategoryNew.jsp" />
		</c:when>
		<c:when test="${module eq 'UserOperationsForm' }">
			<jsp:include page="fragments/adminUserNew.jsp"/>
		</c:when>
		<c:when test="${module eq 'ProductOperationsForm'}">
			<jsp:include page="fragments/product.jsp"/>
		</c:when>
	</c:choose>
	<jsp:include page="fragments/footer.jsp" />

</body>
</html>