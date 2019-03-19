package com.iiiedu105.RentHouse.backend.review.house.dao;

import java.util.List;

import com.iiiedu105.RentHouse.model.House;

public interface OTShelfDao {

	List<House> getAllHouse();

	void updateHouseStatus(Integer id);

	void deleteHouse(Integer id);
}