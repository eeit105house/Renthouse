package com.iiiedu105.RentHouse.backend.main.service;

import java.sql.Blob;
import java.util.List;
import java.util.Map;

import com.iiiedu105.RentHouse.model.Employee;
import com.iiiedu105.RentHouse.model.HouseDeal;

public interface LoginService {
	public List<Employee> getOneEmployee(String mid,String pwd);

	void updateEmployee(String eid,String ename,Blob pic,String pwd);

	public Employee getEmployeeById(String mid);
	
	public List<int[]> getAllHouseDeal();
	
	public Map<String,Integer> getHouseDealInfo();
}