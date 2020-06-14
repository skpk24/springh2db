package com.ilinks.h2db.repo;

import org.springframework.data.repository.CrudRepository;

import com.ilinks.h2db.model.Product;

public interface ProductRepo extends CrudRepository<Product, Integer> {

}
