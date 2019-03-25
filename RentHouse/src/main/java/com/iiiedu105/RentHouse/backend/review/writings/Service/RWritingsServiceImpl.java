package com.iiiedu105.RentHouse.backend.review.writings.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.backend.review.house.dao.OTShelfDao;
import com.iiiedu105.RentHouse.backend.review.writings.dao.RWritingsDao;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;

@Service
public class RWritingsServiceImpl implements RWritingsService {

	@Autowired
	RWritingsDao dao;
	
	@Transactional
	@Override
	public List<ForumReport> getAllWritings() {
		return dao.getAllWritings();
	}

	@Transactional
	@Override
	public void updatePassWritings(Integer id) {
		dao.updatePassWritings(id);;
	}

	@Transactional
	@Override
	public void updateFailWritings(Integer id) {
		dao.updateFailWritings(id);;
	}

	@Transactional
	@Override
	public Object[] getAllDetailWritingsById(Integer id) {
		return dao.getAllDetailWritingsById(id);
	
	}
	
	
}
