package com.iiiedu105.RentHouse.backend.main.service;

import java.util.List;

import com.iiiedu105.RentHouse.model.Employee;

public interface LoginService {
	public List<Employee> getOneEmployee(String mid,String pwd);
}