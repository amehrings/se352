<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CC | Enrolled Courses</title>
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
	<c:url value="/enrolledCourses" var="enrolledURL"></c:url>
	<c:url value="/droppedCourses" var="droppedURL"></c:url>



	<%-- Courses List Logic --%>
	<h1>ENROLLED COURSES</h1>
	<c:if test="${not empty requestScope.courses}">
		<table class="ui very basic table">
			<thead>
			
				<tr>
					<th>Name</th>
					<th>Location</th>
					<th>Professor</th>
					<th>Time</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
<!-- 				<form action="droppedCourses"> -->
<!-- 	<form action="swapCourse"> -->

				<c:forEach items="${requestScope.enrolledCourses}" var="course">
					<c:url value="/enrolledCourses" var="enrolledURL">
						<c:param name="id" value="${enrolledCourses.id}"></c:param>
					</c:url>
					<c:url value="/droppedCourses" var="droppedURL">
						<c:param name="id" value="${course.id}"></c:param>
						<c:param name="name" value="${course.name}"></c:param>
						<c:param name="location" value="${course.location}"></c:param>
						<c:param name="professor" value="${course.professor}"></c:param>
						<c:param name="times" value="${course.times}"></c:param>
					</c:url>
					<c:url value="/swappedCourses" var="swappedURL">
						<c:param name="id" value="${course.id}"></c:param>
						<c:param name="name" value="${course.name}"></c:param>
						<c:param name="location" value="${course.location}"></c:param>
						<c:param name="professor" value="${course.professor}"></c:param>
						<c:param name="times" value="${course.times}"></c:param>
					</c:url>
					<tr>
<%-- 						<td><input type="checkbox" action="<c:out value="${droppedURL}" escapeXml="true"></c:out>"/></td> --%>
						<td><c:out value="${course.name}"></c:out></td>
						<td><c:out value="${course.location}"></c:out></td>
						<td><c:out value="${course.professor}"></c:out></td>
						<td><c:out value="${course.times}"></c:out></td>
						<td><a
							href='<c:out value="${droppedURL}" escapeXml="true"></c:out>'>Drop</a>
						</td>
						<td>
							<a
							href='<c:out value="${swappedURL}" escapeXml="true"></c:out>'>Swap</a>
						</td>
 					</tr>
				</c:forEach>
<!-- 				<tr> -->
<!-- 					<td> -->
<!-- 						<button type="submit" value="Swap" class="ui button primary">Swap</button> -->
<!-- 					</td> -->
<!-- 					<td> -->
<!-- 						<button type="submit" value="Drop" class="ui button primary">Drop</button> -->
<!-- 					</td> -->
<!-- 				</tr>				 -->
			</tbody>
		</table>
	</c:if>
	<br/>
	<br/>
	<br/>
	

<!-- 	<h1>DROPPED COURSES</h1> -->
<%-- 	<c:if test="${droppedURL}"> --%>
<!-- 		<table class="ui celled table"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th></th> -->
<!-- 					<th>Name</th> -->
<!-- 					<th>Location</th> -->
<!-- 				</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 				<c:forEach items="${requestScope.droppedCourses}" var="droppedCourses"> --%>
<%-- 					<c:url value="/droppedCourses" var="droppedURL"> --%>
<%-- 						<c:param name="id" value="${droppedCourses.id}"></c:param> --%>
<%-- 					</c:url> --%>
<!-- 					<tr> -->
<%-- 						<td><input type="checkbox" action="<c:out value="${droppedCourses.id}"></c:out>"/></td> --%>
<%-- 						<td><c:out value="${droppedCourses.name}"></c:out></td> --%>
<%-- 						<td><c:out value="${droppedCourses.location}"></c:out></td> --%>
<!-- 						<td><a -->
<%-- 							href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
<%-- 	</c:if> --%>

	<br/>
	
	
	<a href="enrollCourse"><button class="ui button primary">Return to Course Cart</button></a>
	<a href="droppedCoursesList"><button class="ui button secondary">View Dropped Courses</button></a>
	
</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
