package com.ilinks.h2db.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
@Table(name = "product_category")
public class ProductCategory {
	
	@Id
	@Column(name = "product_category_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int productCategoryId;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="primary_parent_category_id")
	private ProductCategory productCategory;
	
	@Column(name = "category_name")
	private String categoryName;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "category_image_url")
	private String categoryImageUrl;
	
	private Integer children;
//	@OneToMany(mappedBy="productCategory", fetch = FetchType.LAZY)
//	private List<Product> products;

}
