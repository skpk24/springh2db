package com.ilinks.h2db.repo;

import org.springframework.data.repository.CrudRepository;

import com.ilinks.h2db.model.ShoppingList;

public interface ShoppingListRepo extends CrudRepository<ShoppingList, Integer> {

}
