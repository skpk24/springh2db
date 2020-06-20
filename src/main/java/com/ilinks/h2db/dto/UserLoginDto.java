package com.ilinks.h2db.dto;

import com.ilinks.h2db.model.UserLogin;

import lombok.Getter;
import lombok.Setter;


public class UserLoginDto extends UserLogin {
	@Setter @Getter
	private String token;
}
