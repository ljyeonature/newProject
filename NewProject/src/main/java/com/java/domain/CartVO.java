package com.java.domain;

import lombok.Data;

@Data
public class CartVO {			// 장바구니		- cart
	
	private String m_id;		// 회원ID		- m_id
	private String p_optionID;		// 상품 옵션번호
	private String p_selid;		// 상품ID 	- p_id
	private String cart_cnt;	// 장바구니 수량	- cart_cnt
	private String p_name;
	private String p_price;
	private String o_name;
	private String shopping_total;
	private String cart_total;
}
