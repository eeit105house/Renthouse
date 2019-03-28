package com.iiiedu105.RentHouse.forum.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.forum.dao.ForumDao;
import com.iiiedu105.RentHouse.model.Forum;
import com.iiiedu105.RentHouse.model.ForumReply;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

@Repository
public class ForumDaoImpl implements ForumDao {
	SessionFactory factory;

	public SessionFactory getFactory() {
		return factory;
	}

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public ForumDaoImpl() {
	}

	@Override
	public Forum findById(Integer Id) {
		Session session = factory.getCurrentSession();
		Forum ForumBean = session.get(Forum.class, Id);
		
		return ForumBean;
	}

	@Override
	public void savePost(Forum forum) {
		Session session = factory.getCurrentSession();
//		Forum fb = findById(post.findMemberById());
//		post.setForumBeans(fb);
		List<Forum> list = null;
		session.save(forum);
	}
	@Override
	public  Member findMemberById(String Mid) {
		Session session = factory.getCurrentSession();
		Member memberBean = session.get(Member.class,Mid);
		return memberBean;
	}


//	@Override
//	public void SaveReport(ForumReport ForumReport) {
//		Session session = factory.getCurrentSession();
//		session.save(ForumReport);
//	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Forum> getAllSorts(){
		String hql = "SELECT sort FROM Forum";		
		Session session = null;
		List<Forum> list = null;
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();		
		return list;		
	}
	@Override
	public List<Forum> getAllPosts() {
		String hql = "FROM Forum";		
		Session session = null;
		List<Forum> list = null;
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();		
		return list;		
	}
	@Override
	public List<ForumReply> getAllReplies(Integer id) {
		String hql = "FROM ForumReply WHERE forumBean.id = :id ORDER BY id";		
		Session session = null;
		List<ForumReply> list = null;
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("id", id).getResultList();		
		return list;		
	}
//	@Override
//	public void updateHouseStatus(int id) {
//		Session session = factory.getCurrentSession();
//		String hql = 
//		"update House h set h.status = '上架' where h.id = :hid";
//		session.createQuery(hql).setParameter("hid", id).executeUpdate();	
//	}
//	@Override
//	public void deleteHouse(int id) {
//		Session session = factory.getCurrentSession();
//		String hql = "update House h set h.status = '下架' where h.id = :hid";
//		session.createQuery(hql).setParameter("hid", id).executeUpdate();			
//	}

@Override
public void deletePost(int id) {
	Session session = factory.getCurrentSession();
	String hql = "DELETE FROM Forum";
	session.createQuery(hql).executeUpdate();	
	
}

@Override
public void updatePost(Forum forum) {
//	String hql = 'Update Forum S'
	Session session = factory.getCurrentSession();
	session.update(forum);
}

@Override
public void insertReply(ForumReply reply) {
	Session session = factory.getCurrentSession();
//	Forum fb = findById(post.findMemberById());
//	post.setForumBeans(fb);
	List<ForumReply> list = null;
	System.out.println(reply.getId());
	session.save(reply);
}

@Override
public void saveReport(ForumReport report) {
	Session session = factory.getCurrentSession();
	session.saveOrUpdate(report);
	
}

@Override
public void savefReport(ForumReport forumReport) {
	Session session = factory.getCurrentSession();
	session.save(forumReport);
}


}

