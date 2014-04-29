<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
<spring:url value="/static/css/nivo-slider.css" var="nivoSliderCss" />
<link rel="stylesheet" href="${nivoSliderCss }" type="text/css" />

<spring:url value="/static/css/jquery-ui.css" var="jqueryuicss"/>
<link rel="stylesheet"
	href="${jqueryuicss}" />

<spring:url value="/static/js/jquery-1.9.1.js" var="jqueryjs"/>
<script src="${jqueryjs}"></script>

<spring:url value="/static/js/jquery-ui.js" var="jqueryuijs"/>
<script src="${jqueryuijs}"></script>

<spring:url value="/static/css/my.css" var="myCss" />
<link href="${myCss }" media="all" type="text/css" rel="stylesheet" />
<!-- SmartMenus core CSS (required) -->
<spring:url value="/static/css/sm-core-css.css" htmlEscape="true"
	var="smCoreCss" />
<link href="${smCoreCss}" rel="stylesheet" type="text/css" />
<spring:url value="/static/css/sm-blue.css" htmlEscape="true"
	var="smBlueCss" />

<link href="${smBlueCss }" rel="stylesheet" type="text/css" />

<!-- #main-menu config - instance specific stuff not covered in the theme -->
<style type="text/css">
#main-menu {
	position: relative;
	z-index: 5555;
	width: auto;
}

#main-menu ul {
	width: 12em;
	/* fixed width only please - you can use the "subMenusMinWidth"/"subMenusMaxWidth" script options to override this if you like */
}
</style>
<!-- jQuery -->

<spring:url value="/static/js/jquery.smartmenus.min.js"
	var="jQuerySmartMenuJs" />
<!-- SmartMenus jQuery plugin -->
<script type="text/javascript" src="${jQuerySmartMenuJs}"></script>

<spring:url value="/static/js/jquery.nivo.slider.pack.js"
	var="jQueryNivoSliderPackJs" />
<script src="${jQueryNivoSliderPackJs }" type="text/javascript"></script>

<!-- SmartMenus jQuery init -->


<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider({
			effect : 'slideInRight',
			controlNav : false,
			directionNav : false
		});
	});
</script>

<script>
	$.widget("custom.catcomplete", $.ui.autocomplete, {
		_renderMenu : function(ul, items) {
			var that = this, currentCategory = "";
			$.each(items, function(index, item) {
				if (item.category != currentCategory) {
					ul.append("<li class='ui-autocomplete-category'>"
							+ item.category + "</li>");
					currentCategory = item.category;
				}
				that._renderItemData(ul, item);
			});
		}
	});
</script>

<script type="text/javascript">
	function renderProductCategoryList() {

	}

	function populateProductCategoryList() {

		$.ajax({
			url : "get_productCategory_list",
			success : function(result) {
				
						var x = document.getElementById("parentCategoryName");
						while (x.hasChildNodes()){
							x.removeChild(x.lastChild);
						}
						var option = document.createElement("option");
						x.add(option);
						
						for (i = 0; i < result.length; i++) {
							option = document.createElement("option");
							option.text = result[i];
							x.add(option);			
						}		 
			}
		});
	};
</script>
</head>