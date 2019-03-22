package com.iiiedu105.RentHouse.backend.main.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.backend.main.dao.LoginDao;
import com.iiiedu105.RentHouse.model.Employee;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> getOneEmployee(String mid,String pwd){
		Session session = factory.getCurrentSession();
		String hql = "FROM Employee where id =:memberid and pwd=:pwd";
		List<Employee> employee = session.createQuery(hql).setParameter("memberid",mid).setParameter("pwd", pwd).getResultList();
		return employee;
	}
	
	
}
