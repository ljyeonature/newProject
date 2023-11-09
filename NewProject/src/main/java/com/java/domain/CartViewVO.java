package com.java.domain;

import lombok.Data;

@Data
public class CartViewVO {			// 장바구니		- cart
	
	private String m_id;		// 회원ID		- m_id
	private int p_opnum;		// 상품 옵션번호
	private String p_id;		// 상품ID 	- p_id
	private String cart_cnt;	// 장바구니 수량	- cart_cnt
	private String p_name;		// 상품 이름
	private String p_price;		// 상품 가격
	private String o_name;		// 옵션 이름
	private String p_imgrn;		// 상품 이미지
	private String m_point;		// 회원 포인트
	private String shopping_total;	// 총합
}
