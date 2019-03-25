package com.iiiedu105.RentHouse.backend.customerservice.dao;

import java.sql.Clob;
import java.util.List;

import com.iiiedu105.RentHouse.model.EmployeeReport;

public interface CSDao {

	List<EmployeeReport> getAllMail();

	EmployeeReport getMailById(Integer id);

//	void updateMailById(String eid, String reply, Integer id);

	public void updateMail(String eid,Clob content,Integer id);
}