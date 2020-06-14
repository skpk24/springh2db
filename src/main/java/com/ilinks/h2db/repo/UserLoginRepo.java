package com.ilinks.h2db.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ilinks.h2db.model.UserLogin;

public interface UserLoginRepo extends JpaRepository<UserLogin, Integer> {
	
	UserLogin findByUsername(String username);
	
	List<UserLogin> findByParentUserId(String parentUserId);
	
	UserLogin findByUserId(int userId);
}