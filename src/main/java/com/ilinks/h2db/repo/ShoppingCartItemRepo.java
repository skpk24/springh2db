package com.ilinks.h2db.repo;

import org.springframework.data.repository.CrudRepository;

import com.ilinks.h2db.model.ShoppingCartItem;

public interface ShoppingCartItemRepo extends CrudRepository<ShoppingCartItem, Integer> {

}
