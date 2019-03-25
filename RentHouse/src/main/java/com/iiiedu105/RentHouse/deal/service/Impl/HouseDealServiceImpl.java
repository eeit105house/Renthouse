package com.iiiedu105.RentHouse.deal.service.Impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.iiiedu105.RentHouse.deal.dao.HouseDealDao;
import com.iiiedu105.RentHouse.deal.service.HouseDealService;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDeal;

@Transactional
@Service
public class HouseDealServiceImpl implements HouseDealService {
	
	@Autowired
	HouseDealDao dao;
	
	public HouseDealServiceImpl() {

	}
	
	@Override
	public House getHouseByHouseId(int houseId) {
		return dao.getHouseByHouseId(houseId);
	}

	@Override
	public void addHouseDeal(HouseDeal houseDeal) {
		dao.addHouseDeal(houseDeal);		
	}

	@Override
	public List<HouseDeal> getHouseDealByHouseId(int houseId) {		
		return dao.getHouseDealByHouseId(houseId);
	}

	@Override
	public void updateHouseDeal(HouseDeal houseDeal) {
		dao.updateHouseDeal(houseDeal);
		
	}
	@Override
	public HouseDeal getHouseDealById(int id) {
		return dao.getHouseDealById(id);
	}

	@Override
	public List<House> getAllHouseByMemberId(String memberId) {
		return dao.getAllHouseByMemberId(memberId);
	}
}
