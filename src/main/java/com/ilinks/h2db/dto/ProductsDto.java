package com.ilinks.h2db.dto;

import java.util.List;

import com.ilinks.h2db.model.Product;
import lombok.Data;

@Data
public class ProductsDto {
	private String categoryImgUrl;
	private Iterable<Product> products;
}
