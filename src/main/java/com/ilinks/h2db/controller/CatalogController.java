package com.ilinks.h2db.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ilinks.h2db.dto.ProductsDto;
import com.ilinks.h2db.model.Product;
import com.ilinks.h2db.model.ProductCategory;
import com.ilinks.h2db.model.ProductCategoryMember;
import com.ilinks.h2db.repo.ProductCategoryMemberRepo;
import com.ilinks.h2db.repo.ProductCategoryRepo;
import com.ilinks.h2db.repo.ProductRepo;
import com.ilinks.h2db.util.AuthUtil;

@RequestMapping("/api/catalog")
@RestController
public class CatalogController {
	
	@Autowired
	private ProductCategoryRepo productCategoryRepo;
	
	@Autowired
	private ProductCategoryMemberRepo pcmRepo;
	
	@Autowired
	private ProductRepo productRepo;
	
	@GetMapping("/categories")
	public ResponseEntity<List<ProductCategory>> categories(@RequestHeader("token") String token){
		if(AuthUtil.validateToken(token)==null) return null;
		System.out.println("\n Values "+AuthUtil.validateToken(token)+"\n");
		ProductCategory root = productCategoryRepo.findByProductCategoryId(1);
		List<ProductCategory> categories = productCategoryRepo.findByProductCategory(root);
		return ResponseEntity.ok(categories);
	}
	
	@GetMapping("/categories/{id}")
	public ResponseEntity<List<ProductCategory>> category(@PathVariable int id, @RequestHeader("token") String token){
		if(AuthUtil.validateToken(token)==null) return null;
		ProductCategory root = productCategoryRepo.findByProductCategoryId(id);
		List<ProductCategory> categories = productCategoryRepo.findByProductCategory(root);
		return ResponseEntity.ok(categories);
	}
	
	@GetMapping("/categories/{id}/products")
	public ResponseEntity<ProductsDto> products(@PathVariable int id){
		ProductCategory root = productCategoryRepo.findByProductCategoryId(id);
		ProductsDto products = new ProductsDto();
		products.setCategoryImgUrl(root.getCategoryImageUrl());
		List<ProductCategoryMember> pcms = pcmRepo.findByProductCategoryId(id);
		List<Integer> ids = pcms.stream().map(p->p.getProductId()).distinct().collect(Collectors.toList());
		products.setProducts(productRepo.findAllById(ids));
		return ResponseEntity.ok(products);
	}
	
	@GetMapping("/categories/{categoryId}/products/{productId}")
	public ResponseEntity<Optional<Product>> product(@PathVariable int categoryId, @PathVariable int productId){
//		ProductCategory root = productCategoryRepo.findByProductCategoryId(id);
//		ProductsDto products = new ProductsDto();
//		products.setCategoryImgUrl(root.getCategoryImageUrl());
//		List<ProductCategoryMember> pcms = pcmRepo.findByProductCategoryId(id);
//		List<Integer> ids = pcms.stream().map(p->p.getProductId()).distinct().collect(Collectors.toList());
//		products.setProducts(productRepo.findAllById(ids));
		return ResponseEntity.ok(productRepo.findById(productId));
	}
	
}
