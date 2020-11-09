<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create User</title>
<style>
body{
background-color : #6E1023;
color: white;
}
#form{
position: relative;
left: 350px;
}
#registrati{
position: relative;
left: 470px;
bottom: 63px;
}
h1{
position: relative;
left: 270px;}
</style>
</head>
<body>

	<h1>${headerMessage}</h1>

	<form:form method="POST" action="ultimateEdit" modelAttribute="user" id="form">
		<table>
			<tr>
				<td><form:input type="hidden" path="id" /></td>
			</tr>
			<tr>
				<td><form:label path="nome">Nome</form:label></td>
				<td><form:input path="nome" /></td>
			</tr>
			<tr>
				<td><form:label path="cognome">Cognome</form:label></td>
				<td><form:input path="cognome" /></td>
			</tr>
			<tr>
				<td><form:label path="email">Email</form:label></td>
				<td><form:input path="email" /></td>
			</tr>
			<tr>
				<td><form:label path="password">Password</form:label></td>
				<td><form:input path="password" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form:form>

</body>
</html>