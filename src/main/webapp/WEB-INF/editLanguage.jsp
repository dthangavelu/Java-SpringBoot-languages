<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit</title>
</head>
<body>

<a href="/languages">Dashboard</a>
<a href="/delete/${ lang.name }">Delete</a>

<c:if test = "${name_error != null}">
	<p class="ui_errors"><c:out value="${ name_error }" /></p>    
</c:if>

<c:if test = "${creator_error != null}">
	<p class="ui_errors"><c:out value="${ creator_error }" /></p>    
</c:if>

<c:if test = "${version_error != null}">
	<p class="ui_errors"><c:out value="${ version_error }" /></p>    
</c:if>

<br><br>


<form:form method="POST" action="/edit/${lang.name }" modelAttribute="language">
    <form:label path="name">Name
    <form:errors path="name"/>
    <form:input path="name" type="text" value="${lang.name}"/></form:label><br><br>
    
    <form:label path="creator">Creator
    <form:errors path="creator"/>
    <form:input path="creator" type="text" value="${lang.creator }"/></form:label><br><br>
    
    <form:label path="version">Version
    <form:errors path="version"/>
    <form:input path="version" type="text" value="${lang.version }"/></form:label><br><br>
    
    <input type="submit" value="Update"/>
</form:form>	


</body>
</html>