package com.java.domain;

import lombok.Data;

@Data
public class OptionFinalVO {		// 파이널옵션			-final_op
		
	private int p_opnum;			// 일련번호(파이널옵션)	- p_opnum
	private String p_selid;			// 판매게시물상품 ID	- p_selid
	private String p_optionID;		// 상품ID(최종)		- p_option
	private String o_name;
	private String p_stock;

}
