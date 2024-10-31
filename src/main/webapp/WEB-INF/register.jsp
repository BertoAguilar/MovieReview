<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- For JSTL Forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login And Register</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/register.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JavaScript -->
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
	<div class="container">
		<div>
			<div class="card">
				<form:form action="/register/user" method="post"
					modelAttribute="newUser" class="box">
					<h2>Register</h2>
						<a href="/">Already have an account? Login!</a>
					<div class="mb-2">
						<form:input class="form-control" type="text" path="firstName"
							placeholder="First Name" />
						<form:errors path="firstName" class="text-danger" />
					</div>
					<div class="mb-2">
						<form:input class="form-control" type="text" path="lastName"
							placeholder="Last Name" />
						<form:errors class="text-danger" path="lastName" />
					</div>
					<div class="mb-2">
						<form:input class="form-control" type="email" path="email"
							placeholder="Email" />
						<form:errors class="text-danger" path="email" />
					</div>
					<div class="mb-2">
						<form:input class="form-control" type="password" path="password"
							placeholder="Password" />
						<form:errors class="text-danger" path="password" />
					</div>
					<div class="mb-2">
						<form:input class="form-control" type="password" path="confirm"
							placeholder="Confirm Password" />
						<form:errors class="text-danger" path="confirm" />
					</div>
					<input class="btn btn-primary" type="submit" name=""
						value="Register">
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>