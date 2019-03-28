package com.iiiedu105.RentHouse.login.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.login.dao.MemberDao;
import com.iiiedu105.RentHouse.login.service.MemberService;
import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.Member;
//import com.iiiedu105.RentHouse.model.TestTest;
import com.iiiedu105.RentHouse.model.Reservation;

@Service
@Transactional
@EnableTransactionManagement
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberDao;
	
	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.service.impl.MemberService#findMemberById(java.lang.String)
	 */
	@Override
	public Member findMemberById(String id) {
		return memberDao.findMemberById(id);
	}

	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.service.impl.MemberService#findByName(java.lang.String)
	 */
	@Override
	public List<Member> checkByid(String id) {
		return memberDao.checkMemberById(id);
	}
	
	@Override
	public List<Member> checkByPersonID(String personID) {
		return memberDao.checkMemberByPersonID(personID);
	}
	@Override
	public List<Member> checkByEmail(String email) {
		return memberDao.checkMemberByEmail(email);
	}

	@Override
	public Member login(String id,String pwd) {
		String inId = id.toUpperCase();
		Member bean = memberDao.findMemberById(inId);
		if(bean!=null) {
			inId = id.toUpperCase();
			String dbId = bean.getId().toUpperCase();
			if(inId.equals(dbId)) {
			if(pwd!=null && pwd.length()!=0) {
				String inPWD = pwd;
				String dbPWD = bean.getPwd();
				if(inPWD.equals(dbPWD)) {
					return bean;
				}
			}
		}
		}
		return null;
	}
	@Override
	public Member loginByEmail(String id) {
		Member bean = memberDao.findMemberByEmail(id);
		if(bean!=null) {
		return bean;
		}
		return null;
	}
	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.service.impl.MemberService#saveMember(com.iiiedu105.RentHouse.model.Member)
	 */
	@Override
	public void saveMember(Member member) {
		memberDao.saveMember(member);
	}
	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.service.impl.MemberService#updateMember(com.iiiedu105.RentHouse.model.Member)
	 */
	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);
	}

	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.service.impl.MemberService#deleteMemberById(java.lang.String)
	 */
	@Override
	public void deleteMemberById(String id) {
		memberDao.deleteMemberById(id);
	}

	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.service.impl.MemberService#findAllMembers()
	 */
	@Override
	public List<Member> findAllMembers() {
		return memberDao.findAllMembers();
	}

	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.service.impl.MemberService#deleteAllMembers()
	 */
	@Override
	public void deleteAllMembers() {
		memberDao.deleteAllMembers();
	}
	@Override
	public void insertMemberPicture(Member member) {
		memberDao.insertMemberPicture(member);
	}

	@Override
	public List<Object[]> getAllMsg(String id) {		
		return memberDao.getAllMsg(id);
	}

	@Override
	public List<Reservation> getUnreadReservation() {		
		return memberDao.getUnreadReservation();
	}

	@Override
	public List<EmployeeReport> getUnreadEmployeeReport() {
		return memberDao.getUnreadEmployeeReport();
	}

	@Override
	public void addEmployeeReport(EmployeeReport employeeReport) {
		memberDao.addEmployeeReport(employeeReport);
	}

	@Override
	public void updateAllMsgById(String mid) {
		memberDao.updateAllMsgById(mid);
	}
}
