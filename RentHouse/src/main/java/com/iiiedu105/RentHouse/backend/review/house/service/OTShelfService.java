package com.iiiedu105.RentHouse.backend.review.house.service;

import java.util.List;

import com.iiiedu105.RentHouse.model.House;

public interface OTShelfService {
	List<Object[]> getAllHouse();

	void updateHouseStatus(int id);
	
	void deleteHouse(int id);

}