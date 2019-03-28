package com.iiiedu105.RentHouse.forum.service;
import java.util.List;
import java.util.Map;

import com.iiiedu105.RentHouse.model.Forum;
import com.iiiedu105.RentHouse.model.ForumReply;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.Member;


public interface ForumService  {
	public Forum findById(Integer Id);
	public void insertReply(ForumReply Reply);
	public void saveReport(ForumReport Report);
	public Member findMemberById(String Mid);


	void savePost(Forum forum);
	
	void updatePost(Forum forum);

	void deletePost(int id);
	List<Forum> getAllSorts();
	List<Forum> getAllPosts();
	List<ForumReply> getAllReplies();
	
	void savefReportUpdateForum(ForumReport forumReport);
}
