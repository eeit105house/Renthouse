package com.iiiedu105.RentHouse.backend.review.writings.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.model.ForumReport;

@Repository
public class RWritingsDaoImpl implements RWritingsDao {
	@Autowired
	SessionFactory factory;
	@Override
	@SuppressWarnings("unchecked")
	public List<ForumReport> getAllWritings(){
		String hql = 
				" FROM ForumReport fr WHERE fr.status = '待審' ";
		Session session = null;
		List<ForumReport> list = null;
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();		
		return list;		
	}
	@Override
	public void updatePassWritings(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = 
		"update ForumReport fr set fr.status = '已審' where fr.id = :fid";
		session.createQuery(hql).setParameter("fid", id).executeUpdate();
		ForumReport forumReport = session.get(ForumReport.class, id);
		String hql1 = 
				"update Forum f set f.status = '上架' where f.id = :frid";
				session.createQuery(hql1).setParameter("frid", forumReport.getForumBean().getId()).executeUpdate();
	}
	@Override
	public void updateFailWritings(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = 
				"update ForumReport fr set fr.status = '已審' where fr.id = :fid";
				session.createQuery(hql).setParameter("fid", id).executeUpdate();	
				ForumReport forumReport = session.get(ForumReport.class, id);
				String hql1 = 
						"update Forum f set f.status = '下架' where f.id = :frid";
						session.createQuery(hql1).setParameter("frid", forumReport.getForumBean().getId()).executeUpdate();			
	}
//	@SuppressWarnings("unchecked")
	@Override
	public Object[] getAllDetailWritingsById(Integer id) {
		Session session = factory.getCurrentSession();
		 List<Object[]> list = null;
		String hql = 
			"SELECT f.id,f.title,f.content,f.sort,fr.memberBean.id,fr.content, fr.datetime,fr.type,fr.id FROM Forum f, ForumReport fr WHERE fr.id = :oid and f.id = fr.forumBean.id";
		 Object[] object = (Object[]) session.createQuery(hql).setParameter("oid", id).getSingleResult();
		return object;//F 討論區 FR 檢舉
	}
	
}
