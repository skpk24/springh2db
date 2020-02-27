package com.ilinks.h2db.exception;

public class ResourceNotFoundException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5430477524673993864L;
	
	public ResourceNotFoundException(final String message, final Throwable cause) {
		super(message, cause);
	}
	
	public ResourceNotFoundException(final Throwable cause) {
		super(cause);
	}

	public ResourceNotFoundException(final String message) {
		super(message);
	}

}
