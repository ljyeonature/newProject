
package com.java.repository;

import java.util.List;

import com.java.domain.CartVO;
import com.java.domain.CartViewVO;
import com.java.domain.MemberVO;
import com.java.domain.WishListVO;

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
	
	// 비밀번호 변경
	public int pwUpdate_M(MemberVO vo);
	
	// 마이페이지 회원정보(수정)페이지에서 회원정보 가져오기
	public MemberVO member_detail(String m_id);
	
	// 회원정보 수정
	public int update_member(MemberVO vo);
	
	// 찜 목록 저장하기
	public int product_wishlist(WishListVO vo);
	
	// 해당 ID의 찜 목록 보이기
	public List<WishListVO> wishlist_all(WishListVO vo);
	
	
	// 찜 삭제
	public int delete_wishlist(WishListVO vo);
	
	// 장바구니 추가
	public int add_to_cart(CartVO vo);
	
	// 장바구니 리스트
	public List<CartVO> shopping_cart(CartViewVO vo);
	
	// 장바구니 중복 확인
	public int alreadyInCartList(CartVO vo);
	
	// 장바구니 수량 올리기
	public int plusCartCnt(CartVO vo);
	
	// 장바구니 수량 내리기
	public int minusCartCnt(CartVO vo);
	
	// 장바구니 총합
	public String cartTotal(CartVO vo);

}
