package com.iiiedu105.RentHouse.backend.customerservice.dao;

import java.util.List;

import com.iiiedu105.RentHouse.model.EmployeeReport;

public interface CSDao {

	List<EmployeeReport> getAllMail();

	EmployeeReport getMailById(Integer id);

	void updateMailById(String eid, String reply, Integer id);

}