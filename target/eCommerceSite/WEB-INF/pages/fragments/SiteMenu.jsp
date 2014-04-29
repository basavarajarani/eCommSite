<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	$(function() {
						$.ajax({
									url : "<%=request.getContextPath()%>/generateMenu",
									cache: false,
									success : function(result) {

										var prodsSubMenu = document
												.getElementById("ProductsSubMenu");

										for ( var i = 0; i < result.length; i++) {

											var jsonHierarchyStack = new Array();
											var jsonHierarchySplit = result[i]
													.split("->");
											for ( var j = 0; j < jsonHierarchySplit.length; j++) {
												var entry = new Object();
												var itemSplit = jsonHierarchySplit[j]
														.split("::");
												entry.categoryName = itemSplit[0];
												entry.categoryId = itemSplit[1];
												jsonHierarchyStack.push(entry);
											}

											var parentNode = prodsSubMenu;
											var ul = null;

											for ( var j = 0; j < jsonHierarchySplit.length; j++) {

												var children = parentNode.childNodes;
												var stackEntry = jsonHierarchyStack
														.shift();
												if (children.length == 1) {

													// There is only a <a> child to this prodsubmenu. Add the UL
													ul = document
															.createElement("ul");
													parentNode.appendChild(ul);
													var li = document
															.createElement("li");
													li
															.setAttribute(
																	"id",
																	"PC_"
																			+ stackEntry.categoryId);
													ul.appendChild(li);
													var a = document
															.createElement("a");
													a
															.setAttribute(
																	"href",
																	"<%=request.getContextPath()%>/products/category="
																			+ stackEntry.categoryId+"/page=1");
													a.innerHTML = stackEntry.categoryName;
													li.appendChild(a);
													parentNode = ul;
												} else if (children.length == 2) {
													var elementExists = "false";
													for ( var a = 0; a < children.length; a++) {
														var child = children[a];

														if (child.tagName == "UL") {
															ul = child;
														}
													}

													var ulchildren = ul.childNodes;
													for ( var a = 0; a < ulchildren.length; a++) {
														var child = ulchildren[a];
														if (child.tagName == "LI"
																&& child.id == "PC_"
																		+ stackEntry.categoryId) {
															parentNode = child;
															elementExists = "true";
															break;
														}
													}
													if (elementExists == "true")
														continue;
													// We got the UL. Add the new category to that.
													var li = document
															.createElement("li");
													li
															.setAttribute(
																	"id",
																	"PC_"
																			+ stackEntry.categoryId);
													ul.appendChild(li);
													var a = document
															.createElement("a");
													a
															.setAttribute(
																	"href",
																	"<%=request.getContextPath()%>/products/category="
																			+ stackEntry.categoryId+"/page=1");
													li.appendChild(a);
													a.innerHTML = stackEntry.categoryName;
													parentNode = ul;
												}

											}

										}
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
</script>

<div id="menubar">
	<ul id="main-menu" class="sm sm-blue">
		<li><a href="<%=request.getContextPath()%>/">Home</a></li>
		<li id="ProductsSubMenu"><a href="#">Products</a></li>
		<li><a href="#">Service</a></li>
		<li><a href="#">SilverGuard</a></li>
		<li><a href="#">About Us</a></li>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="#">Admin Menu</a>
				<ul>
					<li id="ProductCategory"><a
						href="<%=request.getContextPath()%>/createProductCategory">Product
							Category</a></li>
					<li id="User"><a
						href="<%=request.getContextPath()%>/useroperations">User</a>
					<li id="Order"><a href="#">Order</a></li>
					<li id="Products"><a
						href="<%=request.getContextPath()%>/productoperations">Products</a></li>
				</ul></li>
		</sec:authorize>
		<sec:authorize ifNotGranted="ROLE_ANONYMOUS">
			<li><a href="<%=request.getContextPath()%>/<c:url value="j_spring_security_logout" />">Logout</a></li>
		</sec:authorize>

	</ul>
</div>
