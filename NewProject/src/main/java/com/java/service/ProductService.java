package com.java.service;

import java.util.List;

import com.java.domain.FstDivVO;
import com.java.domain.ImageVO;
import com.java.domain.OptionVO;
import com.java.domain.ProductVO;
import com.java.domain.SndDivVO;
import com.java.domain.TrdDivVO;


public interface ProductService {

	
	// 대분류 정보 가져오기
	public List<FstDivVO> select_FstCate(FstDivVO vo);
	
	// 중분류 정보 가져오기
	public List<SndDivVO> select_SndCate(SndDivVO vo);
	
	// 소분류 정보 가져오기
	public List<TrdDivVO> select_TrdCate(TrdDivVO vo);
	
	// 상품 등록하기
	public int product_insert(ProductVO vo);
	
	// 상품 이미지 등록하기
	public int upload_image(ImageVO vo);
	
	// 상품 조회
	public List<ProductVO> product_all(ProductVO vo);
	
	// 상품 상세 정보
	public ProductVO product_detail(String p_selid);
	
	// 상품 상세 정보 옵션 가져오기
	public List<OptionVO> product_option(String p_selid);
	
}
