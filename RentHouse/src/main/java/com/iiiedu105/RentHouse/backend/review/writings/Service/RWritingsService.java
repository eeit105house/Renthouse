package com.iiiedu105.RentHouse.backend.review.writings.Service;

import java.util.List;

import com.iiiedu105.RentHouse.model.House;

public interface RWritingsService {
	List<Object[]> getAllWritings();

	void passWritings(int id);

	void failWritings(int id);
}