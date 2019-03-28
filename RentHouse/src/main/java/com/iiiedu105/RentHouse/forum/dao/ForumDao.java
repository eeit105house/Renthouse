package com.iiiedu105.RentHouse.forum.dao;
import java.util.List;
import java.util.Set;

import com.iiiedu105.RentHouse.model.Forum;
import com.iiiedu105.RentHouse.model.ForumReply;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.Member;


public interface ForumDao  {
	public Forum findById(Integer Id);
	void insertReply(ForumReply reply);
	void saveReport(ForumReport report);
	public Member findMemberById(String Mid);
	List<Forum> getAllPosts();
	List<Forum> getAllSorts();
	List<ForumReply> getAllReplies();
	void savePost(Forum forum);
	
	void updatePost(Forum forum);

	void deletePost(int id);
	
	void savefReport(ForumReport forumReport);
	

}

