
<div class="row-fluid">
	<div id="form" class="span12"
		style="width: 750px; margin-left: auto; margin-right: auto;">
		<div class="w2ui-page page-0">
			<div class="w2ui-label">Product Name:</div>
			<div class="w2ui-field">
				<input name="productname" type="text" maxlength="100" size="60" />
			</div>
			<div class="w2ui-label">Category:</div>
			<div class="w2ui-field">
				<input name="category" type="text" maxlength="100" size="60" />
			</div>
			<div class="w2ui-label">Short Description:</div>
			<div class="w2ui-field">
				<textarea name="shortdesc"
					style="width: 385px; height: 80px; resize: none"></textarea>
			</div>
			<div class="w2ui-label">Long Description:</div>
			<div class="w2ui-field">
				<textarea name="longdesc"
					style="width: 385px; height: 180px; resize: none"></textarea>
			</div>
		</div>
		<div class="w2ui-page page-1">
			<div class="w2ui-label">Price</div>
			<div class="w2ui-field">
				<input name="price" type="text" maxlength="10" size="10" />
			</div>
			<div class="w2ui-label">Weight</div>
			<div class="w2ui-field">
				<input name="weight" type="text" maxlength="100" size="60" />
			</div>
			<div class="w2ui-label">Weight Class</div>
			<div class="w2ui-field">
				<select name="weightclass"></select>
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
		</div>
		<div class="w2ui-page page-2">
			<div class="w2ui-label">Image</div>
			<div class="w2ui-field">
				<img src="#"></img>
			</div>
		</div>

		<div class="w2ui-buttons">
			<input type="button" value="Reset" name="reset"> <input
				type="button" value="Save" name="save">
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('#form').w2form({
			name : 'form',
			header : 'New Product Creation Form',
			url : 'addProductNewAPI',
			fields : [ {
				name : 'productname',
				type : 'text',
				required : true
			}, {
				name : 'category',
				type : 'text',
				required : true
			}, {
				name : 'shortdesc',
				type : 'text',
				required : true,
			}, {
				name : 'longdesc',
				type : 'text',
				required : true
			}, {
				name : 'price',
				type : 'float',
				required : true
			}, {
				name : 'weight',
				type : 'float',
				required : true
			}, {
				name : 'weightclass',
				type : 'select',
				required : true,
				options : {
					items : [ 'Kilogram', 'Gram', 'Pound', 'Ounce' ]
				}
			}, {
				name : 'lengthclass',
				type : 'select',
				required : false,
				options : {
					items : [ 'Centimeter', 'Milimeter', 'Inch' ]
				}
			}, {
				name : 'length',
				type : 'float',
				required : false
			}, {
				name : 'width',
				type : 'float',
				required : false
			}, {
				name : 'height',
				type : 'float',
				required : false
			} ],
			tabs : [ {
				id : 'tab1',
				caption : 'General'
			}, {
				id : 'tab2',
				caption : 'Data'
			}, {
				id : 'tab3',
				caption : 'Images'
			} ],
			actions : {
				reset : function() {
					this.clear();
				},
				save : function() {
					this.save();
				}
			}
		});
	});
</script>