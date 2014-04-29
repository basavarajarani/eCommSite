<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="useraddform">
	<form:form method="post" action="addUser" modelAttribute="user">
		<table>
			<tr>
				<td><form:label path="userName">User Name</form:label></td>
				<td><form:input path="userName" /></td>
			</tr>
			<tr>
				<td><form:label path="userPassword">Password</form:label></td>
				<td><form:input path="userPassword" /></td>
			</tr>
			<tr>
				<td><form:label path="userFirstName">First Name</form:label></td>
				<td><form:input path="userFirstName" /></td>
			</tr>
			<tr>
				<td><form:label path="userLastName">Last Name</form:label></td>
				<td><form:input path="userLastName" /></td>
			</tr>
			<tr>
				<td><form:label path="userEmail">Email</form:label></td>
				<td><form:input path="userEmail" /></td>
			</tr>
			<tr>
				<td><form:label path="userPhone">Telephone</form:label></td>
				<td><form:input path="userPhone" /></td>
			</tr>
			<tr>
				<td><form:label path="userFax">FAX</form:label></td>
				<td><form:input path="userFax" /></td>
			</tr>
			<tr>
				<td><form:label path="userAddress">Address 1</form:label></td>
				<td><form:input path="userAddress" /></td>
			</tr>
			<tr>
				<td><form:label path="userAddress2">Address 2</form:label></td>
				<td><form:input path="userAddress2" /></td>
			</tr>
			<tr>
				<td><form:label path="userCity">City</form:label></td>
				<td><form:input path="userCity" /></td>
			</tr>
			<tr>
				<td><form:label path="userZip">Pin Code</form:label></td>
				<td><form:input path="userZip" /></td>
			</tr>
			<tr>
				<td><form:label path="userState">State</form:label></td>
				<td><form:input path="userState" /></td>
			</tr>
			<tr>
				<td><form:label path="userCountry">Country</form:label></td>
				<td><form:input path="userCountry" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Add Contact" /></td>
			</tr>
		</table>

	</form:form>
</div>