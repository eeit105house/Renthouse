package com.iiiedu105.RentHouse.backend.main.dao;

import java.sql.Blob;
import java.util.List;

import com.iiiedu105.RentHouse.model.Employee;

public interface LoginDao {
	public List<Employee> getOneEmployee(String mid,String pwd);

	void updateEmployee(String eid,String ename,Blob pic,String pwd);

	public Employee getEmployeeById(String mid);
}