<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:url value="getuserrecords" var="getuserrecords" />
<c:url value="addUserRecords" var="addUserRecords"/>
<c:url value="editUserRecords" var="editUserRecords"/>



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

<link rel="stylesheet" type="text/css" media="screen" href="http://www.trirand.com/blog/jqgrid/themes/redmond/jquery-ui-custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="http://www.trirand.com/blog/jqgrid/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="http://www.trirand.com/blog/jqgrid/themes/ui.multiselect.css" />

	
<spring:url value="/static/css/ui.multiselect.css" var="uimultiselectcss"/>
<link rel="stylesheet" type="text/css" media="screen"
	href="${uimultiselectcss}" />

<script type='text/javascript'>
	$(function() {

		$("#grid").jqGrid({
			url : '${getuserrecords}',
			datatype : 'json',
			mtype : 'GET',
			colNames : [ 'Id', 'User Name', 'Role','Enabled','First Name', 'Last Name', 'Phone', 'Fax','Email', 'Address 1', 'Address 2', 'City', 'Zip Code', 'State', 'Country' ],
			colModel : [ {name : 'id',index : 'id',	width : 55,	editable : false, hidden : true	}, 
			             {name : 'userName',index : 'UserName',	width : 100,editable : true }, 
			             {name : 'role',index : 'role',	width : 100,editable : true,search : false, edittype:'select', editoptions:{dataUrl:'retrieveRoles'}}, 
			             {name : 'enabled',	index : 'enabled',width:100,editable: true,search : false, edittype:'select', editoptions:{value:"1:Yes;0:No", defaultValue:"1:Yes"}}, 
			             {name : 'firstName',index : 'firstName',width : 100,editable : true,search : true}, 
			             {name : 'lastName',index : 'lastName', width: 100,editable : true,search : true},
			             {name : 'phone', index: 'phone', width: 30, editable : true, search : true, hidden:true},
			             {name : 'fax', index : 'fax', width : 30, editable : true, search : true, hidden:true },
			             {name : 'email', index : 'email', width: 50, editable: true, search : true},
			             {name : 'address1', index : 'address1', width: 100, editable: true, search : true, hidden: true, hidden:true},
			             {name : 'address2', index : 'address2', width : 100, editable : true, search : true, hidden:true},
			             {name : 'city', index : 'city', width : 50, editable : true, search : true, hidden:true},
			             {name : 'zipcode', index : 'zipcode', width : 50, editable: true, search : true, hidden:true},
			             {name : 'state', index : 'state', width : 50, editable : true, search : true, hidden:true},
			             //{name : 'country', index : 'country', width: 50, editable: true, search : true, hidden:true, edittype:'select',editoptions:{dataUrl:'retrieveCountries'}}],
			             {name : 'country', index : 'country', width: 50, editable: true, search : true, hidden:true}
				],
			rowNum : 10,
			rowList : [ 10, 20, 40, 60 ],
			height : 240,
			autowidth : true,
			rownumbers : true,
			pager : '#pager',
			sortname : 'id',
			viewrecords : true,
			sortorder : "asc",
			caption : "Users",
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
		
		
		$("#EditUser").click ( function( ) {
			
			var row = $("#grid").jqGrid('getGridParam', 'selrow');
			
			if (row != null){
				
				$('#grid').jqGrid('setColProp', 'phone', {hidden:false});
				$('#grid').jqGrid('setColProp', 'fax', {hidden:false});
				$('#grid').jqGrid('setColProp', 'address1', {hidden:false});
				$('#grid').jqGrid('setColProp', 'address2', {hidden:false});
				$('#grid').jqGrid('setColProp', 'city', {hidden:false});
				$('#grid').jqGrid('setColProp', 'zipcode', {hidden:false});
				$('#grid').jqGrid('setColProp', 'state', {hidden:false});
				$('#grid').jqGrid('setColProp', 'country', {hidden:false});
				
				$('#grid').jqGrid('editGridRow', row,
					{
						recreateForm : true,
						beforeShowForm : function(form){},
						beforeInitData : function(form) {},
						closeAfterEdit : true,
						reloadAfterSubmit : true,
						afterSubmit : function (response, postdata) {}
					}
					
				);
				
				$('#grid').jqGrid('setColProp', 'phone', {hidden:true});
				$('#grid').jqGrid('setColProp', 'fax', {hidden:true});
				$('#grid').jqGrid('setColProp', 'address1', {hidden:true});
				$('#grid').jqGrid('setColProp', 'address2', {hidden:true});
				$('#grid').jqGrid('setColProp', 'city', {hidden:true});
				$('#grid').jqGrid('setColProp', 'zipcode', {hidden:true});
				$('#grid').jqGrid('setColProp', 'state', {hidden:true});
				$('#grid').jqGrid('setColProp', 'country', {hidden:true	});
			} else {
				alert("You must select a row first");
			}
		});
		

		$("#AddUser").click(function () {

			alert("clicked");
			$('#grid').jqGrid('setColProp', 'phone', {
				hidden : false
			});
			$('#grid').jqGrid('setColProp', 'fax', {
				hidden : false
			});
			$('#grid').jqGrid('setColProp', 'address1', {
				hidden : false
			});
			$('#grid').jqGrid('setColProp', 'address2', {
				hidden : false
			});
			$('#grid').jqGrid('setColProp', 'city', {
				hidden : false
			});
			$('#grid').jqGrid('setColProp', 'zipcode', {
				hidden : false
			});
			$('#grid').jqGrid('setColProp', 'state', {
				hidden : false
			});
			$('#grid').jqGrid('setColProp', 'country', {
				hidden : false
			});

			$('#grid').jqGrid('editGridRow', 'new', {

				url : 'addUserRecords',
				reloadAfterSubmit : true,
				recreateForm : true,
				closeAfterAdd : true,
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
		});

	});

	("#SearchProductCategory").click(function() {
		jQuery("#grid").jqGrid('searchGrid', {
			sopt : [ 'cn', 'bw', 'eq', 'ne', 'lt', 'gt', 'ew' ]
		});

	});
</script>

<div id='jqgrid'>
	<table id='grid'></table>
	<div id='pager'></div>
	<div id="userbuttons" style="clear:both; margin:10px 0 10px 10px;">
		<input type="button" id="AddUser"
			Value="Add User" /> 
		<input type="button"
			id="EditUser" Value="View/Edit User" /> 
		<input
			type="button" id="DeleteUser"
			Value="Delete User" />
			
		<input type="button" id="SearchUser" value="Search User"/>
	</div>
</div>
