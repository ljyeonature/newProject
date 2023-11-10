package com.java.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.domain.CartVO;
import com.java.domain.CartViewVO;
import com.java.domain.MemberVO;
import com.java.domain.OrderItemVO;
import com.java.domain.OrderVO;
import com.java.domain.PayInfoVO;
import com.java.domain.ProductVO;
import com.java.domain.WishListVO;

//### (1) 해당 어노테이션 지정
@Repository
public class MemberDAOImpl implements MemberDAO{

	//### (2) 해당 어노테이션 지정
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 회원가입
	@Override
	public void insertMember(MemberVO vo) {
//		System.out.println(vo.toString());
		int result = sqlSession.insert("org.java.MemberMapper.insertMember", vo);
//		System.out.println("insert : " + result);
	}


	// 회원가입 id 체크
	@Override
	public boolean checkId(MemberVO vo) {
		//System.out.println(vo.toString());
		int result = sqlSession.selectOne("org.java.MemberMapper.selectcheckIdMember", vo);
		//System.out.println("select id : " + result);
		// result==1이란 말은 중복 아이디가 있다는 말
		if(result == 1) {
			return true;
		}
			
		return false;
	}
	// 로그인 체크
	@Override
	public MemberVO loginCheck(MemberVO vo) {
//		System.out.println("memberDAO : "+vo.toString());
		MemberVO result = sqlSession.selectOne("org.java.MemberMapper.loginCheck", vo);
//		System.out.println(result);
		return result;
		
	}

	//관리자 홈에서 회원가입리스트
	@Override
	public List<MemberVO> member_dash(MemberVO vo) {
//		System.out.println("MemberDAO : " + vo.toString());
		return sqlSession.selectList("org.java.MemberMapper.member_dash", vo);
	}
	
	//회원정보관리에서 회원가입리스트
	@Override
	public List<MemberVO> member_all(MemberVO vo){
		
		return sqlSession.selectList("org.java.MemberMapper.member_all",vo);
	}

	// 포인트 관리 페이지에서 회원 목록 보이기
	@Override
	public MemberVO member_point_detail(MemberVO vo) {
//		System.out.println("MemberDAO m_id: " + vo.getM_id());
		return sqlSession.selectOne("org.java.MemberMapper.member_point_detail", vo);
	}

	// 포인트 차감
	@Override
	public int member_point_content(MemberVO vo) {
//		System.out.println("MemberPoint : " + vo.getM_point());
		int result=sqlSession.update("org.java.MemberMapper.member_point_content", vo);
//		System.out.println("DAO : " + result);
		return result;
	}


	// 비밀번호 찾기 : 이메일 인증 - 이메일 찾기
	@Override
	public MemberVO selectMember(String m_email) {
		MemberVO result = sqlSession.selectOne("org.java.MemberMapper.selectMember", m_email);
//		System.out.println("selectMember DAO : " + result);
		return result;
	}

	// 비밀번호 변경
	@Override
	public int pwUpdate_M(MemberVO vo) {
		int result=sqlSession.update("org.java.MemberMapper.pwUpdate_M", vo);
//		System.out.println("pwUpdate_M DAO : " + result);
		return result;
	}
	
	// 마이페이지 회원정보(수정)페이지에서 회원정보 가져오기
	@Override
	public MemberVO member_detail(String m_id) {
		MemberVO result = sqlSession.selectOne("org.java.MemberMapper.member_detail", m_id);
//		System.out.println("memberDetail(DAO) : " + result);
		return result;
	}

	// 회원 정보 수정
	@Override
	public int update_member(MemberVO vo) {
		int result = sqlSession.update("org.java.MemberMapper.update_member", vo);
		System.out.println("update_member : " + result);
		return result;
	}

	// 찜 목록에 저장
	@Override
	public int product_wishlist(WishListVO vo) {
		int result = sqlSession.insert("org.java.MemberMapper.product_wishlist", vo);
		return result;
	}
	
	// 해당 ID의 찜 목록 보이기
	@Override
	public List<WishListVO> wishlist_all(WishListVO vo) {
		return sqlSession.selectList("org.java.MemberMapper.wishlist_all", vo);
	}



	// 찜 삭제
	@Override
	public int delete_wishlist(WishListVO vo) {
		
		int result = sqlSession.delete("org.java.MemberMapper.delete_wishlist", vo);
		return result;
		
	}


	// 장바구니 추가
	@Override
	public int add_to_cart(CartVO vo) {
		int result = sqlSession.insert("org.java.MemberMapper.add_to_cart", vo);
		return result;
	}
	
	// 장바구니 리스트
	@Override
	public List<CartVO> shopping_cart(CartViewVO vo) {
		List<CartVO> result = sqlSession.selectList("org.java.MemberMapper.shopping_cart", vo);
		return result;
	}

	// 장바구니 중복 확인
	@Override
	public int alreadyInCartList(CartVO vo) {
		int result = sqlSession.selectOne("org.java.MemberMapper.alreadyInCartList", vo);
		System.out.println(result);
		return result;

	}

	// 장바구니 수량 올리기
	@Override
	public int plusCartCnt(CartVO vo) {
		int result = sqlSession.update("org.java.MemberMapper.plusCartCnt", vo);
		return result;
	}
	
	// 장바구니 수량 올리기
	@Override
	public int minusCartCnt(CartVO vo) {
		int result = sqlSession.update("org.java.MemberMapper.minusCartCnt", vo);
		return result;
	}


	// 장바구니 총합
	@Override
	public String cartTotal(CartVO vo) {
		String result = sqlSession.selectOne("org.java.MemberMapper.cart_total", vo);
		//System.out.println("DAO" + result);
		return result;
	}
	
	// 장바구니 삭제 : 이미지 클릭 시 삭제
	@Override
	public int removeCartItem(CartVO vo) {
		int result = sqlSession.delete("org.java.MemberMapper.removeCartItem", vo);
		return result;
	}
	
	// 세션 아이디에 해당하는 회원정보 가져오기
	public MemberVO memberInfo(MemberVO vo) {
		MemberVO result = sqlSession.selectOne("org.java.MemberMapper.member-info", vo);
		return result;
	}

	// 주문 내역 넣기
	@Override
	public int insertOrder(OrderVO ovo) {
		System.out.println(ovo);
		return sqlSession.insert("org.java.MemberMapper.insertOrder", ovo);
		
	}

	// 결제 내역 넣기
	@Override
	public int insertPayInfo(PayInfoVO pvo) {
		return sqlSession.insert("org.java.MemberMapper.insertPayInfo", pvo);
		
	}

	// 주문 아이템 넣기
	@Override 
	public int insertOrderItem(OrderItemVO oivo) { 
		return sqlSession.insert("org.java.MemberMapper.insertOrderItem", oivo);
	}
	
	// 결제 후 장바구니 모두 삭제
	@Override
	public int cartAllDelete(CartVO vo) {
		return sqlSession.delete("org.java.MemberMapper.cartAllDelete", vo);
	}

	 
	

	
	
	


}
