package com.alberto.moviereview.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alberto.moviereview.Model.Comment;
import com.alberto.moviereview.Model.Movie;
import com.alberto.moviereview.Repositiory.CommentRepository;
import com.alberto.moviereview.Repositiory.MovieRepository;





@Service
public class CommentService {
	// adding the comment repository as a dependency
	@Autowired
	CommentRepository commentRepository;
	@Autowired
	MovieRepository movieRepository;

	public CommentService(CommentRepository commentRepository) {
		this.commentRepository = commentRepository;
	}

	// returns all the comments
	public List<Comment> allComments() {
		return commentRepository.findAll();
	}

	// creates a comment
	public Comment createComment(Comment b) {
		return commentRepository.save(b);
	}

	// updates a comment
	public Comment updateComment(Comment b) {
		return commentRepository.save(b);
	}

	// Deletes a comment
	public void deleteComment(Long id) {
		commentRepository.deleteById(id);
	}

	// retrieves a comment
	public Comment findComment(Long id) {
		Optional<Comment> optionalComment = commentRepository.findById(id);
		if (optionalComment.isPresent()) {
			return optionalComment.get();
		} else {
			return null;
		}
	}
	

    public String addCommentToMovie(Long id, Comment comment) {
        Optional<Movie> optionalMovie = movieRepository.findById(id);
        
        if (optionalMovie.isPresent()) {
            Movie movie = optionalMovie.get();
            comment.setMovie(movie);
            commentRepository.save(comment);
            return "Player added successfully";
        } else {
            return "Comment not found";
        }
    }
}
