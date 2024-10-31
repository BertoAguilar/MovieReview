package com.alberto.moviereview.Controller;


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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alberto.moviereview.Model.Comment;
import com.alberto.moviereview.Model.Movie;
import com.alberto.moviereview.Model.User;
import com.alberto.moviereview.Service.CommentService;
import com.alberto.moviereview.Service.MovieService;
import com.alberto.moviereview.Service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class CommentController {

	@Autowired
	CommentService comments;

	@Autowired
	UserService users;
	
	@Autowired
	MovieService movies;

	// Create a new Comment
	@PostMapping("/newcomments/{movieId}")
	public String createComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result,
			HttpSession session, @PathVariable("movieId") Long movieId, Model model, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "movieDetails.jsp";
		}
		
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		
		
		Movie oneMovie = movies.findMovie(movieId);
		User loggedInUser = users.getLoggedInUser(userId);
		
		List<Comment> commentList = oneMovie.getComment();
		commentList.add(comment);
		
		comment.setMovie(oneMovie);
		comment.setUser(loggedInUser);
		comments.createComment(comment);
		return "redirect:/Home";
	}

	// Takes you to update comment form where you can make changes

	@GetMapping("/comments/edit/{id}")
	public String editComment(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		Comment comment = comments.findComment(id);
		model.addAttribute("comment", comment);
		return "editComment.jsp";
	}

	// Updates the Comment
	@PutMapping("/comments/{id}")
	public String updateComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result, Model model,
			HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("comment", comment);
			return "editComment.jsp";
		}
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = users.getLoggedInUser(userId);
			comment.setUser(user);
			comments.updateComment(comment);
			return "redirect:/Home";
		}
	}

	// Delete a comment by id

	@DeleteMapping("/comments/destroy/{id}")
	public String destroyComment(@PathVariable("id") Long id) {
		comments.deleteComment(id);
		return "redirect:/Home";
	}
}