package com.iiiedu105.RentHouse.backend.review.writings.dao;

import java.util.List;

import com.iiiedu105.RentHouse.model.House;

public interface RWritingsDao {

	List<Object[]> getAllWritings();

	void passWritings(int id);

	void failWritings(int id);
}