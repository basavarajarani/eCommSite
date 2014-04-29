$(function() {
	
	$(window).bind('resize',function(){
	
		
		// Upon window resize set the width of the grid to the width of the parent "div"
		var jqgridwidth = $("#jqgrid").width();
		
		$("#grid").jqGrid('setGridWidth', jqgridwidth -1 );
		console.log("testlog :" + $("#grid").width());
	});

	$("#grid").jqGrid({
		url : 'productcategoryrecords',
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
	$("#SearchProductCategory").click( function () {
		jQuery("#grid").jqGrid('searchGrid',
				{sopt:['cn','bw','eq','ne','lt','gt','ew']}
		);

	});

});


