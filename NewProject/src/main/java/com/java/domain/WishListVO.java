package com.java.domain;

import lombok.Data;

@Data
public class WishListVO {	  // 찜하기		- wishlist
	
	private String wishcode;  // 찜 코드		- wishcode
	private String m_id;	  // 회원ID		- m_id
	private String p_selid;	  // 상품ID		- p_selid
	private String p_name;	  // 상품이름		- p_name
	private String p_price;	  // 상품가격		- p_price
	private String p_finalID; // 최종ID		- p_finalID

}
