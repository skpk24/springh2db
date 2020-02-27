package com.ilinks.h2db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ilinks.h2db.model.Billionaire;
import com.ilinks.h2db.service.BillionairesService;

@RestController
@RequestMapping(value = "api")
public class BillionairesController {
	
	@Autowired
	private BillionairesService billService;
	
	@GetMapping(value = "all")
	public ResponseEntity<List<Billionaire>> getAllBillionaires(){
		List<Billionaire> list = billService.getAllBillionairs();
		return ResponseEntity.ok().body(list);
	}
}
