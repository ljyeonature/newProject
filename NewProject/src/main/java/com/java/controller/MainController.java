package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.domain.BoardVO;
import com.java.domain.OptionVO;
import com.java.domain.ProductVO;
import com.java.domain.WishListVO;
import com.java.service.BoardServiceImpl;
import com.java.service.MemberServiceImpl;
import com.java.service.ProductService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	MemberServiceImpl memberService;

	@Autowired
	BoardServiceImpl boardService;

	@Autowired
	ProductService productService;

	// 단순 페이지 이동
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "main/" + step;
	}


	//QnA게시판 게시글 목록

	@RequestMapping("/qna")
	public void getListload(BoardVO vo, Model model) 
	{ 
		List<BoardVO> result = boardService.board_all(vo); 
		model.addAttribute("qnaList", result);

	}

	// 상품 페이지
	@RequestMapping("/product")
	public void product_all(ProductVO vo, Model model) {
		model.addAttribute("productAll",productService.product_all(vo));
	}

	// 상품상세정보 보기
	@RequestMapping("/product-detail")
	public void product_detail(Model model, @RequestParam String p_selid, WishListVO wvo) {
		//System.out.println(p_selid);
		ProductVO result = productService.product_detail(p_selid);
		List<OptionVO> option = productService.product_option(p_selid);
		//System.out.println(result.toString());
		model.addAttribute("productDetail", result);
		model.addAttribute("productOption", option);
	}


}
