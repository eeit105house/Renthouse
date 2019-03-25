package com.iiiedu105.RentHouse.dao.impl;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.iiiedu105.RentHouse.listHouse.service.impl.SearchHouseByConditionServiceImpl;



public class SearchHouseByConditionDaoImplTest {

	@Before
	public void setUp() throws Exception {
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		System.out.println(new SearchHouseByConditionServiceImpl().getAllhouse());
	}

}
