package com.iiiedu105.RentHouse.Resources.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.Resources.dao.ResourcesDao;
import com.iiiedu105.RentHouse.Resources.service.ResourcesService;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.Member;
import com.iiiedu105.RentHouse.model.Reservation;
@Service
@Transactional
public class ResourcesServiceimpl implements ResourcesService{
	@Autowired
	ResourcesDao dao;
	@Override
	public void addResources(Reservation product) {
	 dao.addResources(product);
		
	}
	@Override
	public House findById(Integer houseId) {
		return dao.findById(houseId);
	}
	@Override
	public Member getMemberById(String id) {
		return dao.getMemberById(id);
	}
	@Override
	public List<Reservation> getReservation(Integer houseId) {

		return dao.getReservation(houseId);
	}
	@Override
	public void updateReservation(Integer id) {
		
		dao.updateReservation(id);
		
	}
	@Override
	public List<Integer> findByHId(String memberId) {
		// TODO Auto-generated method stub
		return dao.findByHId(memberId);
	}
	@Override
	public List<Reservation> getReservationMember(String memberId) {
		// TODO Auto-generated method stub
		return dao.getReservationMember(memberId);
	}
	
}
