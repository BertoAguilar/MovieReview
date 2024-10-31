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
<title>Edit ${movie.title}</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/newMovie.css" />
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
	<div>
		<h1>Edit </h1>
		<form:form action="/movies/${movie.id}" method="post" modelAttribute="movie" enctype="multipart/form-data">
		<input type="hidden" name="_method" value="put">
			<p>
				<form:label path="title">Title</form:label>
				<form:errors path="title" class="text-danger" />
				<form:input path="title" class="input-group" />
			</p>
			<p>
				<form:label path="director">Director</form:label>
				<form:errors path="director" class="text-danger" />
				<form:input path="director" class="input-group" />
			</p>
			<p>
				<form:label path="plot">Plot</form:label>
				<form:errors path="plot" class="text-danger" />
				<form:textarea path="plot" class="input-group" rows="4" cols="50" />
			</p>
			<p>
				<form:label path="rating">Rating</form:label>
				<form:errors path="rating" class="text-danger" />
				<form:input type="number" path="rating" class="input-group" max="10" min="1"/>
			</p>


            <div>
                <form:label path="coverImage">Movie Cover</form:label>
                <input type="file" required id="coverPicture" name="coverPicture"/>
                <form:errors path="coverImage" class="text-danger" />
            </div>

			<div>
				<a href="/Home" class="btn btn-primary">Home</a> <input
					type="submit" value="Submit" class="btn btn-success" />
			</div>
		</form:form>
	</div>
</body>
</html>