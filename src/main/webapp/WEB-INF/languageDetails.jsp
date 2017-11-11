<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Language Details</title>
</head>
<body>
<br>
<br>
<a href="/languages">Dashboard</a>
<a href="/edit/${ lang.name }">Edit</a> |
<a href="/delete/${ lang.name }">Delete</a>

<br>

Name: <c:out value="${ lang.name }" /> <br>
Creator: <c:out value="${ lang.creator }" /> <br>
Version: <c:out value="${ lang.version }" /> <br>

</body>
</html>