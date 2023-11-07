package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.domain.MemberVO;
import com.java.domain.WishListVO;
import com.java.repository.MemberDAO;

//### (1) 해당 어노테이션 지정
@Service
public class MemberServiceImpl implements MemberService{

	// ### (2) 해당 어노테이션 지정
	@Autowired
	private MemberDAO memberDAOImpl;
	
	public void insertMember(MemberVO vo) {
		memberDAOImpl.insertMember(vo);
	}
	
	public MemberVO loginCheck(MemberVO vo) {
//		System.out.println("로그인 : " + vo.getM_id() +"/" +vo.getM_pass());
		return memberDAOImpl.loginCheck(vo);
	}
	
	public boolean checkId(MemberVO vo) {
		//System.out.println(memberDAOImpl.checkId(vo));
		return memberDAOImpl.checkId(vo);
	}

	// 관리자 홈에서 회원 목록
	@Override
	public List<MemberVO> member_dash(MemberVO vo) {
//		System.out.println("MemberService: "+ vo.toString());
		List<MemberVO> result = memberDAOImpl.member_dash(vo);
//		System.out.println(result);
		return result;
	}
	
	// 전체 회원목록에서 전체 회원 목록
	@Override
	public List<MemberVO> member_all(MemberVO vo){
		List<MemberVO> result = memberDAOImpl.member_all(vo);
		return result;
	}

	// 포인트 관리에서 회원 목록 보이기
	@Override
	public MemberVO member_point_detail(MemberVO vo) {
//		System.out.println(vo.getM_id());
		MemberVO result = memberDAOImpl.member_point_detail(vo);
		return result;
	}

	// 포인트 내역 - 차감 업데이트
	@Override
	public int member_point_content(MemberVO vo) {
//		System.out.println(vo.getM_pass());
		int result = memberDAOImpl.member_point_content(vo);
//		System.out.println("Service : " + result);
		return result;
	}

	// 비밀번호 찾기 - 이메일
	@Override
	public MemberVO selectMember(String m_email) {
//		System.out.println("Password Service : " + m_email);
		MemberVO result = memberDAOImpl.selectMember(m_email);
//		System.out.println("Service : " + result);
		return result;
	}

	// 비밀번호 변경
	@Override
	public int pwUpdate_M(MemberVO vo) {
		int result = memberDAOImpl.pwUpdate_M(vo);
//		System.out.println("비번 변경 : " + result);
		return result;
	}

	// 마이페이지 회원정보(수정)페이지에서 회원정보 가져오기
	@Override
	public MemberVO member_detail(String m_id) {
		MemberVO result = memberDAOImpl.member_detail(m_id);
//		System.out.println("MemberServiceDetail :" + result);
		return result;
	}

	// 회원정보 수정
	@Override
	public int update_member(MemberVO vo) {
		int result = memberDAOImpl.update_member(vo);
		System.out.println("Service(update) : " + result);
		return result;
	}

	// 찜 목록 저장
	@Override
	public int product_wishlist(WishListVO vo) {
		int result = memberDAOImpl.product_wishlist(vo);
		return result;
	}
	
	// 해당 ID의 찜 목록 보이기
	@Override
	public List<WishListVO> wishlist_all(WishListVO vo) {
		List<WishListVO> result = memberDAOImpl.wishlist_all(vo);
		return result;
	}
	
	
}
