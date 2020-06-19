package com.ilinks.h2db.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilinks.h2db.model.UserLogin;
import com.ilinks.h2db.repo.UserLoginRepo;
import com.ilinks.h2db.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserLoginRepo userLoginRepo;
	
	
	@Override
	public UserLogin login(String username, String password) {
		UserLogin user = userLoginRepo.findByUsername(username);
		if(user != null) {
			if(user.getPassword().equals(password.trim())) {
				user.setIsLoggedin('Y');
				return userLoginRepo.save(user);
			}
		}else {
			return null;
		}
		
		return null;
	}

	@Override
	public UserLogin logout(String username) {
		UserLogin user = userLoginRepo.findByUsername(username);
		if(user != null) {
			if(user.getIsLoggedin() == 'Y') {
				user.setIsLoggedin('N');
				return userLoginRepo.save(user);
			}else {
				return user;
			}
		}
		return null;
	}

	@Override
	public String validateCode(String code) {
		// TODO Auto-generated method stub
		return null;
	}

}
