package com.ilinks.h2db.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.ilinks.h2db.model.ProductCategory;
import com.ilinks.h2db.model.ProductCategoryMember;

public interface ProductCategoryMemberRepo extends CrudRepository<ProductCategoryMember, Integer> {
	
	List<ProductCategoryMember> findByProductCategoryId(int id);
}
