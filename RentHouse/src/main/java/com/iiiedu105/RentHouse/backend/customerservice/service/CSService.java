package com.iiiedu105.RentHouse.backend.customerservice.service;

import java.util.List;

import com.iiiedu105.RentHouse.model.EmployeeReport;

public interface CSService {

	List<EmployeeReport> getAllMail();

	EmployeeReport getMailById(Integer id);

	void updateMailById(String eid, String reply, Integer id);
}