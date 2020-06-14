package com.ilinks.h2db.repo;

import org.springframework.data.repository.CrudRepository;

import com.ilinks.h2db.model.ShoppingListItem;

public interface ShoppingListItemRepo extends CrudRepository<ShoppingListItem, Integer> {

}
