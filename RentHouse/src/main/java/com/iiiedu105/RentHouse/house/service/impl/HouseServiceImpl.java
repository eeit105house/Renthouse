package com.iiiedu105.RentHouse.house.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.house.dao.HouseDao;
import com.iiiedu105.RentHouse.house.service.HouseService;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

@Service
@Transactional //加在此視為所有方法
public class HouseServiceImpl implements HouseService {
	
	@Autowired
	HouseDao dao;

	public HouseServiceImpl() {
	}
	@Override
	public House findById(Integer houseId) {
		return dao.findById(houseId);
	}

	@Override
	public void insertHouse(House houseBean) {
		dao.insertHouse(houseBean);
	}

	@Override
	public void insertDetail(HouseDetail detailBean) {
		dao.insertDetail(detailBean);
	}

	@Override
	public void insertPicture(HousePic housePicBean) {
		dao.insertPicture(housePicBean);
	}
	
	@Override
	public Member getMemberById(String id) {
		return dao.getMemberById(id);
	}
	

}
