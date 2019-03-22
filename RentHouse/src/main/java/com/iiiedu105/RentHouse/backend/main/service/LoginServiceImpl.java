package com.iiiedu105.RentHouse.backend.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.backend.main.dao.LoginDao;
import com.iiiedu105.RentHouse.model.Employee;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDao dao;
	@Override
	public List<Employee> getOneEmployee(String mid,String pwd) {
		return dao.getOneEmployee(mid,pwd);
	}

}
