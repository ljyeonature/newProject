package com.java.domain;

import lombok.Data;

@Data
public class ProductVO {			// 상품
	
	private String p_id;			// 상품ID				- p_id
	private String p_category;		// 상품분류(구피)		- p_category
	private String p_subcate;		// 세부분류(골드구피헤드)	- p_subcate
	private String p_name;			// 상품명				- p_name
	private String p_price;			// 상품가격				- p_price
	private String p_description;	// 상품상세설명			- p_description
	private String p_care;			// 상품사육방법설명		- p_care
	private String p_image;			// 상품이미지파일			- p_image
	

}
