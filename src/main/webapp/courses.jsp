
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Courses</title>
<style>
table,th,td {
	border: 1px solid black;
}
</style>
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
	<c:url value="/addCourse" var="addURL"></c:url>
	<c:url value="/editCourse" var="editURL"></c:url>

	<%-- Edit Request --%>
	<c:if test="${requestScope.course ne null}">
		<form action='<c:out value="${editURL}"></c:out>' method="post">
			ID: <input type="text" value="${requestScope.course.id}"
				readonly="readonly" name="id"><br> Course Name: <input
				type="text" value="${requestScope.course.name}" name="name">
				<br> <input type="submit" value="Edit Course">
		</form>
	</c:if>

	<%-- Add Request --%>
	<c:if test="${requestScope.course eq null}">
		<form action='<c:out value="${addURL}"></c:out>' method="post">
			Course Name: <input type="text" name="name"> 
			<input type="submit" value="Add Course">
		</form>
	</c:if>

	<%-- Courses List Logic --%>
	<c:if test="${not empty requestScope.courses}">
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
						<%-- <td><c:out value="${person.country}"></c:out></td> --%>
						<td><a
							href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
						<td><a
							href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</body>
</html>
