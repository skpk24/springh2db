package com.ilinks.h2db.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.ilinks.h2db.model.ProductCategory;

public interface ProductCategoryRepo extends CrudRepository<ProductCategory, Integer> {
	
	ProductCategory findByProductCategoryId(int id);
	
	List<ProductCategory> findByProductCategory(ProductCategory  category);
}
