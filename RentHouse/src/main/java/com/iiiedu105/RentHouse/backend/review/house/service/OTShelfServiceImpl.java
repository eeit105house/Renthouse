package com.iiiedu105.RentHouse.backend.review.house.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.backend.review.house.dao.OTShelfDao;
import com.iiiedu105.RentHouse.model.House;

@Service
public class OTShelfServiceImpl implements OTShelfService {

	@Autowired
	OTShelfDao dao;
	
	@Transactional
	@Override
	public List<Object[]> getAllHouse() {
		return dao.getAllHouse();
	}

	@Transactional
	@Override
	public void updateHouseStatus(int id) {
		dao.updateHouseStatus(id);
	}

	@Transactional
	@Override
	public void deleteHouse(int id) {
		dao.deleteHouse(id);
	}
	
}
