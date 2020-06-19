package com.ilinks.h2db.common.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter @AllArgsConstructor
public class BaseDto {
	private String name;
	private int code;
	private String statusCode;
	private String message;
	private Object data;
}
