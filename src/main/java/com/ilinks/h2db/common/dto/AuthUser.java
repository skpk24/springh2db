package com.ilinks.h2db.common.dto;

import lombok.Data;

@Data
public class AuthUser {
	private int userId;
	private String username;
	private char isLoggedin;
}
