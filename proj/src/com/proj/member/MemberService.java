package com.proj.member;

import java.util.List;

import com.proj.member.MemberVO;

public interface MemberService {
	
	List<MemberVO> selectMemberList();
	MemberVO selectMember();
	public int insertMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public int deleteMember(MemberVO vo);
}