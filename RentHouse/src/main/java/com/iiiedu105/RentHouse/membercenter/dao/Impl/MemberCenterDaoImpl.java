package com.iiiedu105.RentHouse.membercenter.dao.Impl;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.login.dao.MemberDao;
import com.iiiedu105.RentHouse.membercenter.dao.MemberCenterDao;
import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.Member;
import com.iiiedu105.RentHouse.model.Reservation;

@Repository
public class MemberCenterDaoImpl implements MemberCenterDao  {
	@Autowired
	SessionFactory factory;

	public MemberCenterDaoImpl() {
	}	
	@Override
	public Member findMemberById(String id) {
		Session session = factory.getCurrentSession();
		Member member = session.get(Member.class, id);
		return member;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getAllMsg(String id) {
		Session session = factory.getCurrentSession();
		String hql =
		"FROM Reservation r where r.readStatus='未讀' and r.memberBean.id = :id";
		String hql2 =
				"FROM  EmployeeReport e where e.status='會員未讀' and e.memberBean.id = :mid";
		List<Object[]> list = null;
		list = session.createQuery(hql).setParameter("id", id).getResultList();
		list.addAll(session.createQuery(hql2).setParameter("mid", id).getResultList());
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Reservation> getUnreadReservation(String mid) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Reservation where readStatus='未讀' and memberBean.id=:mid";
		List<Reservation> list = session.createQuery(hql).setParameter("mid", mid).getResultList();		
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeReport> getUnreadEmployeeReport(String mid) {
		Session session = factory.getCurrentSession();
		String hql = "FROM EmployeeReport where status='會員未讀' and memberBean.id=:mid ";
		List<EmployeeReport> list = session.createQuery(hql).setParameter("mid", mid).getResultList();		
		return list;
	}

	@Override
	public void addEmployeeReport(EmployeeReport employeeReport) {
		Session session = factory.getCurrentSession();
		java.util.Date date = new java.util.Date();
		Date date1 = new Date(date.getTime());
		employeeReport.setDatetime(date1);
		employeeReport.setStatus("未讀");
		session.save(employeeReport);
		}
	@Override
	@SuppressWarnings("unchecked")
	public List<EmployeeReport> getAllMail(String mid){
		Session session = null;
		session = factory.getCurrentSession();
		List<EmployeeReport> list = null;
		String hql = "FROM EmployeeReport where memberBean.id=:mid";
		list = session.createQuery(hql).setParameter("mid", mid).getResultList();
		return list;
	}
	@Override
	public EmployeeReport getMailById(Integer id) {
		Session session = null;
		session = factory.getCurrentSession();
		EmployeeReport employeeReport = null;
		String hql = "FROM EmployeeReport er where er.id=:rid";
		employeeReport = (EmployeeReport) session.createQuery(hql).setParameter("rid", id).getSingleResult();
		return employeeReport;
	}
	@Override
	public void updateServicereport(Integer id) {
		Session session = null;
		session = factory.getCurrentSession();
		String hql = "UPDATE EmployeeReport er SET status='已讀' where er.id=:rid";
		session.createQuery(hql).setParameter("rid", id).executeUpdate();
	}
}
