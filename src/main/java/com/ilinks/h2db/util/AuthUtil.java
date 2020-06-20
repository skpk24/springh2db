package com.ilinks.h2db.util;

import java.util.Base64;
import java.util.Map;

import org.springframework.util.StringUtils;

import com.ilinks.h2db.common.dto.AuthUser;
import com.ilinks.h2db.model.UserLogin;

public class AuthUtil {
	
	public static String encode(String str) {
		return Base64.getEncoder().withoutPadding().encodeToString(str.getBytes());
	}
	
	public static String decode(String str) {
		byte[] decodedBytes = Base64.getDecoder().decode(str);
		String decodedString = new String(decodedBytes);
		return decodedString;
	}
	
	public static String token(UserLogin user) {
		String encodeString = user.getUserId()+"###"+user.getUsername()+"###"+user.getIsLoggedin();
		return Base64.getEncoder().withoutPadding().encodeToString(encodeString.getBytes());
	}
	
	public static AuthUser validateToken(String token){
		if(StringUtils.isEmpty(token)) {
			return null;
		}
		
		String decodedToken = decode(token);
		if(StringUtils.isEmpty(decodedToken)) {
			return null;
		}
		
		String tokenizedValue[] = decodedToken.split("###");
		
		if(StringUtils.isEmpty(tokenizedValue)) {
			return null;
		}
		
		AuthUser authUser = new AuthUser();
		authUser.setUserId(Integer.parseInt(tokenizedValue[0]));
		authUser.setUsername(tokenizedValue[1]);
		authUser.setIsLoggedin(tokenizedValue[0].charAt(0));
		
		return authUser;
		
	}
}
