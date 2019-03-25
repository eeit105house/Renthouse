package com.iiiedu105.RentHouse.listHouse.service;
import java.util.List;

import com.iiiedu105.RentHouse.model.HousePic;

public interface SearchHouseByConditionService {
	public List<Object[]> getAllhouse();
	public List<Object[]> getHouseByCriteria(String Searchcriteria);
	public List<HousePic> getAllHousePic();
	public HousePic getHousePicById(Integer id);
	public List<Object[]> gethouse();
	public List<Object[]> getHouseByMsg(String msg);
	public List<Object[]> getAllVipHouse();
}
