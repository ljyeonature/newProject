package com.java.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.domain.FstDivVO;
import com.java.domain.ImageVO;
import com.java.domain.OptionFinalVO;
import com.java.domain.OptionVO;
import com.java.domain.OrderVO;
import com.java.domain.ProductVO;
import com.java.domain.SndDivVO;
import com.java.domain.TrdDivVO;


//### (1) 해당 어노테이션 지정
@Repository
public class ProductDAOImpl implements ProductDAO{

	//### (2) 해당 어노테이션 지정
	@Autowired
	private SqlSessionTemplate sqlSession;


	
	// 대분류
	@Override
	public List<FstDivVO> select_FstCate(FstDivVO vo) {
		return sqlSession.selectList("org.java.ProductMapper.selectFstCate",vo);
	}



	// 중분류
	@Override
	public List<SndDivVO> select_SndCate(SndDivVO vo) {
		return sqlSession.selectList("org.java.ProductMapper.selectSndCate",vo);
	}



	// 소분류
	@Override
	public List<TrdDivVO> select_TrdCate(TrdDivVO vo) {
		return sqlSession.selectList("org.java.ProductMapper.selectTrdCate",vo);
	}

	
	//-------------------------------------------------------------
	//------------------상철이형---------------------------------------
	//상품등록수정
	
	   // 대분류
    @Override
    public List<FstDivVO> select_FstCate2(FstDivVO vo) {
       return sqlSession.selectList("org.java.ProductMapper.selectFstCate2",vo);
    }
    
    

    // 중분류
    @Override
    public List<SndDivVO> select_SndCate2(SndDivVO vo) {
       return sqlSession.selectList("org.java.ProductMapper.selectSndCate2",vo);
    }



    // 소분류
    @Override
    public List<TrdDivVO> select_TrdCate2(TrdDivVO vo) {
       return sqlSession.selectList("org.java.ProductMapper.selectTrdCate2",vo);
    }
	
	
	//-------------------------------------------------------------
	//------------------상철이형---------------------------------------

	// 상품 등록
	@Override
	public int product_insert(ProductVO vo) {
		System.out.println(vo.toString());
		int result = sqlSession.insert("org.java.ProductMapper.productInsert", vo);
		return result;
	}

	// 상품 이미지 등록하기
	@Override
	public int upload_image(ImageVO vo) {
		System.out.println("image : " + vo.toString());
		int result = sqlSession.insert("org.java.ProductMapper.uploadImage", vo);
		return result;
	}


	// 상품 불러오기
	@Override
	public List<ProductVO> product_all(ProductVO vo) {
		
		return sqlSession.selectList("org.java.ProductMapper.product_all", vo);
	}
	
	// 대분류 검색 - 물고기
	@Override
	public List<ProductVO> fishAll(ProductVO vo) {
		List<ProductVO> result = sqlSession.selectList("org.java.ProductMapper.fishAll", vo);
		return result;
	}

	// 상품 상세정보 보기
	@Override
	public ProductVO product_detail(String p_selid) {
		ProductVO result = sqlSession.selectOne("org.java.ProductMapper.product_detail", p_selid);
		
		return result;
	}


	// 상품 상세 정보 옵션 가져오기
	@Override
	public List<OptionVO> product_option(String p_selid) {
		List<OptionVO> result = sqlSession.selectList("org.java.ProductMapper.product_option", p_selid);
		return result;
	}
	


	   // 관리자페이지 수정 버튼 클릭 후 상품정보 불러오기 *상철
  @Override
 public ProductVO productView(ProductVO vo) {
    return sqlSession.selectOne("org.java.ProductMapper.productView",vo);
 }

	// 옵션
	@Override
	public List<OptionVO> product_option(OptionVO vo){
		List<OptionVO> result =  sqlSession.selectList("org.java.ProductMapper.product_option", vo);
		System.out.println(result);
		return result;
		
	}
	
	// stock 옵션 띄우
	@Override
	public List<OptionVO> stock_option(OptionVO vo){
		List<OptionVO> result =  sqlSession.selectList("org.java.ProductMapper.product_option", vo);
		System.out.println(result);
		return result;
		
	}


	// 옵션 등록
	@Override
	public int insertProduct(OptionFinalVO vo) {
		int result = sqlSession.insert("org.java.ProductMapper.insert_option", vo);
		return result;
	}
	
	//옵션 재고 등록
	@Override
	public int updateOption(OptionFinalVO vo) {
		int result = sqlSession.insert("org.java.ProductMapper.update_stock", vo);
		System.out.println(result);

		return result;
	}
	
	
	//옵션 재고 내역 띄우기
	@Override
	public List<OptionFinalVO> opcollect(OptionFinalVO vo){
		List<OptionFinalVO> result =  sqlSession.selectList("org.java.ProductMapper.opcollect", vo);

		return result;
	}
	
	
	//재고관리에 등록된 상품 불러오기
	@Override
	public List<ProductVO> product_optionList(ProductVO vo){
		List<ProductVO> result =  sqlSession.selectList("org.java.ProductMapper.product_optionList", vo);
		System.out.println(result);
		return result;

	}
	
	// 상품삭제
	@Override
	public int deleteProduct(ProductVO vo) {
      System.out.println("ProductDAOimpl vo:" + vo);
      return sqlSession.delete("org.java.ProductMapper.deleteProduct", vo);
   }

	
	//주문게시판 리스트 불러오기
	@Override
	public List<OrderVO> order_all(OrderVO vo){
		return sqlSession.selectList("org.java.ProductMapper.order_all",vo);
	}



	
	



	
}
