package com.ilinks.h2db.service;

import java.util.List;

import com.ilinks.h2db.model.OrderHeader;

public interface OrderService {
	OrderHeader createOrder(OrderHeader order);
	
	List<OrderHeader> getOrders(String username);
}
