<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<link rel="stylesheet" type="text/css" media="screen"
	href="http://www.trirand.com/blog/jqgrid/themes/redmond/jquery-ui-custom.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="http://www.trirand.com/blog/jqgrid/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="http://www.trirand.com/blog/jqgrid/themes/ui.multiselect.css" />

<spring:url value="/static/css/ui.multiselect.css"
	var="uimultiselectcss" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${uimultiselectcss}" />

<spring:url value="/static/js/productOperations.js"
	var="productOperationsJs" />
<script src="${productOperationsJs}"></script>


<div class="row">
	<div id='jqgrid' class="span12">
		<table id='grid'></table>
		<div id='pager'></div>
	</div>
</div>

<spring:url value="/static/js/jquery.layout.js" var="jquerylayoutjs" />
<script src="${jquerylayoutjs}" type="text/javascript"></script>

<spring:url value="/static/js/grid.locale-en.js" var="gridlocaleenjs" />
<script src="${gridlocaleenjs}" type="text/javascript"></script>

<script type="text/javascript">
	$.jgrid.no_legacy_api = true;
	$.jgrid.useJSON = true;
</script>

<spring:url value="/static/js/ui.multiselect.js" var="uimultiselectjs" />
<script src="${uimultiselectjs}" type="text/javascript"></script>

<spring:url value="/static/js/jquery.jqGrid.js" var="jqueryjqgridjs" />
<script src="${jqueryjqgridjs}" type="text/javascript"></script>

<spring:url value="/static/js/jquery.tablednd.js" var="jquerytabledndjs" />
<script src="${jquerytabledndjs}" type="text/javascript"></script>
