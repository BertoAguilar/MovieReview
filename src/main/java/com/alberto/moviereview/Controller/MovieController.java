package com.alberto.moviereview.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alberto.moviereview.Model.Comment;
import com.alberto.moviereview.Model.Movie;
import com.alberto.moviereview.Model.User;
import com.alberto.moviereview.Service.CommentService;
import com.alberto.moviereview.Service.MovieService;
import com.alberto.moviereview.Service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MovieController {

	@Autowired
	UserService userService;

	@Autowired
	MovieService movieService;
	
	@Autowired
	CommentService commentService;

	// Home Page
	@GetMapping("/Home")
	public String homepage(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		model.addAttribute("user", userService.getLoggedInUser(userId));
		List<Movie> movieList = movieService.allMovies();
		model.addAttribute("movies", movieList);
		return "homepage.jsp";
	}

	// Takes you to a form to create a new movie
	@GetMapping("/movies/new")
	public String newMovie(@ModelAttribute("movie") Movie movie, HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		model.addAttribute("user", userService.getLoggedInUser(userId));
		return "newMovie.jsp";
	}

	// Actually creates the new movie
	@PostMapping("/newMovie")
    public String createMovie(@Valid @ModelAttribute("movie") Movie movie, BindingResult result,
            @RequestParam("coverPicture") MultipartFile file, HttpSession session) {
        if (result.hasErrors()) {
            return "newMovie.jsp";
        }

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        User user = userService.getLoggedInUser(userId);
        movie.setUser(user);
        
        String uploadDir = "uploads/cover_pictures/";
        Path uploadPath = Paths.get(uploadDir);
        
        try {
            // Create the directory if it doesn't exist
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // Handle file upload
            if (!file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                Path path = Paths.get(uploadDir + fileName);
                try {
                    // Save file to a directory
                    Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                    movie.setCoverImage(fileName); // Set path to movie entity
                } catch (IOException e) {
                    e.printStackTrace(); // Handle error, maybe show a message to the user
                }
            }

            movieService.createMovie(movie);
            return "redirect:/Home";
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/movies/new";
        }
    }
	
	//Shows you all the details of a movie
	@GetMapping("/movie/details/{movieId}")
	public String showMovieDetails(@PathVariable("movieId") Long movieId, @ModelAttribute("comment") Comment comment, HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}

		Movie movie = movieService.findMovie(movieId);
		if (movie == null) {
			return "redirect:/movies";
		}
		model.addAttribute("user", userService.getLoggedInUser(userId));
		model.addAttribute("movie", movie);
		model.addAttribute("userId", userId);
		
		List<Comment>comments = commentService.allComments();
		model.addAttribute("comments", comments);

		return "movieDetails.jsp";
	}
	
	// Takes you to update movie form where you can make changes
	@GetMapping("/movies/edit/{id}")
	public String editMovie(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		model.addAttribute("user", userService.getLoggedInUser(userId));
		Movie movie = movieService.findMovie(id);
		model.addAttribute("movie", movie);
		return "editMovie.jsp";
	}
	
	// Updates the Movie
	@PutMapping("/movies/{id}")
	public String updateMovie(@Valid @ModelAttribute("movie") Movie movie, BindingResult result, Model model,
			HttpSession session,@RequestParam("coverPicture") MultipartFile file) {
		if (result.hasErrors()) {
			model.addAttribute("movie", movie);
			return "editMovie.jsp";
		}
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}         String uploadDir = "uploads/cover_pictures/";
        Path uploadPath = Paths.get(uploadDir);
        
        try {
            // Create the directory if it doesn't exist
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // Handle file upload
            if (!file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                Path path = Paths.get(uploadDir + fileName);
                try {
                    // Save file to a directory
                    Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                    movie.setCoverImage(fileName); // Set path to movie entity
                } catch (IOException e) {
                    e.printStackTrace(); // Handle error, maybe show a message to the user
                }
            }

            movieService.updateMovie(movie);
            return "redirect:/Home";
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/Home";
        }
	}
	
	// Delete a movie by id
	@DeleteMapping("/movies/destroy/{id}")
	public String destroyMovie(@PathVariable("id") Long id) {
		movieService.deleteMovie(id);
		return "redirect:/Home";
	}
	
}
