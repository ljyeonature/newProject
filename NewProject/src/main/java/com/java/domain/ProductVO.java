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
	private String p_imgrn;			// 상품이미지파일(실제파일명)	- p_imgrn
	private long   p_imgsz;			// 상품이미지파일(파일크기)	- p_imgsz
	private String m_id;
	private String fstdivid;		// F / D /E
	private String search;     		// 검색어
	
	
	private String img1_n;			// 상품이미지파일(업로드용)	- p_imgn
	private String img1_rn;			// 상품이미지파일(실제파일명)		- p_imgrn
	private long   img1_sz;			// 상품이미지파일(파일크기)	- p_imgsz
	
	private String img2_n;			// 상품이미지파일(업로드용)	- p_imgn
	private String img2_rn;			// 상품이미지파일(실제파일명)		- p_imgrn
	private long   img2_sz;			// 상품이미지파일(파일크기)	- p_imgsz

	private String img3_n;			// 상품이미지파일(업로드용)	- p_imgn
	private String img3_rn;			// 상품이미지파일(실제파일명)		- p_imgrn
	private long   img3_sz;			// 상품이미지파일(파일크기)	- p_imgsz

	private String img4_n;			// 상품이미지파일(업로드용)	- p_imgn
	private String img4_rn;			// 상품이미지파일(실제파일명)		- p_imgrn
	private long   img4_sz;			// 상품이미지파일(파일크기)	- p_imgsz

	private String img5_n;			// 상품이미지파일(업로드용)	- p_imgn
	private String img5_rn;			// 상품이미지파일(실제파일명)		- p_imgrn
	private long   img5_sz;			// 상품이미지파일(파일크기)	- p_imgsz

	private String img6_n;			// 상품이미지파일(업로드용)	- p_imgn
	private String img6_rn;			// 상품이미지파일(실제파일명)		- p_imgrn
	private long   img6_sz;			// 상품이미지파일(파일크기)	- p_imgsz
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
	   
	    MultipartFile file1; //★★★★★ type='file'과 name명 동일
		MultipartFile file2; //★★★★★ type='file'과 name명 동일
		MultipartFile file3; //★★★★★ type='file'과 name명 동일
		MultipartFile file4; //★★★★★ type='file'과 name명 동일
		MultipartFile file5; //★★★★★ type='file'과 name명 동일
		MultipartFile file6; //★★★★★ type='file'과 name명 동일
	   
	// 1
	    public void setFile1(MultipartFile file1) {
	      this.file1 = file1;
	      
	      // 업로드 파일이 있는 경우
	      if( !file1.isEmpty() ) {
	         this.img1_n     = file1.getOriginalFilename();
	         this.img1_sz     = file1.getSize();
	
	         // 실제 저장된 파일명 만들기
	         UUID uuid = UUID.randomUUID();
	         this.img1_rn = uuid.toString() + "_" + img1_n;
	         
	         
	         // 실제파일 저장
	         // 추후에 웹서버 경로를 찾아서 수정
	         // 자신의 프로젝트 파일 경로로 적기
	         File f1 = new File("C:/Users/이지연/git/newProject/NewProject/src/main/webapp/resources/productImages/productDetailImages/" + img1_rn);
	         
	         
	         try {
	            file1.transferTo(f1);
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	 // 2
	    public void setFile2(MultipartFile file2) {
	      this.file2 = file2;
	      
	      // 업로드 파일이 있는 경우
	      if( !file2.isEmpty() ) {
	         this.img2_n     = file2.getOriginalFilename();
	         this.img2_sz     = file2.getSize();
	
	         // 실제 저장된 파일명 만들기
	         UUID uuid = UUID.randomUUID();
	         this.img2_rn = uuid.toString() + "_" + img2_n;
	         
	         
	         // 실제파일 저장
	         // 추후에 웹서버 경로를 찾아서 수정
	         // 자신의 프로젝트 파일 경로로 적기
	         File f2 = new File("C:/Users/이지연/git/newProject/NewProject/src/main/webapp/resources/productImages/productDetailImages/" + img2_rn);
	         
	         
	         try {
	            file2.transferTo(f2);
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	    
	    // 3
	    public void setFile3(MultipartFile file3) {
	      this.file3 = file3;
	      
	      // 업로드 파일이 있는 경우
	      if( !file3.isEmpty() ) {
	         this.img3_n     = file3.getOriginalFilename();
	         this.img3_sz     = file3.getSize();
	
	         // 실제 저장된 파일명 만들기
	         UUID uuid = UUID.randomUUID();
	         this.img3_rn = uuid.toString() + "_" + img3_n;
	         
	         
	         // 실제파일 저장
	         // 추후에 웹서버 경로를 찾아서 수정
	         // 자신의 프로젝트 파일 경로로 적기
	         File f3 = new File("C:/Users/이지연/git/newProject/NewProject/src/main/webapp/resources/productImages/productDetailImages/" + img3_rn);
	         
	         
	         try {
	            file3.transferTo(f3);
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	    
	    // 4
	    public void setFile4(MultipartFile file4) {
	      this.file4 = file4;
	      
	      // 업로드 파일이 있는 경우
	      if( !file4.isEmpty() ) {
	         this.img4_n     = file4.getOriginalFilename();
	         this.img4_sz     = file4.getSize();
	
	         // 실제 저장된 파일명 만들기
	         UUID uuid = UUID.randomUUID();
	         this.img4_rn = uuid.toString() + "_" + img4_n;
	         
	         
	         // 실제파일 저장
	         // 추후에 웹서버 경로를 찾아서 수정
	         // 자신의 프로젝트 파일 경로로 적기
	         File f4 = new File("C:/Users/이지연/git/newProject/NewProject/src/main/webapp/resources/productImages/productDetailImages/" + img4_rn);
	         
	         
	         try {
	            file4.transferTo(f4);
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	    
	    // 5
	    public void setFile5(MultipartFile file5) {
	      this.file5 = file5;
	      
	      // 업로드 파일이 있는 경우
	      if( !file5.isEmpty() ) {
	         this.img5_n     = file5.getOriginalFilename();
	         this.img5_sz     = file5.getSize();
	
	         // 실제 저장된 파일명 만들기
	         UUID uuid = UUID.randomUUID();
	         this.img5_rn = uuid.toString() + "_" + img5_n;
	         
	         
	         // 실제파일 저장
	         // 추후에 웹서버 경로를 찾아서 수정
	         // 자신의 프로젝트 파일 경로로 적기
	         File f5 = new File("C:/Users/이지연/git/newProject/NewProject/src/main/webapp/resources/productImages/productDetailImages/" + img5_rn);
	         
	         
	         try {
	            file5.transferTo(f5);
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	    
	    // 6
	    public void setFile6(MultipartFile file6) {
	      this.file6 = file6;
	      
	      // 업로드 파일이 있는 경우
	      if( !file6.isEmpty() ) {
	         this.img6_n     = file6.getOriginalFilename();
	         this.img6_sz     = file6.getSize();
	
	         // 실제 저장된 파일명 만들기
	         UUID uuid = UUID.randomUUID();
	         this.img6_rn = uuid.toString() + "_" + img6_n;
	         
	         
	         // 실제파일 저장
	         // 추후에 웹서버 경로를 찾아서 수정
	         // 자신의 프로젝트 파일 경로로 적기
	         File f6 = new File("C:/Users/이지연/git/newProject/NewProject/src/main/webapp/resources/productImages/productDetailImages/" + img6_rn);
	         
	         
	         try {
	            file6.transferTo(f6);
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	

}
