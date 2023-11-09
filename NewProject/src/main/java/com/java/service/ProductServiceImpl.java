package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.domain.FstDivVO;
import com.java.domain.ImageVO;
import com.java.domain.OptionVO;
import com.java.domain.ProductVO;
import com.java.domain.SndDivVO;
import com.java.domain.TrdDivVO;
import com.java.repository.ProductDAO;


//### (1) 해당 어노테이션 지정
@Service
public class ProductServiceImpl implements ProductService{

	// ### (2) 해당 어노테이션 지정
	@Autowired
	private ProductDAO productDAOImpl;
	
	
	// 대분류 목록
	@Override
	public List<FstDivVO> select_FstCate(FstDivVO vo){
		List<FstDivVO> result = productDAOImpl.select_FstCate(vo);
		return result;
	}


	// 중분류 목록
	@Override
	public List<SndDivVO> select_SndCate(SndDivVO vo) {
		List<SndDivVO> result = productDAOImpl.select_SndCate(vo);
		return result;
	}


	// 소분류 목록
	@Override
	public List<TrdDivVO> select_TrdCate(TrdDivVO vo) {
		List<TrdDivVO> result = productDAOImpl.select_TrdCate(vo);
		// TODO Auto-generated method stub
		return result;
	}


	// 상품 등록
	@Override
	public int product_insert(ProductVO vo) {
		int result = productDAOImpl.product_insert(vo);
		return result;
	}

	
	// 상품 이미지 등록
	@Override
	public int upload_image(ImageVO vo) {
		int result = productDAOImpl.upload_image(vo);
		return result;
	}

	// 상품 모두 불러오기
	@Override
	public List<ProductVO> product_all(ProductVO vo) {
		return productDAOImpl.product_all(vo);
		
	}
	// 상품 상세정보
	@Override
	public ProductVO product_detail(String p_selid) {
		ProductVO result = productDAOImpl.product_detail(p_selid);
		return result;
	}

	// 상품 상세 정보 옵션 가져오기
	@Override
	public List<OptionVO> product_option(String p_selid) {
		List<OptionVO> result = productDAOImpl.product_option(p_selid);
		
		return result;
	}
	
	// 상품 삭제
	@Override
	public int deleteProduct(ProductVO vo){
	    System.out.println("ProductServiceImpl Vo:" + vo);
	    return productDAOImpl.deleteProduct(vo);
	}

	
}
