package com.java.service;

import java.util.List;

import com.java.domain.MemberVO;

public interface MemberService {

	public void insertMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);	
	public boolean checkId(MemberVO vo);
	
	//	회원 목록 보기
	public List<MemberVO> member_dash(MemberVO vo);
	
	// 전체회원관리에서 회원 목록 보기
	public List<MemberVO> member_all(MemberVO vo);
	
	// 포인트
	public MemberVO member_point_detail(MemberVO vo);
	
	// 포인트
	public int member_point_content(MemberVO vo);
	
}
