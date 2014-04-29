
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="Header">
		<div id="adminHeading">
			<div id="companytext" style="clear: both; float: left;margin:10px 0 0 10px;">
				Presens Health Care | Administration</div>
			<div id="loginnamestatus" style="float: right; margin: 10px 10px 0 0;">
				<sec:authorize ifNotGranted="ROLE_ANONYMOUS">
					You are logged in as <sec:authentication property="principal.username" />
				</sec:authorize>
				
				
			</div>
		</div>
</div>