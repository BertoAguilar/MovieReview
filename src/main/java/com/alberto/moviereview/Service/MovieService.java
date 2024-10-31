package com.alberto.moviereview.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alberto.moviereview.Model.Movie;
import com.alberto.moviereview.Repositiory.MovieRepository;





@Service
public class MovieService {
	@Autowired
	MovieRepository movieRepo;

	// returns all the movies
	public List<Movie> allMovies() {
		return movieRepo.findAll();
	}

	// creates a movie
	public void createMovie(Movie movie) {
		movieRepo.save(movie);
	}
	
	// retrieves a movie
	public Movie findMovie(Long id) {
		Optional<Movie> optionalMovie = movieRepo.findById(id);
		if (optionalMovie.isPresent()) {
			return optionalMovie.get();
		} else {
			return null;
		}
	}
	
	// updates a movie
	public Movie updateMovie(Movie movie) {
		return movieRepo.save(movie);
	}

	// Deletes a movie
	public void deleteMovie(Long id) {
		movieRepo.deleteById(id);
	}
}
