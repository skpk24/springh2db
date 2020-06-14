package com.ilinks.h2db.repo;

import org.springframework.data.repository.CrudRepository;

import com.ilinks.h2db.model.ShoppingCart;

public interface ShoppingCartRepo extends CrudRepository<ShoppingCart, Integer> {

}
