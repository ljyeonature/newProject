package com.java.domain;

import lombok.Data;

@Data
public class OrderVO {
	
	private String o_id;		// 주문상품번호	- o_id
	private String m_id;		// 회원아이디 	- m_id
	private String o_date;		// 주문날짜		- o_date
	private String o_status;	// 주문상태		- o_status
	private String rc_name;		// 수령자명		- rc_name
	private String rc_tel;		// 수령자번호	- rc_tel
	private String rc_postcode;	// 수령자우편번호	- rc_postcode
	private String rc_addr;		// 수령자주소	- rc_addr
	private String pay_amount;	// 주문수량		- pay_amount
	private String pay_by;		// 주문방법		- pay_by
	private String product_name; 	//DB엔 없는 제품명 (오더서치용)

}
