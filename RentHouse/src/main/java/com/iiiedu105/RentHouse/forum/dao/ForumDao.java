package com.iiiedu105.RentHouse.forum.dao;
import java.util.List;

import com.iiiedu105.RentHouse.model.Forum;
import com.iiiedu105.RentHouse.model.ForumReply;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.Member;


public interface ForumDao  {
	public Forum findById(Integer Id);
	public void insertReply(ForumReply Reply);
	public void saveReport(ForumReport Report);
	public Member findMemberById(String Mid);

	List<Forum> getAllPosts();
	void savePost(Forum forum);
	
	void updatePost(Forum forum);

	void deletePost(int id);

}

