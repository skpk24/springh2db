package com.ilinks.h2db.model;

import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Entity 
@Table(name="shopping_cart_item")
public class ShoppingCartItem {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="shopping_cart_item_id")
	private Long id;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="shopping_cart_id")
	private ShoppingCart shoppingCartId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="product_id")
	private Product productId;
	
	private Long quantity;
	
	@Column(name="unit_price")
	private BigDecimal unitPrice;
	
	@Transient
	public BigDecimal getItemTotalPrice() {
		if(quantity != null && unitPrice !=null ) {
			BigDecimal item = new BigDecimal(quantity);
			return unitPrice.multiply(item);
		}
		return BigDecimal.ZERO;
	}
}
