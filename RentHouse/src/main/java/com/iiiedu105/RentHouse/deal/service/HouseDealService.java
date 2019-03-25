package com.iiiedu105.RentHouse.deal.service;

import java.util.List;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDeal;

public interface HouseDealService {
	public House getHouseByHouseId(int houseId);
	public void addHouseDeal(HouseDeal houseDeal);
	public List<HouseDeal> getHouseDealByHouseId(int houseId);
	public void updateHouseDeal(HouseDeal houseDeal);
	public HouseDeal getHouseDealById(int id);
	public List<House> getAllHouseByMemberId(String memberId);
}
