package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.domain.BoardVO;
import com.java.domain.ProductVO;
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
	  
		@RequestMapping("/product")
		public void product_all(ProductVO vo, Model model) {
			System.out.println(1);
			model.addAttribute("productAll",productService.product_all(vo));
		}
	 

}
