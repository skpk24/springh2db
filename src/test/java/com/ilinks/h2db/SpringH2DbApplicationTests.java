package com.ilinks.h2db;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.List;

import org.assertj.core.api.ListAssert;
import org.assertj.core.api.ObjectAssert;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.ilinks.h2db.model.Billionaire;
import com.ilinks.h2db.repo.BillionairesRepo;
import com.ilinks.h2db.service.BillionairesService;
import com.ilinks.h2db.service.impl.BillionairesServiceImpl;

@RunWith(SpringRunner.class)
@SpringBootTest // This will create all the beans in the application. So use @ContextConfiguration.
//@ContextConfiguration(classes = BillionairesServiceImpl.class)
class SpringH2DbApplicationTests {
	
//	@Autowired
//	private BillionairesService billService;
	
	//Annotations Used
	/*
	 * 
	 */
	
	//@MockBean //To create Mock beans
	
	//@SpyBean //To create partial mock bean
	
	//We can use @Befor to inject the dependency
	
//	@Before
//	public void init() {
//		//billService = new BillionairesServiceImpl();
//		//BillionairesRepo repo = new BillionairesRepoImpl();
//		//billService.
//		System.out.println("Testing BillionairesService ");
//	}
	
//	@Test
//	public void testNotNullAndSizeResponse() {
//		final List<Billionaire> bils = billService.getAllBillionairs();
//		assertThat(bils).isNotEqualTo(null);
//		assertThat(bils).isNotEmpty();
//		Mockito.when(bils.size()).equals(3);
//		assertThat(bils.size()).isEqualTo(3);
//	}
//	
//	@Test
//	public void testCompleteJsonResponse() {
//		final List<Billionaire> bils = billService.getAllBillionairs();
//		assertThat(bils).isNotEmpty();
//		Billionaire bil1 = new Billionaire();
//		bil1.setId(1);
//		bil1.setFirstName("Aliko");
//		bil1.setLastName("Dangote");
//		bil1.setCareer("Billionaire Industrialist");
//		ListAssert<Billionaire> bilList = assertThat(billService.getAllBillionairs());
//		bilList.hasSize(3);
//		
//		assertThat(bilList.element(0)).isInstanceOf(ObjectAssert.class);
//		
//		ObjectAssert<Billionaire> bil = bilList.element(0);
//		bil.extracting((b)->b.getFirstName().equals("Aliko"));
//		bil.extracting(b -> b.getCareer().compareTo("Dangote"));
//		bil.extracting((b)->b.getCareer().compareTo("Billionaire Industrialist"));
//	}

}
