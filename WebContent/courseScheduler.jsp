
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Courses</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<%-- Courses List Logic --%>
	<%-- <c:if test="${not empty requestScope.courses}"> --%>
	<table>
		<tbody>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${requestScope.courses}" var="course">
				<c:url value="/editCourse" var="editURL">
					<c:param name="id" value="${course.id}"></c:param>
				</c:url>
				<c:url value="/deleteCourse" var="deleteURL">
					<c:param name="id" value="${course.id}"></c:param>
				</c:url>
				<tr>
					<td><c:out value="${course.id}"></c:out></td>
					<td><c:out value="${course.name}"></c:out></td>
					<td><c:out value="${person.location}"></c:out></td>
					<td><a
						href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
					<td><a
						href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%-- </c:if> --%>
	
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
	
	
	
	
	
</body>
</html>
