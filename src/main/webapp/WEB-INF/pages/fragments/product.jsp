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

<script type='text/javascript'>
	$(function() {

		$("#grid").jqGrid(
				{
					url : '${getproductrecords}',
					datatype : 'json',
					mtype : 'GET',
					colNames : [ 'Id', 'Name', 'Category', 'Price', 'Weight',
							'Short Description', 'Long Description',
							'Update Date', 'Stock', 'Product Image' ],
					colModel : [ {
						name : 'id',
						index : 'id',
						width : 55,
						editable : false,
						hidden : true
					}, {
						name : 'name',
						index : 'name',
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
						search : true,
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
						index : 'price',
						width : 20,
						editable : true,
						align : 'center',
						hidden : false,
						search : true
					}, {
						name : 'weight',
						index : 'weight',
						width : 20,
						editable : true,
						hidden : false,
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
						search : false
					}, {
						name : 'productimage',
						index : 'productimage',
						width : 50,
						editable : true,
						hidden : false,
						align : 'center',
						search : false,
						formatter : function (cellValue, options, rowObject) {
							return "<img src='"+cellValue+"' width='120' height='90'>";
						}

					} ],
					rowNum : 10,
					rowList : [ 10, 20, 40, 60 ],
					height : 550,
					autowidth : true,
					rownumbers : true,
					pager : '#pager',
					sortname : 'id',
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

			$('#grid').jqGrid('editGridRow', 'new', {

				url : 'addProductRecords',
				width: 900,
				modal: true,
				zIndex: 8888,
				reloadAfterSubmit : true,
				recreateForm : true,
				closeAfterAdd : true,
				afterShowForm : function(form) {
					form.closest('div.ui-jqdialog').center();
				},
				beforeShowForm : function(formid) {
					
					 $("#tr_productimage td input#productimage").after("<input type='image' id='imageview' src='#' onclick='imagechoosedialog()'>");
					 $("#tr_productimage td input#productimage").hide();
/*  					$("#tr_image td input#imageview").attr({
						onclick: "imagechoosedialog()"
					});  */
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
		
	    $( "#ImageChoose" ).dialog({
		      autoOpen: false,
				 modal: true,
				 height: 600,
				 width: 800,
				 zIndex: 9999,
				 buttons: {
					 'Select Image': function() {
						 
						 // Set the image of the product
						 $("#tr_productimage td input#productimage").val(window.selectedImageHref);
						 $("#tr_productimage td input#imageview").attr("src", window.selectedImageHref);
						 $("#tr_productimage td input#imageview").attr("width", "120");
						 $("#tr_productimage td input#imageview").attr("height", "90");
						 $(this).dialog('close');
						 
					 }
				 }
		    });
	    
	    // When the image is selected from the grid, invoke the imageChooserSelected function
	    $("#selectable").selectable({
	    	selected: imageChooserSelected
	    });
	    


	});
	
	function imageChooserSelected(event, ui){
		
		var selected = ui.selected.innerHTML;
		var srcAttr = $(selected).attr("src");
		window.selectedImageHref = srcAttr;
	}

	function imagechoosedialog() {
		$('.ui-dialog').css('z-index',9999);
		$('#ImageChoose').dialog('open');

		$.ajax({
			url:'getAlbumList',
			success: function (response) {
				$("#albumlist").empty();
				$.each (response, function (key, value){
					var divTag = document.createElement("div");
					divTag.setAttribute("class", "albumlist");
					var pTag = document.createElement("p");
					pTag.setAttribute("onclick","selectAlbum(this)");
					pTag.setAttribute("albumId",value);
					pTag.innerHTML = key;
					divTag.appendChild(pTag);
					document.getElementById("albumlist").appendChild(divTag);
				});
				$("#loadingimage").hide();
			}
		});

		
	}
	
	function selectAlbum(pTag){
		
		var albumId = $(pTag).attr("albumId");
		//alert(albumId);
 		$.ajax({
			url:'getAlbumImages',
			data: "albumId="+albumId,
			success: function(response) {
				//alert(response);
				$('#selectable').empty();
				for (var i = 0;i<response.length;i++){
				var liTag = document.createElement("li");
				liTag.setAttribute("class", "ui-state-default");
				var imgTag = document.createElement("img");
				imgTag.setAttribute("src",response[i]);
				imgTag.setAttribute("height", "90");
				imgTag.setAttribute("width", "120");
				liTag.appendChild(imgTag);
				document.getElementById("selectable").appendChild(liTag);
				}
			}
		});
 		
	}
	
    jQuery.fn.center = function () {
        this.css("position","absolute");
        this.css("top", ( $(window).height() - this.height() ) / 2+$(window).scrollTop() + "px");
        this.css("left", ( $(window).width() - this.width() ) / 2+$(window).scrollLeft() + "px");
        return this;
    }

</script>

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
