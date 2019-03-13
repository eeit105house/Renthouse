package com.iiiedu105.RentHouse.backend.review.writings.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.backend.review.house.dao.OTShelfDao;
import com.iiiedu105.RentHouse.model.House;

@Service
public class RWritingsServiceImpl implements RWritingsService {

	@Autowired
	RWritingsService dao;
	
	@Transactional
	@Override
	public List<Object[]> getAllWritings() {
		return dao.getAllWritings();
	}

	@Transactional
	@Override
	public void passWritings(int id) {
		dao.passWritings(id);
	}

	@Transactional
	@Override
	public void failWritings(int id) {
		dao.failWritings(id);
	}
	
}
