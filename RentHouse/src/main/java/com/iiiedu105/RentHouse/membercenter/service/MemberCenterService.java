package com.iiiedu105.RentHouse.membercenter.service;

import java.util.List;

import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.Member;
//import com.iiiedu105.RentHouse.model.TestTest;
import com.iiiedu105.RentHouse.model.Reservation;

public interface MemberCenterService {

Member findMemberById(String id);
	
	List<Object[]> getAllMsg(String id);
	
	List<Reservation> getUnreadReservation(String mid);
	
	List<EmployeeReport> getUnreadEmployeeReport(String mid);

	void addEmployeeReport(EmployeeReport employeeReport);

	public List<EmployeeReport> getAllMail(String mid);
	
	public EmployeeReport getMailById(Integer id);

}