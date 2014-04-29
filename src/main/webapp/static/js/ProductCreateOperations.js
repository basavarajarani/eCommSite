
$(function(){

	$(window).bind('resize', function(){
		w2ui['productcreateeditform'].resize();
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
				var img = window.img;
				$(img).attr("src",window.selectedImageHref);
				$(img).attr("width", '120');
				$(img).attr("height", '90');
				$(this).dialog('close');

			}
		}
	});

	// When the image is selected from the grid, invoke the imageChooserSelected function
	$("#selectable").selectable({
		selected: imageChooserSelected
	});

	$('#productcreateeditform').w2form({
		name : 'productcreateeditform',
		header : 'Product Creation Form',
		url :  {
			save : 'addProductNewAPI',
			get : 'getProductById'
		},
		fields : [ {
			name : 'productname',
			type : 'text',
			required : true
		}, {
			name : 'category',
			type : 'select',
			required : true,
			options: {
				url: 'get_productCategory_listmap',
				items: [],
				value : '',
				showNone : false
			}
		}, {
			name : 'shortDesc',
			type : 'text',
			required : true,
		}, {
			name : 'longDesc',
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
			required : true,
			options : {
				items : [ 'Centimeter', 'Milimeter', 'Inch' ]
			}
		}, {
			name : 'length',
			type : 'float',
			required : true
		}, {
			name : 'width',
			type : 'float',
			required : true
		}, {
			name : 'height',
			type : 'float',
			required : true
		}, {
			name : 'additionalimages',
			type : 'text'
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
		onSubmit: function(event) {
			var record = event.postData.record;
			event.postData.category = record.category;
			event.postData.height = record.height;
			event.postData.length = record.length;
			event.postData.lengthclass = record.lengthclass;
			event.postData.longDesc = record.longDesc;
			event.postData.price = record.price;
			event.postData.productname = record.productname;
			event.postData.shortDesc = record.shortDesc;
			event.postData.weight = record.weight;
			event.postData.weightclass = record.weightclass;
			event.postData.width = record.width;
			event.postData.cmd = this.cmd;
			event.postData.record = null;

			/* Consolidate the photos into a single variable seperated by :: */
			var productImages = $("#productimagetable").find("img");

			event.postData.additionalimages = '';
			$.each(productImages, function(key,value){
				event.postData.additionalimages += "::"+$(value).attr("src");
			});

			console.log("hello");
		},
		onLoad : function(event) {
			if (event.status == "success") {
				try { eval('data = '+ event.xhr.responseText); } catch (e) { }

				var additionalImagesText = data.record.additionalImages;

				var additionalImages = additionalImagesText.split("::");

				/* Construct the additionalimage table */
				var productimagestbody = $("#productimagetable tbody");
				if (additionalImages != "")
					$.each(additionalImages, function(key,value){
						var imagetr = "<tr>" +
						"			<td>" +
						"				<div class='choseimgdiv'>" +
						"								<img src='"+value+"' height='90' width='120'>" +
						"   								<br><a class='imgbrowseclear btn' data-toggle='modal' onclick='imagechoosedialog(this)'>Browse Image</a> | <a class='imgbrowseclear btn' onclick='clearImage(this)'>Clear Image</a>" +
						"							</div>" +
						"			</td>" +
						"			<td>" +
						"			<button type='button'onclick='productimageaddremove(this)'>Remove</button>" +
						"			</td>" +
						"	   </tr>";
						$(productimagestbody).append(imagetr);
					});
			}
			console.log("hello");

		},
		onSave : function(event) {
			console.log(event);

		},
		actions : {
			reset : function() {
				this.clear();
			},
			save : function() {
				this.save();
			}

		}
	});

	var vars = [], hash;
	var q = document.URL.split('?')[1];
	if(q != undefined){
		q = q.split('&');
		for(var i = 0; i < q.length; i++){
			hash = q[i].split('=');
			vars.push(hash[1]);
			vars[hash[0]] = hash[1];
		}
	}

	var cmd = vars['cmd'];
	if (cmd=="Edit") {
		var recid = vars['rowid'];
		w2ui['productcreateeditform'].recid =	recid;
		w2ui['productcreateeditform'].header = "Product Edit Form";
		w2ui['productcreateeditform'].reload();
		w2ui['productcreateeditform'].cmd = "mod-record";
	}



});
function productimageaddremove(button) {
	if (button.innerHTML =="Add")
	{
		button.innerHTML = "Remove";
		var parentTd = $(button).parent();
		var neighbouringTd = $(parentTd).prev();
		$(neighbouringTd).append(
				"<div class='choseimgdiv'>" +
				"	<img src='"+contextPath+"/static/images/no_image.gif' height='90' width='120'>" +
				"   <br><a class='imgbrowseclear btn' data-toggle='modal' onclick='imagechoosedialog(this)'>Browse Image</a> | <a class='imgbrowseclear btn' onclick='clearImage(this)'>Clear Image</a>" +
				"</div>"
		);
		var parentTr = $(parentTd).parent();
		var parentTable = $(parentTr).parent();
		$(parentTable).append("<tr><td></td><td><button type='button'onclick='productimageaddremove(this)'>Add</button></td>");
	}
	else
	{
		button.innerHTML = "Add";
		var parentTd = $(button).parent();
		var parentTr = $(parentTd).parent();
		$(parentTr).remove();
	}
}



function imageChooserSelected(event, ui){

	var selected = ui.selected.innerHTML;
	var srcAttr = $(selected).attr("src");
	window.selectedImageHref = srcAttr;
}

function imagechoosedialog(anchor) {

	//$('#ImageChoose').dialog('open');

	$('#myModal').modal('show');

	var parentTd = $(anchor).parent();
	var img = $(parentTd).find("img");
	window.imgTag = img;

	/*

	$.ajax({
		url:'getAlbumList',
		success: function (response) {
			$("#albumlist").empty();
			$.each (response, function (key, value){
				var albumEntry = new Object();
				albumEntry.key = key;
				albumEntry.value = value;
				window.albumsArray.push(albumEntry);
			});
			//$("#loadingimage").hide();
		}
	});
	 */

}

function selectPhoto(){
	var img = window.imgTag;
	$(img).attr('src',window.selectedImageHref);
	window.selectedImageHref = null;
	window.imgTag = null;
	$("#myModal").modal('hide');
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