package com.java.service;

import java.util.List;

import com.java.domain.CartVO;
import com.java.domain.CartViewVO;
import com.java.domain.LogVO;
import com.java.domain.LogVO2;
import com.java.domain.MemberVO;
import com.java.domain.OrderItemVO;
import com.java.domain.OrderVO;
import com.java.domain.PayInfoVO;
import com.java.domain.ProductVO;
import com.java.domain.WishListVO;

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
	
	// 찜 목록 저장
	public int product_wishlist(WishListVO vo);
	
	// 해당 ID의 찜 목록 보이기
	/* public List<WishListVO> wishlist_all(String m_id); */
	
	public List<WishListVO> wishlist_all(WishListVO wvo); 
	
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
	
	// 장바구니 삭제 : 이미지 클릭 시 삭제
	public int removeCartItem(CartVO vo);
	
	// 세션 아이디에 해당하는 회원정보 가져오기
	public MemberVO memberInfo(MemberVO vo);
	
	// 주문 내역 넣기
	public int insertOrder(OrderVO ovo);
	
	// 결제 내역 넣기
	public int insertPayInfo(PayInfoVO pvo);
	
	// 주문 아이템 넣기
	 public int insertOrderItem(OrderItemVO oivo); 
	 
	// 결제 후 장바구니 삭제
	public int cartAllDelete(CartVO vo);
	
	// 대 분류 별 주문
	public List<LogVO> fstOrder(LogVO vo);
	
	// 월별 매출
	public List<LogVO2> monthOrder(LogVO2 vo);
	
	
		
}
