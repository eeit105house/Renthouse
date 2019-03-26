package com.iiiedu105.RentHouse.login.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;
import com.iiiedu105.RentHouse.model.Reservation;
//import com.iiiedu105.RentHouse.model.TestTest;
@Repository
public interface MemberDao {

	Member findMemberById(String id);

	List<Member> checkMemberById(String id);

	void saveMember(Member member);

	void updateMember(Member member);

	void deleteMemberById(String id);

	List<Member> findAllMembers();

	void deleteAllMembers();

	void insertMemberPicture(Member member);
	
	List<Object[]> getAllMsg(String id);
	
	List<Reservation> getUnreadReservation();
	
	List<EmployeeReport> getUnreadEmployeeReport();

	void addEmployeeReport(EmployeeReport employeeReport);
	
	List<Member> checkMemberByPersonID(String personID);

	List<Member> checkMemberByEmail(String email);
	
	void updateAllMsgById(String mid);

	Member findMemberByEmail(String email);


}