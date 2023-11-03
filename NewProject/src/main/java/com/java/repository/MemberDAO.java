package com.java.repository;

import java.util.List;

import com.java.domain.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void insertMember(MemberVO vo);
	// 로그인 체크
	public MemberVO loginCheck(MemberVO vo);
	// 아이디 중복확인
	public boolean checkId(MemberVO vo);
	// 회원가입
	public List<MemberVO> member_dash(MemberVO vo);
	
	//회원정보관리에서 회원가입 리스트 불러오기
	public List<MemberVO> member_all(MemberVO vo);
	
	// 포인트
	public MemberVO member_point_detail(MemberVO vo);
	
	// 포인트 차감
	public int member_point_content(MemberVO vo);
	
	// 비밀번호 찾기
	public MemberVO selectMember(String m_email);
	
	public int pwUpdate_M(MemberVO vo);
	
	
	
}
