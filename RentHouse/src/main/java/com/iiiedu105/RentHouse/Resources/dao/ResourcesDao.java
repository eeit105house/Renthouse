package com.iiiedu105.RentHouse.Resources.dao;

import java.util.List;

import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.Member;
import com.iiiedu105.RentHouse.model.Reservation;


public interface ResourcesDao {
	public House findById(Integer houseId);
	public Member getMemberById(String id);
	public void addResources(Reservation product);
	public List<Reservation>getReservation(Integer houseId);
	public void updateReservation(Integer id);
	public List<Integer>findByHId(String memberId);
	
	
	

}
