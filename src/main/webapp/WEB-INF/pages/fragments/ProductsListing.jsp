<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<spring:url value="/static/css/zTreeStyle.css" htmlEscape="true"
	var="jqtreecss" />
<link rel="stylesheet" href="${jqtreecss}">

<spring:url value="/static/js/jquery.ztree.core-3.5.min.js"
	htmlEscape="true" var="jqtreejs" />
<script src="${jqtreejs }"></script>



<script type="text/javascript">

var setting = {
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	$(function() {

			$.ajax ({
				url: "<%=request.getContextPath()%>/generateSideMenu",
			success : function(response) {

				$.fn.zTree.init($("#sideTree"), setting, response);
			}
		});
	});
</script>

<div id="sidebar" style="clear: both; float: left; width: 200px; border-right:1px solid grey;">

	<p> <em>Categories</em></p>
	<ul id="sideTree" class="ztree"></ul>

</div>
<div id="productlistcontainer" style="float: left;">
	<c:forEach var="product" items="${products}">
		<div id="productcontainer" style="border-bottom: 1px solid grey;">
			<table style="width: 100%;">
				<tr>
					<td id="imagetd">
						<div id="productimage">
							<img src="${product.productimage}" width="120" height="90" />
						</div>
					</td>
					<td id="shortdesctd">${product.shortDesc}</td>
					<td id="pricetd">
						<div id="productprice">
							<fmt:setLocale value="en_US" />
							<fmt:formatNumber value="${product.price}" type="currency" />
						</div>
					</td>
				</tr>
			</table>
		</div>
	</c:forEach>
</div>