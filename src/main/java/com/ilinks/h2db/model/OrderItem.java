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
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="order_item")
public class OrderItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "order_item_id")
	private Long orderItemId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="order_header_id")
	private OrderHeader orderHeaderId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product productId; 
	
	private Long status;
	
	@Column(name = "quantity")
	private Long quantity; 
	
	@Column(name="unit_price")
	private BigDecimal unitPrice;
	
	@Column(name="item_description")
	private String itemDescription;
	
}
