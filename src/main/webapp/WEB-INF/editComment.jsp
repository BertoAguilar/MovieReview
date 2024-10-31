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
<title>Edit Player</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/editPlayer.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JavaScript -->
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
		<form:form action="/comments/${comment.id}" method="post" modelAttribute="comment">
		<input type="hidden" name="_method" value="put">
			<p>
				<form:errors path="commentText" class="text-danger" />
				<form:input type="text-area" path="commentText" class="input-group" placeholder="Leave A Comment!"/>
			</p>
			<div>
				<form:label path="isRecommended">Do you Recommend This?</form:label>
				<div class="radioGroup">
					<form:radiobutton value="True" label="Yes" path="isRecommended" />
				</div>
				<div class="radioGroup">
					<form:radiobutton value="False" label="No" path="isRecommended" />
				</div>
			</div>
			<p>
				<form:label path="commentRating">Rating</form:label>
				<form:errors path="commentRating" class="text-danger" />
				<form:input type="number" path="commentRating" class="input-group" />
			</p>
			<div class="buttonGroup">
				<a href="/Home" class="btn btn-primary">Home</a> 
				<input type="submit" value="Submit" class="btn btn-success" />
			</div>
		</form:form>
</body>
</html>