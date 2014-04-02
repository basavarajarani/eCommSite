<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:url value="productcategoryrecords" var="recordsUrl" />



<spring:url value="/static/js/jquery.layout.js" var="jquerylayoutjs"/>
<script src="${jquerylayoutjs}"	type="text/javascript"></script>

<spring:url value="/static/js/grid.locale-en.js" var="gridlocaleenjs"/>
<script src="${gridlocaleenjs}"	type="text/javascript"></script>

<script type="text/javascript">
	$.jgrid.no_legacy_api = true;
	$.jgrid.useJSON = true;
</script>

<spring:url value="/static/js/ui.multiselect.js" var="uimultiselectjs"/>
<script src="${uimultiselectjs}" type="text/javascript"></script>

<spring:url value="/static/js/jquery.jqGrid.js" var="jqueryjqgridjs"/>
<script src="${jqueryjqgridjs}" type="text/javascript"></script>

<spring:url value="/static/js/jquery.tablednd.js" var="jquerytabledndjs"/>
<script src="${jquerytabledndjs}" type="text/javascript"></script>

<spring:url value="/static/js/jquery.contextmenu.js" var="jquerycontextmenujs"/>
<script	src="${jquerycontextmenujs}" type="text/javascript"></script>

<spring:url value="/static/css/jquery-ui-custom.css" var="jqueryuicustomcss"/>
<link rel="stylesheet" type="text/css" media="screen" href="http://www.trirand.com/blog/jqgrid/themes/redmond/jquery-ui-custom.css" />

<spring:url value="/static/css/ui.jqgrid.css" var="uijqgridcss"/>
<link rel="stylesheet" type="text/css" media="screen"
	href="http://www.trirand.com/blog/jqgrid/themes/ui.jqgrid.css" />
	
<spring:url value="/static/css/ui.multiselect.css" var="uimultiselectcss"/>
<link rel="stylesheet" type="text/css" media="screen"
	href="http://www.trirand.com/blog/jqgrid/themes/ui.multiselect.css" />

<script type='text/javascript'>
	$(function() {

		$("#grid").jqGrid({
			url : '${recordsUrl}',
			datatype : 'json',
			mtype : 'GET',
			colNames : [ 'Id', 'Category Name', 'Category Hierarchy' ],
			colModel : [ {
				name : 'id',
				index : 'id',
				width : 55,
				editable : false,
				hidden : true
			}, {
				name : 'categoryname',
				index : 'categoryname',
				width : 100,
				editable : true
			}, {
				name : 'categoryhierarchy',
				index : 'categoryhierarchy',
				width : 100,
				editable : true,
				search : false
			} ],
			rowNum : 10,
			rowList : [ 10, 20, 40, 60 ],
			height : 240,
			autowidth : true,
			rownumbers : true,
			pager : '#pager',
			sortname : 'id',
			viewrecords : true,
			sortorder : "asc",
			caption : "Product Category",
			emptyrecords : "Empty records",
			loadonce : false,
			jsonReader : {
				root : "rows",
				page : "page",
				total : "total",
				records : "records",
				repeatitems : false,
				cell : "cell",
				id : "id"
			}
		});
		
		$("#grid").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : true, defaultSearch:"cn"});
		
		$("#AddProductCategory")
				.click(
						function() {

							var categories = "";
							$
									.ajax({
										url : "get_productCategory_list",
										success : function(result) {

											for ( var i = 0; i < result.length; i++) {
												if (i == result.length - 1)
													categories += result[i]
															+ ":" + result[i];
												else
													categories += result[i]
															+ ":" + result[i]
															+ ";";
											}
											var currentdate = new Date();
											var datetime = "Last Sync: "
													+ currentdate.getDay()
													+ "/"
													+ currentdate.getMonth()
													+ "/"
													+ currentdate.getFullYear()
													+ " @ "
													+ currentdate.getHours()
													+ ":"
													+ currentdate.getMinutes()
													+ ":"
													+ currentdate.getSeconds();
											console
													.log("ajax time:"
															+ datetime);
											$("#grid").jqGrid('setColProp',
													'categoryhierarchy', {
														edittype : "select",
														editoptions : {
															value : categories
														}
													});

											$("#grid")
													.jqGrid(
															'editGridRow',
															'new',

															{
																url : 'createProductCategory',
																height : 150,
																width : 500,
																reloadAfterSubmit : true,
																recreateForm : true,
																closeAfterAdd : true,
																afterSubmit : function(
																		response,
																		postdata) {
																	var result = eval('('
																			+ response.responseText
																			+ ')');
																	var errors = "";

																	if (result.success == false) {
																		for ( var i = 0; i < result.message.length; i++) {
																			errors += result.message[i]
																					+ "<br/>";
																		}
																	} else {
																		$(
																				'#msgbox')
																				.text(
																						'Entry has been added successfully');
																		$(
																				'#msgbox')
																				.dialog(
																						{
																							title : 'Success',
																							modal : true,
																							buttons : {
																								"Ok" : function() {
																									$(
																											this)
																											.dialog(
																													"close");
																								}
																							}
																						});
																	}
																	// only used for adding new records
																	var newId = null;

																	return [
																			result.success,
																			errors,
																			newId ];
																}
															});

										}

									});

						});

	});
	
	("#SearchProductCategory").click( function () {
		jQuery("#grid").jqGrid('searchGrid',
				{sopt:['cn','bw','eq','ne','lt','gt','ew']}
			);
		
	});
</script>

<div id='jqgrid'>
	<table id='grid'></table>
	<div id='pager'></div>
	<div id="productcategorybuttons" style="clear:both; margin:10px 0 10px 10px;">
		<input type="button" id="AddProductCategory"
			Value="Add Product Category" /> 
		<input type="button"
			id="EditProductCategory" Value="Edit Product Category" /> 
		<input
			type="button" id="DeleteProductCategory"
			Value="Delete Product Category" />
			
		<input type="button" id="SearchProductCategory" value="Search Product Category"/>
	</div>
</div>
