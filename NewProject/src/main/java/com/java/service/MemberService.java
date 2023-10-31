package com.java.service;

import com.java.domain.MemberVO;

public interface MemberService {

	public void insertMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);	
	public boolean checkId(MemberVO vo);
}
