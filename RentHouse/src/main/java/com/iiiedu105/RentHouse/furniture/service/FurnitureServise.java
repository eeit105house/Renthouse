package com.iiiedu105.RentHouse.furniture.service;

import java.util.List;
import java.util.Map;

import com.iiiedu105.RentHouse.model.Furniture;
import com.iiiedu105.RentHouse.model.Member;

public interface FurnitureServise {
	public Furniture findById(Integer fuId);
	public void insertFurniture(Furniture fuurnitureBean);
	public void updateFurniture(Furniture fuurnitureBean);
	public Member getMemberById(String id);
	public List<Furniture> getFurnituresByMemberId(String id);
	public List<Furniture> getFurnituresOrderbyId();
	public Map<String,List<Furniture>> getFurnituresOrderbyTypes(String types);
}
