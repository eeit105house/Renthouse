package com.iiiedu105.RentHouse.membercenter.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;
import com.iiiedu105.RentHouse.model.Reservation;
//import com.iiiedu105.RentHouse.model.TestTest;
@Repository
public interface MemberCenterDao {

	Member findMemberById(String id);
	
	List<Object[]> getAllMsg(String id);
	
	List<Reservation> getUnreadReservation(String mid);
	
	List<EmployeeReport> getUnreadEmployeeReport(String mid);

	void addEmployeeReport(EmployeeReport employeeReport);
	
	public List<EmployeeReport> getAllMail(String mid);
	
	public EmployeeReport getMailById(Integer id);
}