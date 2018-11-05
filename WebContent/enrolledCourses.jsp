
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Enrolled Courses</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.10/angular-material.min.css">
</head>
<body>
	<%-- Course Add/Edit logic --%>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.success}"></c:out></strong>
	</c:if>
	<c:url value="/enrollCourse" var="enrollURL"></c:url>


	<%-- Courses List Logic --%>
	<c:if test="${not empty requestScope.courses}">
		<table>
			<tbody>
				<tr>
					<th>Name</th>
					<th>Enroll</th>
				</tr>
				<c:forEach items="${requestScope.courses}" var="course">
					<c:url value="/enrollCourse" var="enrollURL">
						<c:param name="id" value="${course.id}"></c:param>
					</c:url>
					<tr>
						<td><input type="checkbox" action="<c:out value="${course.id}"></c:out>"/></td>
						<td><c:out value="${course.name}"></c:out></td>
						<td><c:out value="${person.location}"></c:out></td>
						<td><a
							href='<c:out value="${enrollURL}" escapeXml="true"></c:out>'>Enroll</a></td>
<!-- 						<td><a -->
<%-- 							href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	
	<br/>
	<br/>
	<br/>
	<%-- <!-- USERS -->
	<c:url value="/addUser" var="addUserURL"></c:url>
	<c:url value="/editUser" var="editUserURL"></c:url>
	<c:if test="${requestScope.user eq null}">
		<form action='<c:out value="${addUserURL}"></c:out>' method="post">
			Name: <input type="text" name="name"> 
			<br> Courses (comma separated): <input type="text" name="courses">
			<br> Date of Birth: <input type="text" name="dateOfBirth">
			<br> <input type="submit" value="Add User">
		</form>
	</c:if> --%>
	
	
	
	<a href="courses.jsp">Return to Courses</a>
	
</body>
</html>
