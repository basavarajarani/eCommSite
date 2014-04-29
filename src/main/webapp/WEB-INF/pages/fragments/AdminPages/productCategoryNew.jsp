<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:url value="productcategoryrecords" var="recordsUrl" />

<spring:url value="/static/css/jquery-ui.css" var="jqueryuicss" />
<link rel="stylesheet" href="${jqueryuicss}" />



<spring:url value="/static/js/jquery-ui.js" var="jqueryuijs" />
<script src="${jqueryuijs}"></script>

<spring:url value="/static/css/my.css" var="myCss" />
<link href="${myCss }" media="all" type="text/css" rel="stylesheet" />



<spring:url value="/static/css/ui.jqgrid.css" var="uijqgridcss" />
<link rel="stylesheet" type="text/css" media="screen"
	href="http://www.trirand.com/blog/jqgrid/themes/ui.jqgrid.css" />

<spring:url value="/static/css/ui.multiselect.css"
	var="uimultiselectcss" />
<link rel="stylesheet" type="text/css" media="screen"
	href="http://www.trirand.com/blog/jqgrid/themes/ui.multiselect.css" />

<div class="row-fluid">
	<div id='jqgrid' class="span12">
		<table id='grid'></table>
		<div id='pager'></div>
		<div id="productcategorybuttons"
			style="clear: both; margin: 10px 0 10px 10px;">
			<input type="button" id="AddProductCategory"
				Value="Add Product Category" /> <input type="button"
				id="EditProductCategory" Value="Edit Product Category" /> <input
				type="button" id="DeleteProductCategory"
				Value="Delete Product Category" /> <input type="button"
				id="SearchProductCategory" value="Search Product Category" />
		</div>
	</div>
</div>



<!-- Java Script Inclusions -->


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

<spring:url value="/static/js/jquery.contextmenu.js"
	var="jquerycontextmenujs" />
<script src="${jquerycontextmenujs}" type="text/javascript"></script>

<spring:url value="/static/js/ProductCategory.js"
	var="productcategoryjs" />
<script src="${productcategoryjs}" type="text/javascript"></script>