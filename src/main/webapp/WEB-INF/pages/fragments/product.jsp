<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:url value="getproductrecords" var="getproductrecords" />
<c:url value="addproductrecords" var="addproductrecords" />
<c:url value="editproductrecords" var="editproductrecords" />



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

<spring:url value="/static/css/productOperations.js" var="productOperationsJs" />
<script src="${productOperationsJs}"></script>

<div title="Image Chooser Dialog" id="ImageChoose" class="imagedialogue">
	<img src="<%=request.getContextPath()%>/static/images/Loading.gif"
		id="loadingimage" style="text-align:center;">
	<div id="photogalleryheading" style="text-align:center;">Select the Image</div>
	<div id="photopart">
		<div id="albumlist"></div>
		<div id="photolist"><ol id="selectable"></ol></div>
	</div>
</div>

<div id='jqgrid'>
	<table id='grid'></table>
	<div id='pager'></div>
	<div id="productbuttons" style="clear: both; margin: 10px 0 10px 10px;">
		<input type="button" id="AddProduct" Value="Add New Product" /> <input
			type="button" id="EditProduct" Value="View/Edit Product" /> <input
			type="button" id="DisableProduct" Value="Disable Product" /> <input
			type="button" id="SearchProduct" value="Search Product" />
	</div>
</div>
