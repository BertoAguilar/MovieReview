<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Format Date -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- For JSTL Forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome <c:out value="${ user.firstName}" /></title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/homepage.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JavaScript -->
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/Home"> <img alt="movieReviewLogo" src="img/2503508.png" style="width: 55px;" > Movie Review!</a>
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
		<div class="container mt-3">
			<h1>All Of Our Movies</h1>
			<div class="allMovies">
					<c:forEach var="movie" items="${movies}">
					<div class="movieContainer">
							<p><a href="/movie/details/${movie.id}"> <c:out value="${movie.title}" /></a></p>
							<p><a href="/movie/details/${movie.id}"> <img src="/uploads/cover_pictures/${movie.coverImage}" alt="${movie.title}'s Cover Image" style="width:150px;"></a></p>
					</div>
		            </c:forEach>
			</div>
		</div>
</body>
</html>