package com.iiiedu105.RentHouse.login.service;

import java.util.List;

import com.iiiedu105.RentHouse.model.Member;
//import com.iiiedu105.RentHouse.model.TestTest;

public interface MemberService {

	Member findMemberById(String id);

	List<Member> checkByid(String id);

	void saveMember(Member member);

	void updateMember(Member member);

	void deleteMemberById(String id);

	List<Member> findAllMembers();

	void deleteAllMembers();

	Member login(String id, String pwd);

	void insertMemberPicture(Member member);

	List<Member> checkByPersonID(String personID);

	List<Member> checkByEmail(String email);



}