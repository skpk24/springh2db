package com.ilinks.h2db.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilinks.h2db.exception.ResourceNotFoundException;
import com.ilinks.h2db.model.Billionaire;
import com.ilinks.h2db.repo.BillionairesRepo;
import com.ilinks.h2db.service.BillionairesService;

@Service
public class BillionairesServiceImpl implements BillionairesService {
	
	@Autowired
	private BillionairesRepo repo;
	
	@Override
	public List<Billionaire> getAllBillionairs() {
		List<Billionaire> records = repo.findAll();
		System.out.println(records);
		records.forEach(r -> {
			System.out.println(r);
		});
		return records;
	}

	@Override
	public Billionaire getBillionaires(long id) throws Exception{
		Optional<Billionaire> optBilli = repo.findById(id);
		if(optBilli.isPresent()) {
			return optBilli.get();
		}else {
			throw new ResourceNotFoundException(Billionaire.class.getSimpleName()+ " not found for parameters {id="+id+"}");
		}
	}

	@Override
	public Billionaire createBillionaires(Billionaire billi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteBillionaires(long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Billionaire updateBillionaires(long id, Billionaire billi) {
		// TODO Auto-generated method stub
		return null;
	}

}
