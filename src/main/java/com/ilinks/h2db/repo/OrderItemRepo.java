package com.ilinks.h2db.repo;

import org.springframework.data.repository.CrudRepository;

import com.ilinks.h2db.model.OrderItem;

public interface OrderItemRepo extends CrudRepository<OrderItem, Integer> {

}
