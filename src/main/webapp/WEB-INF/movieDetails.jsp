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
<title><c:out value="${movie.title}" /></title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/movieDetails.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JavaScript -->
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/Home"> <img alt="movieReviewLogo" src="/img/2503508.png" style="width: 55px;" > Movie Review!</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
          				<a class="nav-link" aria-current="page" href="/Home">Dashboard</a>
        			</li>
        			<li class="nav-item">
          				<a class="nav-link" aria-current="page" href="/movies/new">Add A Movie</a>
        			</li>
        			<li class="nav-item">
          				<a href="/logout" class="nav-link">Logout</a>
        			</li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	<h1><c:out value="${movie.title}" /></h1>
	<p><img src="/uploads/cover_pictures/${movie.coverImage}"
		alt="${movie.title}'s Cover Image" style="width: 150px;"></p>
	<p>Directed By: <c:out value="${movie.director}" /></p>
	<p style="max-width:300px;"><c:out value="${movie.plot}" /></p>
	<p>Rating <c:out value="${movie.rating}"/> / 10</p>
	<c:if test="${user.id == movie.user.id}">
	<div class="links">
		<a href="/movies/edit/${movie.id}" class="btn btn-warning">Edit</a>
		<form action="/movies/destroy/${movie.id}" method="post">
			<input type="hidden" name="_method" value="delete"> 
			<input type="submit" value="Delete" class="deleteBtn btn btn-danger">
		</form>
	</div>
	</c:if>
		
		
		<div class="addCommentContainer">
		<form:form action="/newcomments/${movie.id}" method="POST" modelAttribute="comment" class="addCommentForm">
			<p>
				<form:errors path="commentText" class="text-danger" />
				<form:textarea path="commentText" class="input-group" placeholder="Leave A Comment!" rows="4" cols="50" required="yes"/>
			</p>
			<div class="radioGroup">
				<form:label path="isRecommended">Do you Recommend This?</form:label>
				<div class="radioGroup">
					<form:radiobutton value="True" label="Yes" path="isRecommended" required="yes" />
				</div>
				<div class="radioGroup">
					<form:radiobutton value="False" label="No" path="isRecommended" />
				</div>
			</div>
			<p class="commentRating">
				<form:label path="commentRating">Rating</form:label>
				<form:errors path="commentRating" class="text-danger" />
				<form:input type="number" path="commentRating" class="input-group" max="10" min="1" required="yes"/>
			</p>
			<div class="buttonGroup">
				<input type="submit" value="Submit" class="btn btn-success" />
			</div>
		</form:form>
		</div> 
<div>
    <c:forEach var="comment" items="${comments}">
        <c:if test="${movie.id == comment.movie.id}">
            <div class="commentsCard card card-body">
                <h3 class="card-title"><c:out value="${comment.user.firstName}" /> <c:out value="${comment.user.lastName}" /></h3>
                <p class="card-text"><c:out value="${comment.commentText}" /></p>
                <div>
                    <c:if test="${comment.isRecommended}">
                        <p>My Recommendation: Go Read It!</p>
                    </c:if>
                    <c:if test="${!comment.isRecommended}">
                        <p>My Recommendation: Don't Bother</p>
                    </c:if>
                    <p>I Rate It A <c:out value="${comment.commentRating}" /> / 10</p>
                </div>
                <c:if test="${comment.user.id == userId}">
                    <div>
                        <form action="/comments/destroy/${comment.id}" method="post">
                            <input type="hidden" name="_method" value="delete">
                            <input type="submit" value="Delete" class="btn btn-danger">
                        </form>
                    </div>
                </c:if>
            </div>
        </c:if>
    </c:forEach>
</div>
	</body>
</html>