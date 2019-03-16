package com.iiiedu105.RentHouse.login.service;

import java.util.List;

import com.iiiedu105.RentHouse.model.Member;

public interface MemberService {

	Member findMemberById(String id);

	Boolean findByName(String id);

	void saveMember(Member member);

	void updateMember(Member member);

	void deleteMemberById(String id);

	List<Member> findAllMembers();

	void deleteAllMembers();

}