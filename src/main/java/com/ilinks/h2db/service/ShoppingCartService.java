package com.ilinks.h2db.service;


import com.ilinks.h2db.dto.ShoppingCartDto;
import com.ilinks.h2db.model.OrderHeader;
import com.ilinks.h2db.model.ShoppingCart;


public interface ShoppingCartService {
	ShoppingCartDto create(ShoppingCartDto cart);
	ShoppingCart create(Long productId);
	ShoppingCartDto addToCart(Long cartId, Long productId, Long quantity);
	ShoppingCartDto updateCart(ShoppingCartDto cart);
	ShoppingCart updatePrice(ShoppingCartDto cart);
	ShoppingCartDto removeProduct(Long productId);
	ShoppingCartDto getCart();
	boolean emptyCart();
	ShoppingCart loadCartFromOrder(OrderHeader order);
	boolean emptyCart(String type, Long userId);
//	CompleteSubscriptionRequest createCompleteSubscriptionRequest(CompleteSubscriptionRequestUI create );
//	Page<CompleteSubscriptionRequest> getList(int pageSize);
	ShoppingCart create(String productType, Long userId);
}
