package com.iiiedu105.RentHouse.membercenter.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.login.dao.MemberDao;
import com.iiiedu105.RentHouse.login.service.MemberService;
import com.iiiedu105.RentHouse.membercenter.dao.MemberCenterDao;
import com.iiiedu105.RentHouse.membercenter.service.MemberCenterService;
import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.Member;
//import com.iiiedu105.RentHouse.model.TestTest;
import com.iiiedu105.RentHouse.model.Reservation;

@Service
@Transactional
@EnableTransactionManagement
public class MemberCenterServiceImpl implements MemberCenterService {
	@Autowired
	MemberCenterDao memberDao;
	@Override
	public Member findMemberById(String id) {
		return memberDao.findMemberById(id);
	}
	@Override
	public List<Object[]> getAllMsg(String id) {		
		return memberDao.getAllMsg(id);
	}

	@Override
	public List<Reservation> getUnreadReservation(String mid) {		
		return memberDao.getUnreadReservation(mid);
	}

	@Override
	public List<EmployeeReport> getUnreadEmployeeReport(String mid) {
		return memberDao.getUnreadEmployeeReport(mid);
	}

	@Override
	public void addEmployeeReport(EmployeeReport employeeReport) {
		memberDao.addEmployeeReport(employeeReport);
	}
	@Override
	public List<EmployeeReport> getAllMail(String mid) {
		return memberDao.getAllMail(mid);
	}
	@Override
	public EmployeeReport getMailById(Integer id) {
		return memberDao.getMailById(id);
	}
}
