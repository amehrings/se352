<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CC | Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style>
	body {
		padding: 50px !important;
	}
	
	input#isStudent {
		margin-left: 1 %;
	}
</style>
</head>
	<body style="padding:0 !important;">
		<c:url value="/courseScheduler" var="schedulerURL"></c:url>
		<div class="ui two column grid">
			<div class="row">
				<div class="eight wide column">
					<img src="<c:url value='/assets/depaul.png'/>" style="height:100vh"/>
				</div>
				<div class="eight wide column">
					<form action='<c:out value="${schedulerURL}"></c:out>' method="get" class="ui form" style="padding-right: 200px; padding-top: 40px;">
						<h4 class="ui dividing header">Login with your Campus Connect Credentials</h4>
						<div class="field">
							<label>Username</label>
							<input type="text" placeholder="Username" maxlength="20" required/>
						</div>
						<div class="field">
							<label>Password</label>
							<input type="password" placeholder="Password" minlength="8" maxlength="20" required/>
						</div>
						<div class="field">
							<label>Student or Faculty?</label>
							Student: <input id="isStudent" name="isStudent" value="yes" type="radio" required/>
							Faculty: <input id="isStudent" name="isStudent" value="no" type="radio" required/ >
						</div>
						<button type="submit" class="ui button submit">Login</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>