package com.java.domain;

import lombok.Data;

@Data
public class BoardVO {
	
	private int q_postnum;			//글번호

	private String m_id;			//작성자이름

	private String q_title;			//qna제목
	private String q_content;		//qna내용
	private String q_pass;			//qna비밀번호
	private String q_date;			//qna등록날짜
	private int q_count;			//qna조회수
	private String q_answertitle;	//답글제목
	private String q_answercontent;	//답글내용
	private String q_inquiry;		//문의유형
	private String p_inq_type;		//제품문의유형
	
	private String q_product;
	
	private String sltfilter;  // 검색 필터
	private String search;     // 검색어
	
}
