package com.iiiedu105.RentHouse.login.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.login.dao.MemberDao;
import com.iiiedu105.RentHouse.login.service.MemberService;
import com.iiiedu105.RentHouse.model.Member;
//import com.iiiedu105.RentHouse.model.TestTest;

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
	public List<Member> findByName(String id) {
		return memberDao.checkMemberById(id);
	}
	@Override
	public Member login(String id,String pwd) {
		Member bean = memberDao.findMemberById(id);
		if(bean!=null) {
			if(pwd!=null && pwd.length()!=0) {
				String inPWD = pwd;
				String dbPWD = bean.getPwd();
				if(inPWD.equals(dbPWD)) {
					return bean;
				}
			}
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
}