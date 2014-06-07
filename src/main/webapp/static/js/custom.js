/* Bootstrap Carousel */

$('.carousel').carousel({
   interval: 8000,
   pause: "hover"
});

/* Dropdown Select */

/* Navigation (Select box) */

// Create the dropdown base

$("<select />").appendTo(".navis");

// Create default option "Go to..."

$("<option />", {
   "selected": "selected",
   "value"   : "",
   "text"    : "Menu"
}).appendTo(".navis select");

// Populate dropdown with menu items

$(".navi a").each(function() {
 var el = $(this);
 $("<option />", {
     "value"   : el.attr("href"),
     "text"    : el.text()
 }).appendTo(".navis select");
});

$(".navis select").change(function() {
  window.location = $(this).find("option:selected").val();
});



/* Scroll to Top */


  $(".totop").hide();

  $(function(){
    $(window).scroll(function(){
      if ($(this).scrollTop()>300)
      {
        $('.totop').fadeIn();
      } 
      else
      {
        $('.totop').fadeOut();
      }
    });

    $('.totop a').click(function (e) {
      e.preventDefault();
      $('body,html').animate({scrollTop: 0}, 500);
    });

  });
  
  
/* Support */

$("#slist a").click(function(e){
   e.preventDefault();
   $(this).next('p').toggle(200);
});

/* Careers */

$('#myTab a').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
});


/* Ecommerce sidebar */

$(document).ready(function() {
    $('.sidey .nav').navgoco();
});

$(function() {
	$.ajax({
				url : "generateMenu",
				cache: false,
				success : function(result) {
					
					var prodSubMenu = $("#prodsubmenu");

					var parent = prodSubMenu;
					$.each(result, function(key,value){
					    var categoryHierarchyItem = value;
						var jsonHierarchySplit = categoryHierarchyItem.split("->");
					    parent = prodSubMenu;
					    $.each(jsonHierarchySplit,function(itemKey, itemValue){
					        var itemSplit = itemValue.split("::");
					        var pcname = itemSplit[0];
					        var pcid = itemSplit[1];

					        if($(parent).find("#PC_"+pcid).length > 0) {
					            parent = $(parent).find("#PC_"+pcid);
					            
					            return;
					        }
					        if (!$(parent).is("ul") && $(parent).children("ul").length==0) {
					            $(parent.append("<ul></ul>"));
					            parent = $(parent).children("ul");
					        } else if (!$(parent).is("ul") && $(parent).children("ul").length==1) {
					            parent = $(parent.children("ul"));
					        }
					        $(parent).append("<li id='PC_"+pcid+"'><a href='#/products/category="+pcid+"'>"+pcname+"</a></li>");
					        parent = $(parent).find("#PC_"+pcid);
					        
					    });

					});
					$('#main-menu').smartmenus({
						subMenusSubOffsetX : 1,
						subMenusSubOffsetY : -8,
						rightToLeftSubMenus : false,
						keepHighlighted : true,
					});
					
				},

				error : function(xhr, textStatus, error) {
					console.log(textStatus + ":" + error);
				}
			});

});
