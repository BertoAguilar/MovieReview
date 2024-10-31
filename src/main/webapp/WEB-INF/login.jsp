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
<title>Login</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/login.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JavaScript -->
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="card">
				<div>
					<form:form action="/login/user" method="post"
						modelAttribute="newLogin" class="box">
						<h2>Login</h2>
						<p class="fw-lighter fst-italic text-secondary-emphasis">Please
							Enter Your Email and Password!</p>
						<a href="/register">Need To Register?</a>
						<div class="mb-2">
							<form:errors class="text-danger" path="email" />
							<form:input class="form-control" type="email" path="email" placeholder="Email" />
						</div>
						<div class="mb-2">
							<form:input class="form-control" type="password" path="password"
								placeholder="Password" />
							<form:errors class="text-danger" path="password" />
						</div>
						<input class="btn btn-primary" type="submit" name="" value="Login">
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>