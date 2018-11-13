
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Enrolled Courses</title>
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
	<c:url value="/swappedCourses" var="swappedURL"></c:url>
	<c:url value="/swappedNewCourses" var="swappedNewCourseURL"></c:url>
	

	<h1>SWAP COURSE</h1>
	<%-- Courses List Logic --%>
	<c:if test="${not empty requestScope.swappedCourses}">
		<table class="ui celled table">
			<thead>
				<tr>
					<th></th>
					<th>Name</th>
					<th>Location</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.swappedCourses}" var="courses">
					<c:url value="/swappedCourses" var="swappedURL">
						<c:param name="id" value="${courses.id}"></c:param>
						<c:param name="name" value="${courses.name}"></c:param>
						<c:param name="location" value="${courses.location}"></c:param>
						<c:param name="professor" value="${courses.professor}"></c:param>
						<c:param name="times" value="${courses.times}"></c:param>
					</c:url>
					<c:url value="/swappedNewCourses" var="swappedNewCourseURL">
						<c:param name="id" value="${courses.id}"></c:param>
						<c:param name="name" value="${courses.name}"></c:param>
						<c:param name="location" value="${courses.location}"></c:param>
						<c:param name="professor" value="${courses.professor}"></c:param>
						<c:param name="times" value="${courses.times}"></c:param>
					</c:url>
					<tr>
						<td><c:out value="${courses.name}"></c:out></td>
						<td><c:out value="${courses.location}"></c:out></td>
						<td><c:out value="${courses.professor}"></c:out></td>
						<td><c:out value="${courses.times}"></c:out></td>
						<td><a
							href='<c:out value="${swappedNewCourseURL}" escapeXml="true"></c:out>'>Swap</a>
						</td>
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
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>