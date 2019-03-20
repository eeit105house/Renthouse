package com.iiiedu105.RentHouse.listHouse.dao;

import java.util.List;
import com.iiiedu105.RentHouse.model.HousePic;

public interface SearchHouseByConditionDao {
	public List<Object[]> getAllhouse();
	public List<Object[]> getHouseByCriteria(String Searchcriteria);
	public List<Object[]> gethouse();
//	public List<House> getHouseByCriteria2(String Searchcriteria);
	public List<HousePic> getAllHousePic();
	public HousePic getHousePicById(Integer id);
	public List<Object[]> getHouseByMsg(String msg);
}
