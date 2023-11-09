package com.java.domain;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {			// 상품
	
	private String p_selid;			// 판매게시물상품ID(구피)	- p_selid
	private String p_name;			// 상품명				- p_name
	private String p_price;			// 상품가격				- p_price
	private String p_description;	// 상품상세설명			- p_description
	private String p_care;			// 상품사육방법설명		- p_care
	private String p_imgn;			// 상품이미지파일(업로드용)	- p_imgn
	private String p_imgrn;			// 상품이미지파일(실제파일명)		- p_imgrn
	private long   p_imgsz;			// 상품이미지파일(파일크기)	- p_imgsz
	
	//*************************************************

	   MultipartFile file; //★★★★★ type='file'과 name명 동일
	   
	   public void setFile(MultipartFile file) {
	      this.file = file;
	      
	      // 업로드 파일이 있는 경우
	      if( !file.isEmpty() ) {
	         this.p_imgn     = file.getOriginalFilename();
	         this.p_imgsz     = file.getSize();
	         
	         // 실제 저장된 파일명 만들기
	         UUID uuid = UUID.randomUUID();
	         this.p_imgrn = uuid.toString() + "_" + p_imgn;
	         
	         // 실제파일 저장
	         // 추후에 웹서버 경로를 찾아서 수정
	         // 자신의 프로젝트 파일 경로로 적기
	         File f = new File("C:/Users/이지연/git/newProject/NewProject/src/main/webapp/resources/productImages/" + p_imgrn);
	         
	         try {
	            file.transferTo(f);
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	

}
