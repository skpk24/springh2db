package com.ilinks.h2db.dto;

import java.math.BigDecimal;
import java.util.List;

import lombok.Data;

@Data
public class ShoppingCartDto {
	
	private Long cartId;
	
	private List<ShoppingCartItemDto> items;
	
	private BigDecimal subTotal;
	
	private BigDecimal grassTotal;
	
}
