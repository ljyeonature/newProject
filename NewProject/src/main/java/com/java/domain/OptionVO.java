package com.java.domain;

import lombok.Data;

@Data
public class OptionVO {			// 상품옵션		-p_option
		
	private String p_optionID;	// 옵션ID		- p_optionID
	private String p_id;		// 상품ID		- p_id
	private String o_name;		// 옵션명		- o_name
	private String p_stock;		// 상품재고		- p_stock

}
