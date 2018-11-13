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
		padding-bottom: 50px !important;
		background-color: aliceblue !important;
	}
	
	.paddings{
		padding-top: 2%;
		padding-left: 5%;
		padding-right: 5%;
		padding-bottom: 5%;
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


	<div class="ui menu">
	  <div class="header item">
	    CampusConnect
	  </div>
	  <a class="item" href="courseScheduler">
	    Home
	  </a>
	</div>

	<div class="paddings">
	<%-- Courses List Logic --%>
	<h1 class="ui horizontal divider header">
	  <i class="bookmark icon"></i>
	  SWAP &amp; DROP
	</h1>
	<div class="eight wide column">
		<div style="min-height: 300px; max-height: 300px; overflow-y: auto;">
			<c:if test="${not empty requestScope.enrolledCourses}">
				<table class="ui striped table">
					<thead>
						<tr>
							<th>Name</th>
							<th>Description</th>
							<th>Professor</th>
							<th>Location</th>
							<th>Times</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.enrolledCourses}" var="enrolledCourse">
							<c:url value="/droppedCourses" var="droppedURL">
								<c:param name="id" value="${enrolledCourse.id}"></c:param>
								<c:param name="name" value="${enrolledCourse.name}"></c:param>
								<c:param name="location" value="${enrolledCourse.location}"></c:param>
								<c:param name="professor" value="${enrolledCourse.professor}"></c:param>
								<c:param name="times" value="${enrolledCourse.times}"></c:param>
								<c:param name="description" value="${enrolledCourse.description}"></c:param>
							</c:url>
							<c:url value="/swappedCourses" var="swappedURL">
								<c:param name="id" value="${enrolledCourse.id}"></c:param>
								<c:param name="name" value="${enrolledCourse.name}"></c:param>
								<c:param name="location" value="${enrolledCourse.location}"></c:param>
								<c:param name="professor" value="${enrolledCourse.professor}"></c:param>
								<c:param name="times" value="${enrolledCourse.times}"></c:param>
								<c:param name="description" value="${enrolledCourse.description}"></c:param>
							</c:url>
							<tr>
								<td><c:out value="${enrolledCourse.name}"></c:out></td>
								<td><c:out value="${enrolledCourse.description}"></c:out></td>
								<td><c:out value="${enrolledCourse.professor}"></c:out></td>
								<td><c:out value="${enrolledCourse.location}"></c:out></td>
								<td><c:out value="${enrolledCourse.times}"></c:out></td>
								<td>
									<a href='<c:out value="${droppedURL}" escapeXml="true"></c:out>'>Drop</a>
								</td>
								<td>
									<a href='<c:out value="${swappedURL}" escapeXml="true"></c:out>'>Swap</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
	</div>

	
</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
