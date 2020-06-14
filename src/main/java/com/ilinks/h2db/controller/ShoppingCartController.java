package com.ilinks.h2db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("carts")
public class ShoppingCartController {
	
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@Autowired
    private MessageSource msgSource;
	
	@PostMapping
	public ApiResponse create(@RequestBody ShoppingCartDto cart) {
		return ApiResponseBuilder.success().data(shoppingCartService.create(cart)).build();
	}
	
	@PutMapping
	public ApiResponse update(@RequestBody ShoppingCartDto cart) {
		return ApiResponseBuilder.success().data(shoppingCartService.updateCart(cart)).build();
	}
	
	@PutMapping("/update/price")
	public ApiResponse updatePrice(@RequestBody ShoppingCartDto cart) {
		ShoppingCart crt = shoppingCartService.updatePrice(cart);
		if(crt != null) {
			shoppingCartService.sendNegotiatedPriceMail(crt);
		}
		return ApiResponseBuilder.success().data(Boolean.TRUE).build();
	}
	
	@GetMapping
	public ApiResponse getCart() {
		ShoppingCartDto cartDto = shoppingCartService.getCart();
		if(cartDto == null) {
			return ApiResponseBuilder.failure().data(msgSource.getMessage("shopping.record.not.found", null, LocaleContextHolder.getLocale())).build();
		}
		return ApiResponseBuilder.success().data(cartDto).build();
	}
	
	@DeleteMapping("/{id}")
	public ApiResponse deleteCartItem(@PathVariable Long id) {
		return ApiResponseBuilder.success().data(shoppingCartService.removeProduct(id)).build();
	}
	
	@DeleteMapping
	public ApiResponse emptyCart() {
		return ApiResponseBuilder.success().data(shoppingCartService.emptyCart()).build();
	}
	
	@PostMapping("/createRequest")
	public ApiResponse createRequest(@RequestBody CompleteSubscriptionRequestUI create) {
		return ApiResponseBuilder.success().data(shoppingCartService.createCompleteSubscriptionRequest(create)).build();
	}
	
	@GetMapping("/list/{pageSize}")
	public ApiResponse getreqeustList(@PathVariable int pageSize) {
		return ApiResponseBuilder.success().data(shoppingCartService.getList(pageSize)).build();
	}
}
