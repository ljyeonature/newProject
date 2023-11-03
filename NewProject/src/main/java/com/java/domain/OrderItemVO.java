package com.java.domain;

import lombok.Data;

@Data
public class OrderItemVO {		// 주문상품		- order_item
	
	private String o_itemid;	// 주문상품번호	- o_itemid
	private String o_cnt;		// 주문수량		- o_cnt
	private String p_id;		// 상품ID		- p_id
	private String o_id;		// 주문번호		- o_id

}
