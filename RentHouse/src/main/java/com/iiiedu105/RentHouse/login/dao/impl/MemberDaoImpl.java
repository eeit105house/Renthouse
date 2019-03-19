package com.iiiedu105.RentHouse.login.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.login.dao.MemberDao;

import com.iiiedu105.RentHouse.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao  {
	@Autowired
	SessionFactory factory;
	
//	public SessionFactory getFactory() {
//		return factory;
//	}
//	
//	@Autowired
//	public void setFactory(SessionFactory factory) {
//		this.factory = factory;
//	}

	public MemberDaoImpl() {
	}
	
	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.dao.MemberDao#findMemberById(java.lang.String)
	 */
	@Override
	public Member findMemberById(String id) {
		Session session = factory.getCurrentSession();
		Member member = session.get(Member.class, id);
		return member;
	}

	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.dao.MemberDao#checkMemberById(java.lang.String)
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Member> checkMemberById(String id) {
		Session session = factory.getCurrentSession();
		String hql = "id.pwd FROM Member WHERE id=:id";
		
		List<Member> list = session.createQuery(hql)
								.setParameter("id", id)
								.getResultList();
		
		if (list.isEmpty()) {
		return null;
		}
		return list;
	}

	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.dao.MemberDao#saveMember(com.iiiedu105.RentHouse.model.Member)
	 */
	@Override
	public void saveMember(Member member) {
		Session session = factory.getCurrentSession();
		session.save(member);
	}
	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.dao.MemberDao#updateMember(com.iiiedu105.RentHouse.model.Member)
	 */
	@Override
	public void updateMember(Member member) {
		Session session = factory.getCurrentSession();
		session.update(member);
		
	}

	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.dao.MemberDao#deleteMemberById(java.lang.String)
	 */
	@Override
	public void deleteMemberById(String id) {
		Session session = factory.getCurrentSession();
		Member member = new Member();
		member.setId(id);
		session.delete(member);
	}

	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.dao.MemberDao#findAllMembers()
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Member> findAllMembers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Member";
		List<Member> list = session.createQuery(hql)
								.getResultList();
		return list;
	}

	/* (non-Javadoc)
	 * @see com.iiiedu105.RentHouse.login.dao.MemberDao#deleteAllMembers()
	 */
	@Override
	public void deleteAllMembers() {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM Member";
		session.createQuery(hql).executeUpdate();	
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void insertMemberPicture(Member member) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Member WHERE pic = :pic AND id=:id";
		List<Member> checkPic = session.createQuery(hql)
				.setParameter("pic", member.getPic())
				.setParameter("id", member.getId())
				.getResultList();

		if (checkPic.isEmpty())
			session.save(member);
		else {
			String hqlUp = "UPDATE Member pic SET pic = :pic WHERE Member = :M_id";
			session.createQuery(hqlUp)
			.setParameter("pic", member.getPic())
			.setParameter("M_id", member.getId())
			.executeUpdate();
		}
			
	}
}
