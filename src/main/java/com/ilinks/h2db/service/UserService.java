package com.ilinks.h2db.service;

import org.springframework.stereotype.Service;

import com.ilinks.h2db.model.UserLogin;

public interface UserService {
	
	UserLogin login(String username, String password);
	UserLogin logout(String username);
	String validateCode(String code);
	
}
