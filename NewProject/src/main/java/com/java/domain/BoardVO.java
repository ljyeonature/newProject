package com.java.domain;

import lombok.Data;

@Data
public class BoardVO {
	
	private int q_postnum;			//글번호
	private String q_title;			//qna제목
	private String q_content;		//qna내용
	private String q_pass;			//qna비밀번호
	private String q_date;			//qna등록날짜
	private String q_count;			//qna조회수
	private String q_answertitle;	//답글제목
	private String q_answercontent;	//답글내용
	private String q_inquiry;		//문의유형
	private String q_image;			//이미지
	
}
