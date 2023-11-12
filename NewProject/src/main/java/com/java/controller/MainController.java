package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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


	// 상품 페이지
	@RequestMapping("/product")
	public void product_all(ProductVO vo, Model model, String search) {
		ProductVO pvo = new ProductVO();
		pvo.setSearch(search);
		
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
	
	// 대분류 검색 - 물고기
	@RequestMapping("/fishAll")
	@ResponseBody
	public List<ProductVO> fishAll(ProductVO vo, Model model) {
		System.out.println("alreadyInCartList : "+ vo.toString());
		List<ProductVO> result = productService.fishAll(vo);
		System.out.println("alreadyInCartList : "+ result.toString());
		return result;
	}
	
	// qna게시판 목록 조회
	@RequestMapping("/qna")
	public String board_all(Model model, String sltfilter, String search, @RequestParam(defaultValue = "1") int page) {
		
		BoardVO vo = new BoardVO();
		vo.setSltfilter(sltfilter);
		vo.setSearch(search);
		
		// boardService를 사용하여 모든 QnA 게시물을 가져옵니다.
		List<BoardVO> allQna = boardService.board_all(vo);
		
		// PagedListHolder를 사용하여 페이징된 목록을 생성합니다.
		PagedListHolder<BoardVO> qnaListPage = new PagedListHolder<BoardVO>(allQna);
		// 한 페이지당 표시할 항목 수를 설정합니다.
		qnaListPage.setPageSize(5);
		
		// 요청에서 받은 페이지 번호에 따라 현재 페이지를 설정합니다. (0부터 시작)
		qnaListPage.setPage(page - 1);
		// 현재 페이지에 표시할 게시물 목록을 가져옵니다.
		List<BoardVO> result = qnaListPage.getPageList();
		
		// 가져온 게시물 목록과 페이지 정보를 모델에 추가하여 뷰로 전달합니다.
	    model.addAttribute("qnaList", result);
	    model.addAttribute("maxPages", qnaListPage.getPageCount());	//전체페이지수
	    model.addAttribute("currentPages", qnaListPage.getPage() + 1);	//현재페이지
	    
	    return "main/qna";
	}
}
