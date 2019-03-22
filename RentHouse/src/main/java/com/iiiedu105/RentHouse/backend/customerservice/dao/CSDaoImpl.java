package com.iiiedu105.RentHouse.backend.customerservice.dao;

import java.sql.Clob;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.iiiedu105.RentHouse.model.EmployeeReport;
@Repository
public class CSDaoImpl implements CSDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<EmployeeReport> getAllMail(){
		Session session = null;
		session = factory.getCurrentSession();
		List<EmployeeReport> list = null;
		String hql = "FROM EmployeeReport where status='未讀' ";
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public EmployeeReport getMailById(Integer id) {
		Session session = null;
		session = factory.getCurrentSession();
		EmployeeReport employeeReport = session.get(EmployeeReport.class, id);
		return employeeReport;
	}
	
//	@Override
//	public void updateMailById(String eid,String reply,Integer id) {
//		Session session = null;
//		session = factory.getCurrentSession();
//		String hql =
//		"update EmployeeReport set memberBean = :employeeId, reply = :reply where id = :id";
//		session.createQuery(hql).setParameter("employeeId", eid)
//								.setParameter("reply", reply)
//								.setParameter("id", id)
//								.executeUpdate();
//	}
	@Override
	public void updateMail(String eid,Clob content,Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE EmployeeReport SET status='會員未讀', employeeBean.id = :eid, content = :content where id = :id";
		session.createQuery(hql).setParameter("eid", eid)
								.setParameter("content", content)
								.setParameter("id", id)
								.executeUpdate();
		
	}
}
