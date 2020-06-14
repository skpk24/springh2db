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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="order_header")
public class OrderHeader {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "order_header_id")
	private String orderHeaderId;
	
	@Column(name = "external_id")
	private String externalId;
	
	@Column(name = "transaction_id")
	private String transactionId;
	
	@Column(name = "ref_id")
	private String refId;
	
	@Column(name = "pay_num")
	private Long payNum;
	
	@Column(name="order_name")
	private String orderName;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id") 
	private UserLogin userId;
	
	private Long status;
	
	@Column(name = "order_date")
	private Date orderDate; 
	
	@Column(name="currency_uom")
	private String currencyUom; 
	
	@Column(name="shopping_cart_id")
	private Long shoppingCartId; 
	
	@Column(name="remaining_sub_total")
	private BigDecimal remainingSubTotal;
	
	@Column(name="grand_total")
	private BigDecimal grandTotal;
	
	@Column(name="user_address_id")
	private Long userAddressId;
	
	@Column(name="is_viewed")
	private char isViewed;
	
    @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="order_header_id")
	private List<OrderItem> items;
}
