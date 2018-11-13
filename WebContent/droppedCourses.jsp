<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CC | Dropped Courses</title>
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
	<c:url value="/droppedCourses" var="droppedURL"></c:url>


	<%-- Courses List Logic --%>
	<c:if test="${not empty requestScope.droppedCourses}">
		<table class="ui celled table">
			<thead>
				<tr>
					<th></th>
					<th>Name</th>
					<th>Location</th>
				</tr>
			</thead>
			<tbody>
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
	</c:if>

	<br/>
	<br/>
	<br/>

	<a href="courses.jsp"><button class="ui button secondary">Return to Courses</button></a>
	
</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>