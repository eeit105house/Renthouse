package com.iiiedu105.RentHouse.furniture.dao;

import java.util.List;

import com.iiiedu105.RentHouse.model.Furniture;
import com.iiiedu105.RentHouse.model.Member;

public interface FurnitureDao {
	public Furniture findById(Integer fuId);
	public void insertFurniture(Furniture fuurnitureBean);
	public void updateFurniture(Furniture fuurnitureBean);
	public Member getMemberById(String id);
	public List<Furniture> getFurnituresByMemberId(String id);
	public List<Furniture> getFurnituresOrderbyId();
	public List<Furniture> getFurnituresOrderbyType(String type);
}
