package com.ilinks.h2db.model;

import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
@Table(name="product_category_member")
@NamedQuery(name="ProductCategoryMember.findAll", query="SELECT p FROM ProductCategoryMember p")
public class ProductCategoryMember {
	
	@Id
	@Column(name = "product_category_member_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	@JsonIgnore
	private int productCategoryMemberId;
	
	@Column(name="product_category_id")
	private Integer productCategoryId;

	@Column(name="product_id")
	private Integer productId;
	
	@Column(name="sequence_num")
	private BigDecimal sequenceNum;
	
//	@ManyToOne
//	@JoinColumn(name="product_category_id")
//	private ProductCategory productCategory;
//
//	//bi-directional many-to-one association to Product
//	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//	@JoinColumn(name="product_id")
//	private Product product;
}
