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
	
	// 비밀번호 초기화 위한 이메일 찾기
	public MemberVO selectMember(String m_email);
	
	// 비밀번호 변경
	public int pwUpdate_M(MemberVO vo);
	
	// 회원정보(수정) 페이지에서 회원 정보 불러오기
	public MemberVO member_detail(String m_id);
	
	// 회원정보 수정
	public int update_member(MemberVO vo);
}
