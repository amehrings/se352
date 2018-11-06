
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
	<c:url value="/enrolledCourses" var="enrolledURL"></c:url>
	<c:url value="/droppedCourses" var="droppedURL"></c:url>



	<%-- Courses List Logic --%>
	<h1>ENROLLED COURSES</h1>
	<c:if test="${not empty requestScope.courses}">
		<table>
			<tbody>
				<tr>
					<th></th>
					<th>Name</th>
					<th>Location</th>
				</tr>
<!-- 				<form action="droppedCourses"> -->
<!-- 	<form action="swapCourse"> -->

				<c:forEach items="${requestScope.courses}" var="course">
					<c:url value="/enrolledCourses" var="enrolledURL">
						<c:param name="id" value="${course.id}"></c:param>
					</c:url>
					<c:url value="/droppedCourses" var="droppedURL">
						<c:param name="id" value="${course.id}"></c:param>
						<c:param name="name" value="${course.name}"></c:param>
						<c:param name="location" value="${course.location}"></c:param>
					</c:url>
					<tr>
<%-- 						<td><input type="checkbox" action="<c:out value="${droppedURL}" escapeXml="true"></c:out>"/></td> --%>
						<td><a
							href='<c:out value="${droppedURL}" escapeXml="true"></c:out>'>Drop</a></td>
						<td><c:out value="${course.name}"></c:out></td>
						<td><c:out value="${course.location}"></c:out></td>
 					</tr>
				</c:forEach>
				<tr>
					<td>
						<input type="submit" value="Swap"/>
					</td>
					<td>
						<input type="submit" value="Drop"/>
					</td>
				</tr>				
			</tbody>
		</table>
	</c:if>
	<br/>
	<br/>
	<br/>
	

	<h1>DROPPED COURSES</h1>
	<%-- Courses List Logic --%>
<%-- 	<c:if test="${droppedURL}"> --%>
		<table>
			<tbody>
				<tr>
					<th></th>
					<th>Name</th>
					<th>Location</th>
				</tr>
				<c:forEach items="${requestScope.droppedCourses}" var="droppedCourses">
					<c:url value="/droppedCourses" var="droppedURL">
						<c:param name="id" value="${droppedCourses.id}"></c:param>
					</c:url>
					<tr>
						<td><input type="checkbox" action="<c:out value="${droppedCourses.id}"></c:out>"/></td>
						<td><c:out value="${droppedCourses.name}"></c:out></td>
						<td><c:out value="${droppedCourses.location}"></c:out></td>
<!-- 						<td><a -->
<%-- 							href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
<%-- 	</c:if> --%>

	<br/>
	
	
	<a href="courses.jsp">Return to Courses</a>
	<a href="droppedCourses">Dropped</a>
	
</body>
</html>
