package com.iiiedu105.RentHouse.backend.review.house.dao;

import java.util.List;

import com.iiiedu105.RentHouse.model.House;

public interface OTShelfDao {

	List<Object[]> getAllHouse();

	void updateHouseStatus(int id);

	void deleteHouse(int id);
}