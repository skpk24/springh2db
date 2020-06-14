package com.ilinks.h2db.service;

import java.util.List;

import com.ilinks.h2db.model.Product;
import com.ilinks.h2db.model.ProductCategory;

public interface CatalogService {
	
	List<ProductCategory> getCategories();
	
	List<ProductCategory> getCategories(Integer categoryId);
	
	List<Product> getProducts(Integer productId);
	
	List<Product> getCodeProduct(String categoryCode);
	
}
