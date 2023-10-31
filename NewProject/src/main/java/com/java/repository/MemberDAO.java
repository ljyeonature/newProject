package com.java.repository;

import java.util.List;

import com.java.domain.MemberVO;

public interface MemberDAO {
	
	
	public void insertMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public boolean checkId(MemberVO vo);
	// 회원가입
	public List<MemberVO> member_all(MemberVO vo);
	
}
