<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CC | Admin | Manage Courses</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style>
	body {
		padding: 50px !important;
	}
	.container.scrollable {
		max-height: 400px;
		overflow-y: auto;
	}
	
	p#toDoDesc {
		color: gray;
	}
</style>
</head>
<body>
	
	<c:url value="/addCourse" var="addURL"></c:url>
	<c:url value="/editCourse" var="editURL"></c:url>
	<c:url value="/addToDo" var="addToDoURL"></c:url>
	<c:url value="/editToDo" var="editToDoURL"></c:url>
	
	<h1>Admin View</h1> <a href="login.jsp">(Log Out)</a>
	<br><br>
	<h2>Add/Edit/Delete Courses</h2>
	<div class="ui divider"></div>
	<%-- Course Add/Edit logic --%>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.success}"></c:out></strong>
	</c:if>
	<%-- Edit Request --%>
	<c:if test="${requestScope.course ne null}">
		<form action='<c:out value="${editURL}"></c:out>' method="post" class="ui form">
			<div class="field"><label>Course ID: </label><input type="text" value="${requestScope.course.id}" readonly="readonly" name="id"></div>
				<div class="two fields"><div class="field"><label>Course Name: </label><input type="text" value="${requestScope.course.name}" name="name" maxlength="7"></div>
				<div class="field"><label>Course Location: </label><input type="text" value="${requestScope.course.location}" name="location" maxlength="15"></div></div>
				<div class="field"><label>Course Description: </label><input type="text" value="${requestScope.course.description}" name="description" maxlength="50"/></div>
				<div class="two fields"><div class="field"><label>Course Professor: </label><input type="text" value="${requestScope.course.professor}" name="professor" maxlength="30"></div>
				<div class="field"><label>Course Times: </label><input type="text" value="${requestScope.course.times}" name="times" maxlength="11"></div></div>
				<button type="submit" class="ui button">Edit Course</button>
		</form>
	</c:if>

	<%-- Add Request --%>
	<c:if test="${requestScope.course eq null}">
		<form action='<c:out value="${addURL}"></c:out>' method="post" class="ui form">
			<div class="two fields"><div class="field"><label>Course Name: </label><input type="text" name="name" maxlength="7"></div> 
			<div class="field"><label>Course Location: </label><input type="text" name="location" maxlength="15"></div></div>
			<div class="field"><label>Course Description: </label><input type="text" name="description" maxlength="50"/></div>
			<div class="two fields"><div class="field"><label>Course Professor: </label><input type="text" name="professor" maxlength="30"></div>
			<div class="field"><label>Course Times: </label><input type="text" name="times" maxlength="11"></div></div>
			<button type="submit" class="ui button">Add Course</button>
		</form>
	</c:if>	
	
	
	<br> 
	<%-- Courses List Logic --%>
	<c:if test="${not empty requestScope.courses}">
		<div class="" style="max-height:400px; overflow-y: auto;">
			<table class="ui striped table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Description</th>
						<th>Professor</th>
						<th>Location</th>
						<th>Times</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
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
							<td><c:out value="${course.description}"></c:out></td>
							<td><c:out value="${course.professor}"></c:out></td>
							<td><c:out value="${course.location}"></c:out></td>
							<td><c:out value="${course.times}"></c:out></td>
							<td><a
								href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
							<td><a
								href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	
	<br><br>
	<!-- adding to-dos -->
	<h2>To-Dos</h2>
	<c:if test="${requestScope.todoError ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.todoError}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.todoSuccess ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.todoSuccess}"></c:out></strong>
	</c:if>
	<p id="toDoDesc">Add any action items for students here.</p>
	
	<c:if test="${requestScope.newToDo eq null}">
		<form action='<c:out value="${addToDoURL}"></c:out>' method="post" class="ui form">
			<div class="field">
				<label>Action item to add:</label>
				<input type="text" name="itemToAdd" maxlength="30">
			</div>
			<button type="submit" class="ui button">Add To-Do</button>
		</form>
	</c:if>
	<!-- edit to do -->
	<c:if test="${requestScope.newToDo ne null}">
		<form action='<c:out value="${editToDoURL}"></c:out>' method="post" class="ui form">
			<div class="field">
				<label>Course ID: </label>
				<input type="text" value="${requestScope.newToDo}" name="newToDo">
			</div>
				<button type="submit" class="ui button">Edit To-Do</button>
		</form>
	</c:if>
	
	
	
	<!-- listing to dos -->
	<br> 
	<c:if test="${not empty requestScope.toDoItems}">
		<div class="" style="max-height:400px; overflow-y: auto;">
			<table class="ui striped table">
				<thead>
					<tr>
						<th>To Do</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.toDoItems}" var="todo">
						<c:url value="/editToDo" var="editToDoURL">
							<c:param name="newToDo" value="${todo}"></c:param>
						</c:url>
						<c:url value="/deleteToDo" var="deleteToDoURL">
							<c:param name="toDoDel" value="${todo}"></c:param>
						</c:url>
						<tr>
							<td><c:out value="${todo}"></c:out></td>
							<td><a
								href='<c:out value="${editToDoURL}" escapeXml="true"></c:out>'>Edit</a></td>
							<td><a
								href='<c:out value="${deleteToDoURL}" escapeXml="true"></c:out>'>Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	
	
	
	<br/>
	<br/>
	
</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
