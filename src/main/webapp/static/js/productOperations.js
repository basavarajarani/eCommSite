

$(function() {

	$("#AddNewProduct").click(function(){
		window.location.href="productCreationPage?cmd=New";
	});

	$("#EditCurrentProduct").click(function(){

		// Get the selected row record id
		var row = $("#grid").jqGrid('getGridParam', 'selrow');

		if (row == null)
		{
			alert("Please select a Product to edit");
			return;
		}

		console.log(row);
		var id = $("#grid").jqGrid ('getCell', row, 'id');
		window.location.href="productCreationPage?cmd=Edit&rowid="+id;
		console.log(id);

	});

	$(window).bind('resize',function(){


		// Upon window resize set the width of the grid to the width of the parent "div"
		var jqgridwidth = $("#jqgrid").width();

		$("#grid").jqGrid('setGridWidth', jqgridwidth );

	});


	$("#grid").jqGrid(
			{
				url : "getProductRecordsJqGrid",
				datatype : 'json',
				mtype : 'GET',
				colNames : [ 'Id', 'Name', 'Category', 'Price', 'Weight',
				             'Short Description', 'Long Description',
				             'Update Date', 'Stock', 'Featured Product?','Product Image', 'Additional Images' ],
				             colModel : [ {
				            	 name : 'id',
				            	 index : 'hjid',
				            	 width : 55,
				            	 editable : false,
				            	 hidden : true
				             }, {
				            	 name : 'name',
				            	 index : 'productName',
				            	 width : 100,
				            	 editable : true,
				            	 hidden : false,
				            	 search : true
				             }, {
				            	 name : 'category',
				            	 index : 'category',
				            	 width : 50,
				            	 editable : true,
				            	 hidden : false,
				            	 search : false,
				            	 sortable: false,
				            	 edittype: 'select',
				            	 editoptions: {dataUrl:'get_productCategory_list', buildSelect:function (data) {

				            		 var response = jQuery.parseJSON(data), s = '<select>', i, ri;
				            		 if (response && response.length) {
				            			 for (i=0;i<response.length;i++){
				            				 ri = response[i];
				            				 s+="<option value='"+ri+ "'>"+ri+'</option>';
				            			 }
				            		 }
				            		 s += '</select>';
				            		 return s;
				            	 }}
				             }, {
				            	 name : 'price',
				            	 index : 'productPrice',
				            	 width : 20,
				            	 editable : true,
				            	 align : 'center',
				            	 hidden : false,
				            	 search : false,
				            	 sortable : false,
				            	 formatter : 'currency',
				            	 formatoptions : {decimalPlaces:2, prefix:"$"}
				             }, {
				            	 name : 'weight',
				            	 index : 'weight',
				            	 width : 20,
				            	 editable : true,
				            	 hidden : true,
				            	 align : 'center',
				            	 search : false
				             }, {
				            	 name : 'shortdesc',
				            	 index : 'shortdesc',
				            	 width : 200,
				            	 editable : true,
				            	 hidden : true,
				            	 search : true,
				            	 edittype : 'textarea',
				            	 editoptions : {
				            		 rows : '2',
				            		 cols : '100'
				            	 }
				             }, {
				            	 name : 'longdesc',
				            	 index : 'longdesc',
				            	 width : 255,
				            	 editable : true,
				            	 hidden : true,
				            	 search : true,
				            	 edittype : 'textarea',
				            	 editoptions : {
				            		 rows : '10',
				            		 cols : '100'
				            	 }
				             }, {
				            	 name : 'updatedate',
				            	 index : 'longdesc',
				            	 width : 50,
				            	 editable : true,
				            	 hidden : true,
				            	 search : false
				             }, {
				            	 name : 'stock',
				            	 index : 'stock',
				            	 align : 'center',
				            	 width : 30,
				            	 editable : false,
				            	 hidden : false,
				            	 search : false,
				            	 sortable: false
				             }, {
				            	 name : 'featuredproduct',
				            	 index : 'featuredProduct',
				            	 width: 10,
				            	 editable: true,
				            	 hidden : false,
				            	 align: 'center',
				            	 search : false,
				            	 formatter : function (cellValue, options, rowObject) {
				            		 if (cellValue == false)
				            			 return "No";
				            		 else
				            			 return "Yes";
				            	 }
				             }, {
				            	 name : 'productimage',
				            	 index : 'productimage',
				            	 width : 50,
				            	 editable : true,
				            	 hidden : false,
				            	 align : 'center',
				            	 search : false,
				            	 sortable : false,
				            	 formatter : function (cellValue, options, rowObject) {
				            		 return "<img src='"+cellValue+"' width='120' height='90'>";
				            	 }

				             }, {
				            	 name : 'additionalimages',
				            	 index : 'additionalimages',
				            	 width : 50,
				            	 editable : true,
				            	 hidden : true,
				            	 align : 'center',
				            	 search : false
				             } ],
				             rowNum : 10,
				             rowList : [ 10, 20, 40, 60 ],
				             height : 550,
				             autowidth : true,
				             rownumbers : true,
				             pager : '#pager',
				             sortname : 'hjid',
				             viewrecords : true,
				             sortorder : "asc",
				             caption : "Products",
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

	$("#grid").jqGrid('filterToolbar', {
		stringResult : true,
		searchOnEnter : true,
		defaultSearch : "cn"
	});

	$("#EditUser").click(function() {

		var row = $("#grid").jqGrid('getGridParam', 'selrow');

		if (row != null) {

			$('#grid').jqGrid('editGridRow', row, {
				recreateForm : true,
				beforeShowForm : function(form) {
				},
				beforeInitData : function(form) {
				},
				closeAfterEdit : true,
				reloadAfterSubmit : true,
				afterSubmit : function(response, postdata) {
				}
			}

			);

			$('#grid').jqGrid('setColProp', 'phone', {
				hidden : true
			});
			$('#grid').jqGrid('setColProp', 'fax', {
				hidden : true
			});
			$('#grid').jqGrid('setColProp', 'address1', {
				hidden : true
			});
			$('#grid').jqGrid('setColProp', 'address2', {
				hidden : true
			});
			$('#grid').jqGrid('setColProp', 'city', {
				hidden : true
			});
			$('#grid').jqGrid('setColProp', 'zipcode', {
				hidden : true
			});
			$('#grid').jqGrid('setColProp', 'state', {
				hidden : true
			});
			$('#grid').jqGrid('setColProp', 'country', {
				hidden : true
			});
		} else {
			alert("You must select a row first");
		}
	});

	$("#AddProduct").click(function() {

		$('#grid').jqGrid('setColProp', 'shortdesc', {
			hidden : false
		});
		$('#grid').jqGrid('setColProp', 'longdesc', {
			hidden : false
		});
		$('#grid').jqGrid('setColProp', 'productimage', {
			hidden : false, edittype:'text', editoptions: {readonly:'readonly'}
		});

		$('#grid').jqGrid('setColProp', 'additionalimages', {
			hidden : false, edittype:'text', editoptions: {readonly:'readonly'}
		});

		$('#grid').jqGrid('editGridRow', 'new', {

			url : 'addProductRecords',
			width: 900,
			height: 500,
			modal: true,
			zIndex: 8888,
			reloadAfterSubmit : true,
			recreateForm : true,
			closeAfterAdd : true,
			afterShowForm : function(form) {
				form.closest('div.ui-jqdialog').center();
			},
			beforeShowForm : function(formid) {

				$("#tr_productimage td input#productimage").after("<input type='image' id='imageview'  src='#' onclick='imagechoosedialog(this)'>");
				var imageTable = "<div id='imagecontainer'>" +
				"			<table id='productimagetable' style='width:100%; border:1px solid black;'>" +
				"			<thead style='background:grey; color:white;'> <tr><th style='width:50%;'>Image</th><th style='width:50%;'>Action</th></tr></thead>"+
				"			<tbody style='align:center;'>" +
				"					<tr>" +
				"						<td>" +

				"						</td>" +
				"						<td>" +
				"						<button type='button'onclick='productimageaddremove(this)'>Add</button>" +
				"						</td>"+
				"					</tr>" +
				"			</tbody>"+
				"			</table></div>";
				$("#tr_additionalimages td input#additionalimages").after(imageTable);

				$("#tr_additionalimages td input#additionalimages").hide();
				$("#tr_productimage td input#productimage").hide();
				/*  					$("#tr_image td input#imageview").attr({
						onclick: "imagechoosedialog()"
					});  */
			},
			beforeSubmit : function(postdata, formid) {

				console.log(postdata);
				console.log(formid);

				postdata.productimage = $("#tr_productimage td input#imageview").attr("src");

				var images = $("#productimagetable").find("img");

				$.each(images,function(index, value){
					postdata.additionalimages += $(value).attr("src") +";;";
				});
				console.log("Hello");
				return [true,"Success"];
			},
			afterSubmit : function(response, postdata) {
				var result = eval('(' + response.responseText + ')');
				var errors = "";

				if (result.success == false) {
					for ( var i = 0; i < result.message.length; i++) {
						errors += result.message[i] + "<br/>";
					}
				} else {
					$('#msgbox').text('Entry has been added successfully');
					$('#msgbox').dialog({
						title : 'Success',
						modal : true,
						buttons : {
							"Ok" : function() {
								$(this).dialog("close");
							}
						}
					});
				}
				// only used for adding new records
				var newId = null;

				return [ result.success, errors, newId ];
			}
		});

		$('#grid').jqGrid('setColProp', 'shortdesc', {
			hidden : true
		});
		$('#grid').jqGrid('setColProp', 'longdesc', {
			hidden : true
		});
		$('#grid').jqGrid('setColProp', 'productimage', {
			hidden : true
		});
	});




});



jQuery.fn.center = function () {
	this.css("position","absolute");
	this.css("top", ( $(window).height() - this.height() ) / 2+$(window).scrollTop() + "px");
	this.css("left", ( $(window).width() - this.width() ) / 2+$(window).scrollLeft() + "px");
	return this;
};
