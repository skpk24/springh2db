package com.ilinks.h2db.dto;

import java.math.BigDecimal;
import lombok.Data;

@Data
public class ShoppingCartItemDto {
	
	private Long id;
	
	private Long productId;
	
	private String productName;
	
	private Long quantity;
	
	private BigDecimal unitPrice;
	
	private BigDecimal itemTotalPrice;
}
