package com.java.repository;

import java.util.List;

import com.java.domain.FstDivVO;
import com.java.domain.ImageVO;
import com.java.domain.OptionFinalVO;
import com.java.domain.OptionVO;
import com.java.domain.OrderVO;
import com.java.domain.ProductVO;
import com.java.domain.SndDivVO;
import com.java.domain.TrdDivVO;

public interface ProductDAO {
	
	
	// 대분류 정보 가져오기
	public List<FstDivVO> select_FstCate(FstDivVO vo);
	
	// 중분류 정보 가져오기
	public List<SndDivVO> select_SndCate(SndDivVO vo);
	
	// 소분류 정보 가져오기
	public List<TrdDivVO> select_TrdCate(TrdDivVO vo);
	
	//-------------------------------------------------------------
	//------------------상철이형---------------------------------------
	//상품등록수정
	
	// 대분류 정보 가져오기
    public List<FstDivVO> select_FstCate2(FstDivVO vo);
    
    // 중분류 정보 가져오기
    public List<SndDivVO> select_SndCate2(SndDivVO vo);
    
    // 소분류 정보 가져오기
    public List<TrdDivVO> select_TrdCate2(TrdDivVO vo);
    
	//-------------------------------------------------------------
	//------------------상철이형---------------------------------------
	
	
	// 상품 등록
	public int product_insert(ProductVO vo);
	
	// 상품 이미지 등록하기
	public int upload_image(ImageVO vo);
	
	// 상품 조회
	public List<ProductVO> product_all(ProductVO vo);
	
	// 대분류 검색 - 물고기
	public List<ProductVO> fishAll(ProductVO vo);
	
	// 상품 상세 정보
	public ProductVO product_detail(String p_selid);
	
	// 상품 상세 정보 옵션 가져오기
	public List<OptionVO> product_option(String p_selid);
	

	
	// 상품수정불러오기
	public ProductVO productView(ProductVO vo);
	
	//옵션 정보 가져오기
	public List<OptionVO> product_option(OptionVO vo);
	
	// 옵션 등록하기
	public int insertProduct(OptionFinalVO vo);
	
	//stock 옵션 정보 가져오기
	public List<OptionVO> stock_option(OptionVO vo);
	
	// 옵션 재고 등록하기
	public int updateOption(OptionFinalVO vo);
	
	//옵션 재고 불러오기
	public List<OptionFinalVO> opcollect(OptionFinalVO vo);
	
	// 상품 삭제
	public int deleteProduct(ProductVO vo);
	
	//재고관리에 등록된 상품 불러오기
	public List<ProductVO> product_optionList(ProductVO vo);

	// 주문게시판 리스트 불러오기
	public List<OrderVO> order_all(OrderVO vo);

	// 가격 검색
	public List<ProductVO> priceAll(ProductVO vo);

	List<ProductVO> colorAll(ProductVO vo);
	
	
}
