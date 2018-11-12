
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Courses</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style>
	body {
		padding: 50px !important;
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
	<c:url value="/enrollCourse" var="enrollURL"></c:url>
	<c:url value="/enrolledCourses" var="enrolledURL"></c:url>
	
	<h1>COURSE CART</h1>
	<%-- Courses List Logic --%>
	<c:if test="${not empty requestScope.courses}">
		<table class="ui unstackable table">
			<thead>
				<tr>
<!-- 					<th>ID</th> -->
					<th>Name</th>
					<th>Location</th>
					<th>Professor</th>
					<th>Time</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.courses}" var="course">
					<c:url value="/enrollCourse" var="enrollURL">
						<c:param name="id" value="${course.id}"></c:param>
					</c:url>
					<c:url value="/enrolledCourses" var="enrolledURL">
						<c:param name="id" value="${course.id}"></c:param>
						<c:param name="name" value="${course.name}"></c:param>
						<c:param name="location" value="${course.location}"></c:param>
						<c:param name="professor" value="${course.professor}"></c:param>
						<c:param name="times" value="${course.times}"></c:param>
					</c:url>
					<tr>
						<td><c:out value="${course.name}"></c:out></td>
						<td><c:out value="${course.location}"></c:out></td>
						<td><c:out value="${course.professor}"></c:out></td>
						<td><c:out value="${course.times}"></c:out></td>
						<td>
							<a href='<c:out value="${enrolledURL}" escapeXml="true"></c:out>'>Enroll</a>
						</td>
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
	
	<a href="enrolledCourses"><button class="ui button primary">View Enrolled Courses</button></a>
	<a href="courses.jsp"><button class="ui button secondary">Return to Courses</button></a>

</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>