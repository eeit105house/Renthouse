package com.iiiedu105.RentHouse.backend.main.dao.Impl;

import java.sql.Blob;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.backend.main.dao.LoginDao;
import com.iiiedu105.RentHouse.model.Employee;
import com.iiiedu105.RentHouse.model.HouseDeal;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> getOneEmployee(String mid,String pwd){
		Session session = factory.getCurrentSession();
		String hql = "FROM Employee where id =:employeeid and pwd=:pwd";
		List<Employee> employee = session.createQuery(hql).setParameter("employeeid",mid).setParameter("pwd", pwd).getResultList();
		return employee;
	}

	@Override
	public void updateEmployee(String eid, String ename, Blob pic, String pwd) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Employee SET name=:ename,pic=:pic,pwd=:pwd where id=:eid";
		session.createQuery(hql).setParameter("ename", ename)
								.setParameter("pic", pic)
								.setParameter("pwd", pwd)
								.setParameter("eid", eid).executeUpdate();
								
	}

	@Override
	public Employee getEmployeeById(String mid) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Employee where id =:employeeid";
		Employee employee = (Employee) session.createQuery(hql).setParameter("employeeid",mid).getSingleResult();
		return employee;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HouseDeal> getAllHouseDeal() {
		Session session = factory.getCurrentSession();
		String hql = "FROM HouseDeal";
		List<HouseDeal> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	
}
