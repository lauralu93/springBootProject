<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
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
</style>
</head>
<body>

	<h1>${headerMessage}</h1>
	
	<!-- di seguito, questa struttura c:if non è veramente necessaria al fine di vedere o meno la scritta
	contenuta all'interno della variabile message. E' giusto per introdurre questo strumento che potrebbe 
	tornare utile negli step successivi -->
	<c:if test="${message != null}">  
		<h3>${message}</h3>
	</c:if>
	
	<h1>${errorMessage}</h1>

	<form:form method="POST" action="checkUser" modelAttribute="user" id= "form">
	<h2> effettua il login!</h2>
		<table>
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

	<br>
	<br>
<div id= "registrati">	<a href="${pageContext.request.contextPath}/addUser"> <button>registrati! </button>
	</a>
</div>
</body>
</html>