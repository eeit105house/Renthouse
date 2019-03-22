package com.iiiedu105.RentHouse.backend.main.dao;

import java.util.List;

import com.iiiedu105.RentHouse.model.Employee;

public interface LoginDao {
	public List<Employee> getOneEmployee(String mid,String pwd);
}