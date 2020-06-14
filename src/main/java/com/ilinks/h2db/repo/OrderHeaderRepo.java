package com.ilinks.h2db.repo;

import org.springframework.data.repository.CrudRepository;

import com.ilinks.h2db.model.OrderHeader;

public interface OrderHeaderRepo extends CrudRepository<OrderHeader, Integer> {

}
