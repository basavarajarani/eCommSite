<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="loginForm">

	Please enter your username and password. Password is case sensitive.

	<form name='f' action="<c:url value='j_spring_security_check' />"
		method='POST'>

		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='j_username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='j_password' /></td>
			</tr>
			<tr>
				<td><input name="submit" type="submit"
					value="submit" /></td>
				<td><input name="reset" type="reset" /></td>
			</tr>
		</table>
	</form>
</div>