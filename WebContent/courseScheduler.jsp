<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CC | Course Scheduler</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style>
	body {
		background-color: aliceblue !important;
		
	}
	
	.ui.top.attached.header{
		background-color: #93C8FD !important;
	}
	
	.topPadding{
		padding-top: 50px;
	}
	
	.rightColPadding{
		padding-top: 30px;
		padding-bottom: 30px;
	}
	
	.paddings{
		padding-top: 2%;
		padding-left: 5%;
		padding-right: 5%;
	}
	
	.rightHeaderPadding{
		padding-top:25px;
	}
	
	.indent{
   		text-indent:15px;
	}
</style>
</head>
<body>	

<div class="ui menu">
  <div class="header item">
    CampusConnect
  </div>
  <a class="item" href="courseScheduler">
    Home
  </a>
</div>

<div class="paddings">
	<div class="ui grid">
		<div class="ten wide column">
			<h1 class="ui top attached header">
			  Course Scheduler
			</h1>
			<div class="ui attached segment">
			  <div class="topPadding">
				<h4 class="ui horizontal divider header">
				  <i class="shopping cart icon"></i>
				  COURSE CART
				</h4>
				<div class="ui grid">
					<div class="twelve wide column">
						<div style="min-height: 300px; max-height: 300px; overflow-y: auto;">
								<table class="ui striped table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Professor</th>
											<th>Location</th>
											<th>Times</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestScope.courses}" var="course">
											<tr>
												<td><c:out value="${course.name}"></c:out></td>
												<td><c:out value="${course.professor}"></c:out></td>
												<td><c:out value="${course.location}"></c:out></td>
												<td><c:out value="${course.times}"></c:out></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
						</div>
					</div>
					<div class="four wide column">
						<h3>Actions:</h3>
						<p><a href="search">Search for Courses</a></p>
						<p><a href="enrollCourse">View Course Cart</a></p>
					</div>
				</div>
				</div>
				 <div class="topPadding">
					<h4 class="ui horizontal divider header">
					  <i class="bookmark icon"></i>
					  ENROLLED COURSES
					</h4>
					<div class="ui grid">
						<div class="twelve wide column">
							<div style="min-height: 300px; max-height: 300px; overflow-y: auto;">
								<c:if test="${not empty requestScope.enrolledCourses}">
									<table class="ui striped table">
										<thead>
											<tr>
												<th>Name</th>
												<th>Professor</th>
												<th>Location</th>
												<th>Times</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${requestScope.enrolledCourses}" var="enrolledCourse">
												<tr>
													<td><c:out value="${enrolledCourse.name}"></c:out></td>
													<td><c:out value="${enrolledCourse.professor}"></c:out></td>
													<td><c:out value="${enrolledCourse.location}"></c:out></td>
													<td><c:out value="${enrolledCourse.times}"></c:out></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
							</div>
						</div>
						<div class="four wide column">
							<h3>Actions:</h3>
							<p><a href="enrollCourse">Course Enroll</a></p>
							<p><a href="enrolledCourses">Swap/Drop Courses</a></p>
							<p><a href="droppedCoursesList">View Dropped Courses</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="six wide column">
			
			
			<h1 class="ui top attached header">
			  To-Do
			</h1>
			<div class="ui attached segment">
				<div class="topPadding">
					<c:if test="${not empty requestScope.toDoItems}">
						<table class="ui very basic table">
							<thead>
								<tr>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.toDoItems}" var="toDoItem">
								<c:url value="/toDoItems" var="toDoItemURL">
									<c:param name="item" value="${toDoItem}"></c:param>
								</c:url>
									<tr>
										<td>
											<a href='<c:out value="${toDoItemURL}" escapeXml="true"></c:out>'><i class="square outline icon"></i></a>
											<c:out value="${toDoItem}"></c:out>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<c:if test="${not empty requestScope.finishedItems}">
						<table class="ui very basic table">
							<thead>
								<tr>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.finishedItems}" var="finishedItem">
									<tr>
										<td><i class="check square icon"></i><c:out value="${finishedItem}"></c:out></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>	
			
			
			
			<div class="rightHeaderPadding">			
				<h1 class="ui top attached header">
				  Advising
				</h1>
				<div class="ui attached segment">
						<h2>Your Advisor</h2>
				     	<div class="ui divider"></div>
						<div class="ui items">
						  <div class="item">
						    <a class="ui tiny image">
						      <img src="<c:url value='/assets/L6Cg7ows.jpg'/>"/>
						    </a>
						    <div class="content">
						      <a class="header">Contact information:</a>
						      <div class="description">
						        <p class = "indent">Name: Dibs the Mascot</p>
						        <p class = "indent">Email: <a>dibs@depaul.edu</a></p>
						        <p class = "indent">Number: 123-456-7890</p>
						      </div>
						    </div>
						  </div>
						</div>
						<a href="https://campusconnect.depaul.edu/psp/CSPRD92/?cmd=login">Schedule Appointment (Bluestar) ></a>
				</div>
			</div>	
			
			<div class="rightHeaderPadding">			
				<h1 class="ui top attached header">
				  Quick Links
				</h1>
				<div class="ui attached segment">
					<p><a href="https://campusconnect.depaul.edu/psp/CSPRD92/?cmd=login">Financial Aid ></a></p>
					<p><a href="https://campusconnect.depaul.edu/psp/CSPRD92/?cmd=login">Degree Progress Report ></a></p>
					<p><a href="https://campusconnect.depaul.edu/psp/CSPRD92/?cmd=login">Request Unofficial Transcript ></a></p>
					<p><a href="https://campusconnect.depaul.edu/psp/CSPRD92/?cmd=login">Student Worker Portal ></a></p>
				</div>
			</div>	
		</div>
	</div>
</div>
</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>