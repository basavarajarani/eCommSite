<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>

<meta charset="utf-8">
<title>Presens Health Care Administration Window</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Presens Health Care Administration Pages">
<meta name="author" content="Basavaraj Arani">

<!-- The styles -->

<spring:url value="/static/css/bootstrap-cerulean.css" htmlEscape="true"
	var="bootstrapceruleancss" />
<link id="bs-css" href="${bootstrapceruleancss}" rel="stylesheet">

<spring:url value="/static/css/my.css" htmlEscape="true" var="mycss"/>
<link href="${mycss}" rel="stylesheet"/>

<spring:url value="/static/js/jquery.js" htmlEscape="true"
	var="jqueryjs" />
<script src="${jqueryjs}"></script>

<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>


<spring:url value="/static/css/bootstrap-responsive.css"
	htmlEscape="true" var="bootstrapresponsivecss" />
<link href="${bootstrapresponsivecss}" rel="stylesheet">

<spring:url value="/static/css/prettify.css" htmlEscape="true"
	var="prettifycss" />
<link href="${prettifycss}" rel="stylesheet">

<spring:url value="/static/css/charisma-app.css" htmlEscape="true"
	var="charismaappcss" />
<link href="${charismaappcss}" rel="stylesheet" />

<spring:url value="/static/css/opa-icons.css" htmlEscape="true"
	var="opaiconscss" />
<link href="${opaiconscss}" rel="stylesheet" />

<spring:url value="/static/css/jquery.cleditor.css" htmlEscape="true" var="cleditorcss"/>
<link href="${cleditorcss}" rel="stylesheet"/>

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="img/favicon.ico">

</head>