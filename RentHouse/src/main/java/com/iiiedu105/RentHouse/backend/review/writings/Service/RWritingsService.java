package com.iiiedu105.RentHouse.backend.review.writings.Service;

import java.util.List;

import com.iiiedu105.RentHouse.model.ForumReport;

public interface RWritingsService {
	List<ForumReport> getAllWritings();

	void updatePassWritings(Integer id);

	void updateFailWritings(Integer id);
	
	Object[] getAllDetailWritingsById(Integer id);
}