package com.alberto.moviereview.Repositiory;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alberto.moviereview.Model.Movie;



@Repository
public interface MovieRepository extends CrudRepository<Movie, Long> {
	// this method retrieves all the movies from the database
	List<Movie> findAll();
}
