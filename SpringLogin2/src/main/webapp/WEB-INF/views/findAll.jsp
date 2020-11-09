<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page import="com.spring.login.entity.User" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>find all</title>
<style>
body{
background-color : #6E1023;
color: white;
}
</style>
</head>
<body>
<h2> tutti gli utenti</h2>

	<c:if test="${!empty utenti}">
		<table class="tabella">

		<c:forEach items="${utenti}" var="person">
			<tr>
				<td>${person.nome}</td>
				<td>${person.cognome}</td>
				<td>${person.email}</td>
				
				<td> 
					<form:form action = "${pageContext.request.contextPath}/delete/${person.id}" method = "POST" > 
							<button type = "submit"> elimina </button> 
					</form:form>
				</td>
	
				<td> 
					<form:form action = "${pageContext.request.contextPath}/editUser" method = "POST" modelAttribute="user">
							<form:input type="hidden" value="${person.id}" path="id" />
							<button type = "submit"> modifica </button> 
					</form:form>
				</td>				
			</tr>
		</c:forEach>
		</table>
	</c:if>

</body>
</html>