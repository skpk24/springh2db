package com.ilinks.h2db.service;

import java.util.List;

import com.ilinks.h2db.model.*;

public interface BillionairesService {
	
	List<Billionaire> getAllBillionairs();
	
	Billionaire getBillionaires(long id) throws Exception;
	
	Billionaire createBillionaires(Billionaire billi);
	
	boolean deleteBillionaires(long id);
	
	Billionaire updateBillionaires(long id, Billionaire billi);
	
}
