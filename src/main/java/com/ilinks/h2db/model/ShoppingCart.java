package com.ilinks.h2db.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity 
@Table(name="shopping_cart") 
public class ShoppingCart{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="shopping_cart_id")
	private Long shoppingCartId;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	@JsonIgnore
    private UserLogin user;
	
	@Column(name="sub_total")
	private BigDecimal subTotal;
	
	@Column(name="grand_total")
	private BigDecimal grandTotal;
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="shopping_cart_id")
	private List<ShoppingCartItem> items;
	
	
	@Transient
	public BigDecimal calculateTotal(){
		BigDecimal total = BigDecimal.ZERO;
		for (ShoppingCartItem lineItem : this.getItems()) {
			total = total.add(lineItem.getUnitPrice().multiply(new BigDecimal(lineItem.getQuantity())));		
		}
		return total;
	}

	
}
