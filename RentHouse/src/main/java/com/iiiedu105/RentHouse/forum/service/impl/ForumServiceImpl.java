package com.iiiedu105.RentHouse.forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.forum.dao.ForumDao;
import com.iiiedu105.RentHouse.forum.service.ForumService;
import com.iiiedu105.RentHouse.model.Forum;
import com.iiiedu105.RentHouse.model.ForumReply;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.Member;

@Service
@Transactional //加在此視為所有方法
public class ForumServiceImpl implements ForumService {
	
	@Autowired
	ForumDao dao;

	public ForumServiceImpl() {
	}
	@Override
	public Forum findById(Integer Id) {
		return dao.findById(Id);
	}


//
//	@Override
//	public void insertForumReport(ForumReport ForumReportBeans) {
//		dao.insertForumReport(ForumReportBeans);
//	}
//

	
	@Override
	public  Member findMemberById(String Mid) {
		return dao.findMemberById(Mid);
	}

@Override
public List<Forum> getAllSorts() {
	
	return dao.getAllSorts();
}
@Override
public List<Forum> getAllPosts() {
	return dao.getAllPosts();
}
@Override
public void savePost(Forum forum) {
	 dao.savePost(forum);
}
@Override
public void updatePost(Forum forum) {
	dao.updatePost(forum);
}
@Override
public void deletePost(int id) {
	dao.deletePost(id);
}
@Override
public void insertReply(ForumReply Reply) {
	dao.insertReply(Reply);
	
}
@Override
public void saveReport(ForumReport Report) {
	dao.saveReport(Report);
	
}
@Override
public List<ForumReply> getAllReplies(Integer id){
	return dao.getAllReplies(id);
}
@Override
public void savefReport(ForumReport forumReport) {
	dao.savefReport(forumReport);
}
}
