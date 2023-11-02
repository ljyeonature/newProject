package com.java.repository;

import java.util.List;

import com.java.domain.MemberVO;

public interface MemberDAO {
	
	
	public void insertMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public boolean checkId(MemberVO vo);
	
	
	//대시보드에서 회원가입 리스트 불러오기
	public List<MemberVO> member_dash(MemberVO vo); //함수정의 구체적인건 impl에서 함
	
	//회원정보관리에서 회원가입 리스트 불러오기
	public List<MemberVO> member_all(MemberVO vo);

	
	// 포인트
	public MemberVO member_point_detail(MemberVO vo);
	
	public int member_point_content(MemberVO vo);
	
	
	
}
