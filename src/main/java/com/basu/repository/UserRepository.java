package com.basu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.basu.schemas.User;

public interface UserRepository extends JpaRepository<User, String> {
	
	public User findByUserNameLike(String userName);

}
