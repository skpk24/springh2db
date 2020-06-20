package com.ilinks.h2db.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ilinks.h2db.common.dto.BaseDto;
import com.ilinks.h2db.dto.Login;
import com.ilinks.h2db.dto.UserLoginDto;
import com.ilinks.h2db.model.UserLogin;
import com.ilinks.h2db.service.UserService;
import com.ilinks.h2db.util.AuthUtil;

@RestController
@RequestMapping(value = "api/auth")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@PostMapping("/login")
	ResponseEntity<UserLoginDto> login(@RequestBody Login login){
		UserLogin userLogin = userService.login(login.getUsername(), login.getPassword());
		UserLoginDto userLoginDto = new UserLoginDto();
		if(userLogin != null) {
			BeanUtils.copyProperties(userLogin, userLoginDto);
			userLoginDto.setToken(AuthUtil.token(userLogin));
			return ResponseEntity.ok(userLoginDto);
		}else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
		}
	}
	
	@PostMapping("/logout")
	ResponseEntity<UserLogin> logout(@RequestBody Login login){
		UserLogin userLogin = userService.logout(login.getUsername());
		return ResponseEntity.ok(userLogin);
	}

}
