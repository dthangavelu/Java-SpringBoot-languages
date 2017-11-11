<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Languages</title>
<link rel="stylesheet" type="text/css" href="css/style.css" >
</head>
<body>
	<!--   <c:out value="${2+2}"/> -->
	
	<table>
  <tr>
    <th>Name</th>
    <th>Creator</th>
    <th>Version</th>
    <th>Action</th>
  </tr>
  <c:forEach var='lang' items="${ allLang }">
  
	  <tr>
		    <td><a href="/languages/${ lang.name }">${ lang.name }</a></td>
		    <td>${ lang.creator }</td>
		    <td>${ lang.version }</td>
		    <td>
		    	<a href="/edit/${ lang.name }">Edit</a> | 
		    	<a href="/delete/${ lang.name }">Delete</a>
			</td>
	  </tr>
  </c:forEach>
</table>
	
<br><br>

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

<form:form method="POST" action="/language/new" modelAttribute="language">
    <form:label path="name">Name
    <form:errors path="name"/>
    <form:input path="name" type="text"/></form:label><br><br>
    
    <form:label path="creator">Creator
    <form:errors path="creator"/>
    <form:input path="creator" type="text"/></form:label><br><br>
    
    <form:label path="version">Version
    <form:errors path="version"/>
    <form:input path="version" type="text"/></form:label><br><br>
    
    <input type="submit" value="Add"/>
</form:form>	
	
</body>
</html>