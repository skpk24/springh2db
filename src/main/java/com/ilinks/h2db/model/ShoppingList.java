package com.ilinks.h2db.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity 
@Table(name="shopping_list") 
public class ShoppingList{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "shopping_list_id")
	private Long shoppingListId;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	@JsonIgnore
    private UserLogin user;
	
	@Column(name = "list_name")
	private String list_name;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "is_public")
	private char isPublic;
	
	@Column(name = "is_active")
	private char isActive;
	
	@Column(name = "category_code")
	private String categoryCode;
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="shopping_list_id")
	private List<ShoppingListItem> items;
	

}
