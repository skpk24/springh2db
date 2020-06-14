package com.ilinks.h2db.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="product_category_member")
@NamedQuery(name="ProductCategoryMember.findAll", query="SELECT p FROM ProductCategoryMember p")
public class ProductCategoryMember {
	
	@Id
	@Column(name = "product_category_member_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int productCategoryMemberId;
	
	@Column(name="product_category_id", insertable=false, updatable=false)
	private String productCategoryId;

	@Column(name="product_id", insertable=false, updatable=false)
	private String productId;
	
	@Column(name="sequence_num")
	private BigDecimal sequenceNum;
	
	@ManyToOne
	@JoinColumn(name="PRODUCT_CATEGORY_ID")
	private ProductCategory productCategory;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="PRODUCT_ID")
	private Product product;
}
