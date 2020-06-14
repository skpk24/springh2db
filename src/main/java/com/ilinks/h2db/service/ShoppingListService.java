package com.ilinks.h2db.service;

import java.util.List;

import com.ilinks.h2db.model.ShoppingList;

public interface ShoppingListService {
	
	ShoppingList createShoppingList(String username, String listName);
	
	ShoppingList addProduct(Integer productId);
	
	ShoppingList addProducts(List<Integer> productIds);
	
	List<ShoppingList> getLists(String username);
	
	ShoppingList getList(String username, Integer listId);
	
}
