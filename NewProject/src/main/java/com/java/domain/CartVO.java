package com.java.domain;

import lombok.Data;

@Data
public class CartVO {			// 장바구니		- cart
	
	private String m_id;		// 회원ID		- m_id
//	private int p_opnum;		// 상품 옵션번호
	private String p_id;		// 상품ID 	- p_id
	private String cart_cnt;	// 장바구니 수량	- cart_cnt
	private String p_name;
	private String p_price;
	private String o_name;
	private String shopping_total;
}
