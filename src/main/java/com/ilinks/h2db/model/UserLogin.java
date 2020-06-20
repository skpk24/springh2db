package com.ilinks.h2db.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
@Table(name = "user_login")
public class UserLogin {

	@Id
	@Column(name = "user_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	@JsonIgnore
	private int userId;
	
	@Column(name = "username")
	@JsonIgnore
	private String username;
	
	@Column(name = "password")
	@JsonIgnore
	private String password;
	
	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "parent_user_id")
	private int parentUserId;
	
	@Column(name = "wallet")
	private BigDecimal wallet;
	
	@Column(name = "is_loggedin")
	@JsonIgnore
	private char isLoggedin;
	
	@Column(name = "category_code")
	private String categoryCode;

}
