package com.iiiedu105.RentHouse.furniture.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.furniture.dao.FurnitureDao;
import com.iiiedu105.RentHouse.furniture.service.FurnitureServise;
import com.iiiedu105.RentHouse.model.Furniture;
import com.iiiedu105.RentHouse.model.Member;

@Service
@Transactional // 加在此視為所有方法
public class FurnitureServiceImpl implements FurnitureServise {
	@Autowired
	FurnitureDao dao;
	public FurnitureServiceImpl() {
	}
	@Override
	public Furniture findById(Integer fuId) {
		return dao.findById(fuId);
	}
	@Override
	public void insertFurniture(Furniture fuurnitureBean) {
		dao.insertFurniture(fuurnitureBean);
	}
	@Override
	public void updateFurniture(Furniture fuurnitureBean) {
		dao.updateFurniture(fuurnitureBean);
	}
	@Override
	public Member getMemberById(String id) {
		return dao.getMemberById(id);
	}
	@Override
	public List<Furniture> getFurnituresByMemberId(String id) {
		return dao.getFurnituresByMemberId(id);
	}
	@Override
	public List<Furniture> getFurnituresOrderbyId() {
		return dao.getFurnituresOrderbyId();
	}
	@Override
	public Map<String, List<Furniture>> getFurnituresOrderbyTypes(String types) {
		String typesAr[] = types.split(";");
		Map<String, List<Furniture>> furnitureMap = new HashMap<>();
		System.out.println(types);
		for(String type:typesAr) {
			System.out.println(type);
			List<Furniture> furnitureBeans = dao.getFurnituresOrderbyType(type);
			furnitureMap.put(type, furnitureBeans);
		}

		return furnitureMap;
	}

}
