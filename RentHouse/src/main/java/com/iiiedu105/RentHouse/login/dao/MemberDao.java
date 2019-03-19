package com.iiiedu105.RentHouse.login.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;
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

}