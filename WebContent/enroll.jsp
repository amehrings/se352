<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CC | Enroll</title>
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
	<c:url value="/enrollCourse" var="enrollURL"></c:url>
	<c:url value="/enrolledCourses" var="enrolledURL"></c:url>
	
	<div class="ui menu">
	  <div class="header item">
	    CampusConnect
	  </div>
	  <a class="item" href="courseScheduler">
	    Home
	  </a>
	</div>

	<div class="paddings">
	<h1 class="ui horizontal divider header">
	  <i class="shopping cart icon"></i>
	  MY COURSE CART
	</h1>
	<div class="eight wide column">
		<div style="min-height: 300px; max-height: 300px; overflow-y: auto;">
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
						<c:forEach items="${requestScope.courseCart}" var="courseCart">
							<c:url value="/enrollCourse" var="enrollURL">
								<c:param name="id" value="${courseCart.id}"></c:param>
							</c:url>
							<c:url value="/enrolledCourses" var="enrolledURL">
								<c:param name="id" value="${courseCart.id}"></c:param>
								<c:param name="name" value="${courseCart.name}"></c:param>
								<c:param name="location" value="${courseCart.location}"></c:param>
								<c:param name="professor" value="${courseCart.professor}"></c:param>
								<c:param name="times" value="${courseCart.times}"></c:param>
								<c:param name="description" value="${courseCart.description}"></c:param>
							</c:url>
							<c:url value="/removeCourseCartCourse" var="removeCourseURL">
								<c:param name="id" value="${courseCart.id}"></c:param>
							</c:url>
							<tr>
								<td><c:out value="${courseCart.name}"></c:out></td>
								<td><c:out value="${courseCart.description}"></c:out></td>
								<td><c:out value="${courseCart.professor}"></c:out></td>
								<td><c:out value="${courseCart.location}"></c:out></td>
								<td><c:out value="${courseCart.times}"></c:out></td>
								<td><a href='<c:out value="${enrolledURL}" escapeXml="true"></c:out>'>Enroll</a></td>
								<td><a href='<c:out value="${removeCourseURL}" escapeXml="true"></c:out>'>Remove</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
	</div>
</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>