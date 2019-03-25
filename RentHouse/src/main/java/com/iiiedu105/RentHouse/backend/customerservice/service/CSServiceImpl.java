package com.iiiedu105.RentHouse.backend.customerservice.service;

import java.sql.Clob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.backend.customerservice.dao.CSDao;
import com.iiiedu105.RentHouse.model.EmployeeReport;

@Service
public class CSServiceImpl implements CSService {

	@Autowired
	CSDao dao;
	
	@Transactional
	@Override
	public List<EmployeeReport> getAllMail() {		
		return dao.getAllMail();
	}

	@Transactional
	@Override
	public EmployeeReport getMailById(Integer id) {		
		
		return dao.getMailById(id);
	}
	@Transactional
	@Override
	public void updateMail(String eid, Clob content, Integer id) {
		dao.updateMail(eid, content, id);
	}

//	@Transactional
//	@Override
//	public void updateMailById(String eid, String reply, Integer id) {
//		dao.updateMailById(eid, reply, id);
//	}

	
	
}
