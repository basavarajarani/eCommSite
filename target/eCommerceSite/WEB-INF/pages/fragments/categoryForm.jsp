<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form method="post" action="addProductCategory"
	modelAttribute="productCategory">

	<table>
		<tr>
			<td><form:label path="categoryName">Category Name</form:label></td>
			<td><form:input path="categoryName" onblur="populateProductCategoryList()"/></td>
		</tr>
		<tr>
		
			<td><form:label path="parentCategory">Parent Category</form:label></td>
			<td><form:select path="parentCategory.categoryName" id="parentCategoryName" onfocus="renderProductCategoryList()" onclick="renderProductCategoryList()"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit"
				value="Add Product Category" /></td>
		</tr>
	</table>
</form:form>

