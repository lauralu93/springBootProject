<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>benvenuto!</title>
<style>
body{
background-color : #6E1023;
color: white;
}
</style>
</head>
<body>
	<h1> bentornato! </h1>
	
	<table>
	<h2> dati utente</h2>
		<tr> 
			<td> NOME: </td>
			<td> ${nomeUtente}</td>
		</tr>
		<tr> 
			<td> COGNOME:</td>
			<td> ${cognomeUtente}</td>
		</tr>
	</table>
	
	
		<table>
		<h3> cosa desideri fare ?</h3>
			<tr> 				
				<td> cerca utente <a href="${pageContext.request.contextPath}/cercaUtente"><input name = "find" type='submit' value='find'></a></td>	
			</tr>
		</table> 	
		
		<form : form method="GET" action="find" >	
			<table>
				<tr> 
					<td> tutti gli utenti <input name = "findAll"  type="submit" value="findAll" ></td>
					<td> </td>
				</tr>
			</table> 	
		</form>	
		
	
	
</body>
</html>