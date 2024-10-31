package com.alberto.moviereview.Repositiory;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alberto.moviereview.Model.Comment;





@Repository
public interface CommentRepository extends CrudRepository<Comment, Long>{
    // this method retrieves all the comments from the database
	List<Comment> findAll();
}
