package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.domain.CartVO;
import com.java.domain.CartViewVO;
import com.java.domain.LogVO;
import com.java.domain.MemberVO;
import com.java.domain.OrderItemVO;
import com.java.domain.OrderVO;
import com.java.domain.PayInfoVO;
import com.java.domain.ProductVO;
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


	// 찜 삭제
	@Override
	public int delete_wishlist(WishListVO vo) {
		int result = memberDAOImpl.delete_wishlist(vo);
		return result;
	}

	// 장바구니 추가
	@Override
	public int add_to_cart(CartVO vo) {
		int result = memberDAOImpl.add_to_cart(vo);
		return result;
	}

	// 장바구니 리스트
	@Override
	public List<CartVO> shopping_cart(CartViewVO vo) {
		List<CartVO> result = memberDAOImpl.shopping_cart(vo);
		return result;
	}
	// 장바구니 상품 중복 확인
	@Override
	public int alreadyInCartList(CartVO vo) {
		//System.out.println(vo.toString());
		int result = memberDAOImpl.alreadyInCartList(vo);
		return result;
	}

	// 장바구니 수량 올리기
	@Override
	public int plusCartCnt(CartVO vo) {
		int result = memberDAOImpl.plusCartCnt(vo);
		return result;
	}

	// 장바구니 수량 내리기
	@Override
	public int minusCartCnt(CartVO vo) {
		int result = memberDAOImpl.minusCartCnt(vo);
		return result;
	}

	// 장바구니 총합
	@Override
	public String cartTotal(CartVO vo) {
		String result = memberDAOImpl.cartTotal(vo);
		return result;
	}

	// 회원 정보 가져오기
	@Override
	public MemberVO memberInfo(MemberVO vo) {
		MemberVO result = memberDAOImpl.memberInfo(vo);
		return result;
	}

	// 주문 넣기
	@Override
	public int insertOrder(OrderVO ovo) {
		return memberDAOImpl.insertOrder(ovo);
	}

	// 결제 내역 넣기
	@Override
	public int insertPayInfo(PayInfoVO pvo) {
		return memberDAOImpl.insertPayInfo(pvo);
		
	}

	// 주문 아이템 넣기
	@Override
	public int insertOrderItem(OrderItemVO oivo) {
		return memberDAOImpl.insertOrderItem(oivo);
		
	}

	// 장바구니 삭제 - 이미지 클릭 시 삭제
	@Override
	public int removeCartItem(CartVO vo) {
		int result = memberDAOImpl.removeCartItem(vo);
		return result;
	}

	// 장바구니 삭제 : 주문 후 모두 삭제
	@Override
	public int cartAllDelete(CartVO vo) {
		int result = memberDAOImpl.cartAllDelete(vo);
		return result;
	}
	
	// 대분류 별 주문 내역
	@Override
	public List<LogVO> fstOrder(LogVO vo) {
		List<LogVO> result = memberDAOImpl.fstOrder(vo);
		return result;
	}

	
	
	


	
	
}
