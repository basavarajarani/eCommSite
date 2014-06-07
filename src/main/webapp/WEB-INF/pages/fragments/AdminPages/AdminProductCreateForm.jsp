
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#productimagetable {
	outline: 1px solid black;
}

#productimagetable thead {
	outline: 1px solid black;
}

#productimagetable td {
	outline: 1px solid black;
	text-align: center;
}

#productimagetable th {
	outline: 1px solid black;
}
</style>
<spring:url value="/static/css/jquery-te-1.4.0.css" var="cleditorcss" />

<link href="${cleditorcss}" rel="stylesheet" />
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<div class="row">
	<div id="productcreateeditform" class="span12"
		style="width: 100%; height: 550px;">
		<div class="w2ui-page page-0">
			<div class="w2ui-label">Product Name:</div>
			<div class="w2ui-field">
				<input name="productname" type="text" maxlength="100" size="60" />
			</div>
			<div class="w2ui-label">Category:</div>
			<div class="w2ui-field">
				<select name="category"></select>
			</div>
			<div class="w2ui-label">Short Description:</div>
			<div class="w2ui-field">
				<textarea name="shortDesc" style="height: 80px; resize: none"></textarea>
			</div>
			<div class="w2ui-label">Long Description</div>
			<div class="w2ui-field">
				<textarea class="longDesc" id="longDesc" name="longDesc"></textarea>
			</div>
		</div>
		<div class="w2ui-page page-1">
			<div class="w2ui-label">Price</div>
			<div class="w2ui-field">
				<input name="price" type="text" maxlength="10" size="10" />
			</div>
			<div class="w2ui-label">Weight Class</div>
			<div class="w2ui-field">
				<select name="weightclass"></select>
			</div>
			<div class="w2ui-label">Weight</div>
			<div class="w2ui-field">
				<input name="weight" type="text" maxlength="4" />
			</div>

			<div class="w2ui-label">Length Class</div>
			<div class="w2ui-field">
				<select name="lengthclass"></select>
			</div>
			<div class="w2ui-label">Length</div>
			<div class="w2ui-field">
				<input name="length" type="text" maxlength="4" size="4" />
			</div>
			<div class="w2ui-label">Width</div>
			<div class="w2ui-field">
				<input name="width" type="text" maxlength="4" size="4" />
			</div>
			<div class="w2ui-label">Height</div>
			<div class="w2ui-field">
				<input name="height" type="text" maxlength="4" size="4" />
			</div>

			<div class="w2ui-label">Featured Product?</div>
			<div class="w2ui-field">
				<input name="featuredproduct" type="checkbox" class="w2ui-toggle">
			</div>

		</div>
		<div class="w2ui-page page-2">
			<!-- 			<div class="w2ui-label">Image</div>
			<div class="w2ui-field">
				<img src="#"></img>
			</div> -->

			<table id='productmainimage' style='width: 100%;'>
				<tr>
					<td>Main Product Image</td>
					<td>
						<div class='choseimgdiv'>
							<img id="mainimage" src='static/images/no_image.gif' height='90'
								width='120'>
							<div>
								<a class='imgbrowseclear btn' data-toggle='modal'
									onclick='imagechoosedialog(this)'>Browse Image</a> | <a
									class='imgbrowseclear btn' onclick='clearImage(this)'>Clear
									Image</a>
							</div>
						</div>
					</td>
				</tr>
			</table>

		</div>
		<div class="w2ui-page page-3">
			<table id='productimagetable' style='width: 100%;'>
				<thead style='background: grey; color: white;'>
					<tr>
						<th style='width: 50%;'>Image</th>
						<th style='width: 50%;'>Action</th>
					</tr>
				</thead>
				<tbody style='text-align: center;'>
					<tr>
						<td></td>
						<td><button type='button'
								onclick='productimageaddremove(this)'>Add</button>
					</tr>
			</table>
		</div>
		<div class="w2ui-page page-4">
			<table id="attributestable" border="1" style="width: 100%;">
				<thead style="background: grey; color: white;">
					<tr>
						<th>Attribute Name</th>
						<th>Attribute Value</th>
						<th></th>
					</tr>
				</thead>
				<tbody style='text-align: center;'>
					<tr>
						<td></td>
						<td></td>
						<td><button type='button' onclick='addremoveattribute(this)'>Add Attribute</button></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="w2ui-buttons">
			<input type="button" value="Reset" name="reset"> <input
				type="button" value="Save" name="save">
		</div>
	</div>
</div>




<div title="Image Chooser Dialog" id="ImageChoose"
	class="imagedialogue container">
	<img src="<%=request.getContextPath()%>/static/images/Loading.gif"
		id="loadingimage" style="text-align: center;">
	<div class="row">
		<div id="photogalleryheading" style="text-align: center;">Select
			the Image</div>
		<div id="photopart" class="span4">
			<div id="albumlist"></div>
			<div id="photolist" class="span8">
				<ol id="selectable"></ol>
			</div>
		</div>
	</div>
</div>


<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
<spring:url value="/static/js/ImageChooseController.js"
	htmlEscape="true" var="ImageChooseControllerJs" />
<script src="${ImageChooseControllerJs}"></script>
<spring:url value="/static/js/jquery-te-1.4.0.min.js" var="cleditorjs" />
<script src="${cleditorjs}"></script>


<style>
#selectable .ui-selecting {
	background: #FECA40;
}

#selectable .ui-selected {
	background: #F39814;
	color: white;
}

#selectable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 450px;
}

#selectable li {
	margin: 3px;
	padding: 1px;
	float: left;
	width: 100px;
	height: 80px;
	font-size: 4em;
	text-align: center;
}
</style>

<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
	data-keyboard="false" aria-labelledby="myModalLabel" aria-hidden="true"
	ng-app="imageFetchDialogApp" ng-controller='PicasaController'>
	\
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">Choose the image</h3>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="span3">
				<ul>
					<li ng-repeat='album in albums'><a
						ng-click="retrievePics(album.value)">{{album.key}}</a></li>
				</ul>
			</div>
			<div class="span9">
				<ol id="selectable">
					<li ng-repeat="photo in photos"><img src='{{photo}}'
						width='120' height='90' /></li>
				</ol>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button class="btn" ng-click="updateAlbums();">Refresh Albums</button>
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		<button class="btn btn-primary" onclick="selectPhoto()">Select
			Image</button>
	</div>
</div>

<script type="text/javascript">
	var contextPath='<%=request.getContextPath()%>
	';
</script>

<spring:url value="/static/js/ProductCreateOperations.js"
	htmlEscape="true" var="ProductCreateOperationsJs" />

<script src="${ProductCreateOperationsJs}"></script>