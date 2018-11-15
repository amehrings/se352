
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
	<c:url value="/swappedCourses" var="swappedURL"></c:url>
	<c:url value="/swappedNewCourses" var="swappedNewCourseURL"></c:url>
	

	<div class="ui menu">
	  <div class="header item">
	    CampusConnect
	  </div>
	  <a class="item" href="courseScheduler">
	    Home
	  </a>
	</div>
		
	<div class="paddings">
	<h1>SWAP COURSE FROM COURSE CART</h1>
	<%-- Courses List Logic --%>
	<div class="eight wide column">
		<div style="min-height: 300px; max-height: 300px; overflow-y: auto;">
			<c:if test="${not empty requestScope.swappedCourses}">
				<table class="ui striped table">
					<thead>
						<tr>
			 				<th>Name</th>
							<th>Description</th>
							<th>Professor</th>
							<th>Location</th>
							<th>Time</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.swappedCourses}" var="swappedCourse">
							<c:url value="/swappedCourses" var="swappedURL">
								<c:param name="id" value="${swappedCourse.id}"></c:param>
								<c:param name="name" value="${swappedCourse.name}"></c:param>
								<c:param name="location" value="${swappedCourse.location}"></c:param>
								<c:param name="professor" value="${swappedCourse.professor}"></c:param>
								<c:param name="times" value="${swappedCourse.times}"></c:param>
								<c:param name="description" value="${swappedCourse.description}"></c:param>
							</c:url>
							<c:url value="/swappedNewCourses" var="swappedNewCourseURL">
								<c:param name="id" value="${swappedCourse.id}"></c:param>
								<c:param name="name" value="${swappedCourse.name}"></c:param>
								<c:param name="location" value="${swappedCourse.location}"></c:param>
								<c:param name="professor" value="${swappedCourse.professor}"></c:param>
								<c:param name="times" value="${swappedCourse.times}"></c:param>
								<c:param name="description" value="${swappedCourse.description}"></c:param>
							</c:url>
							<tr>
								<td><c:out value="${swappedCourse.name}"></c:out></td>
								<td><c:out value="${swappedCourse.description}"></c:out></td>
								<td><c:out value="${swappedCourse.professor}"></c:out></td>
								<td><c:out value="${swappedCourse.location}"></c:out></td>
								<td><c:out value="${swappedCourse.times}"></c:out></td>
								<td><a
									href='<c:out value="${swappedNewCourseURL}" escapeXml="true"></c:out>'>Swap</a>
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