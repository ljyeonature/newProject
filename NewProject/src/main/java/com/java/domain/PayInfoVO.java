package com.java.domain;
import lombok.Data;

@Data
public class PayInfoVO {
	
	private String m_id;
	private String o_id;		// 주문상품번호	- o_id
	private String pay_by;		// 결제방식 	- pay_by
	private String pay_acc;		// 결제계좌 	- pay_acc
	private String pay_amount;	// 결제금액		- pay_amount
	private String m_name;		// 입금자명		- m_name

}
