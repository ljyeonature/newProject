package com.java.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.domain.BoardVO;
import com.java.domain.FstDivVO;
import com.java.domain.ImageVO;
import com.java.domain.MemberVO;
import com.java.domain.ProductVO;
import com.java.domain.SndDivVO;
import com.java.domain.TrdDivVO;
import com.java.service.BoardServiceImpl;
import com.java.service.MemberServiceImpl;
import com.java.service.ProductServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	BoardServiceImpl boardService;
	
	@Autowired
	ProductServiceImpl productService;
	
	// 단순 페이지 이동
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "admin/" + step;
	}


	
	// 세션 로그아웃
	@RequestMapping("/logout_do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "/main/home";
	}
	
	// 관리자 홈에서 회원 정보 불러오기
	@RequestMapping("/admin-index")
	public void memeber_dash(MemberVO vo, Model model) {
		System.out.println("Controller : " + vo.toString());
		System.out.println("controller : " + memberService.member_dash(vo));
		
		model.addAttribute("memberList", memberService.member_dash(vo));
		
	}
	// 전체 관리자 홈에서 회원 정보 불러오기
	@RequestMapping("/member_all")
	public void member_all(MemberVO vo, Model model) {
		List<MemberVO> member = memberService.member_all(vo);
		System.out.println("Controller :" + member.toString());
		model.addAttribute("memberList" , member);
	}
	
	@RequestMapping("/point")
	public void memeber_all2(MemberVO vo, Model model) {
//		System.out.println("Controller : " + vo.toString());
//		System.out.println("controller : " + memberService.member_all(vo));
		
		model.addAttribute("memberList", memberService.member_dash(vo));
		
	}
	
	@RequestMapping("/point-detail")
	public void member_point_detail(MemberVO vo, Model model) {
		System.out.println("controller : " + vo);
//		System.out.println("포인트 수정 p_point : " + vo.getM_point());
		model.addAttribute("memberPoint", memberService.member_point_detail(vo));
		
	}
	
//	ajax로 보내면 해당 결과값을 얘가 반환해줘야함
	@RequestMapping("/member-point-content")
	@ResponseBody
	public String member_point_content(MemberVO vo) {
		int result = memberService.member_point_content(vo);
		MemberVO point = memberService.member_point_detail(vo);
		System.out.println("포인트 수정 p_point : " + point.getM_point());
		System.out.println("포인트 수정 결과: " + result);
		if(result == 1) {
//			return point.getM_point();
			return point.getM_point();
		}
		else {
			return "error";
		}
	}
	
	
	// product_resister 페이지 들어가면 분류 내용 보내기
	@RequestMapping("/product_resister")
	public void select_cate(FstDivVO fvo, SndDivVO svo, TrdDivVO tvo, Model model) {
		
		model.addAttribute("fstcate", productService.select_FstCate(fvo));
		model.addAttribute("sndcate", productService.select_SndCate(svo));
		model.addAttribute("trdcate", productService.select_TrdCate(tvo));
		
	}
	
	// 상품 등록
	@RequestMapping("/product_insert")
	@ResponseBody
	public String product_insert( ProductVO vo) {
		int result = productService.product_insert(vo);
//		System.out.println(result);
		if(result == 1) {
			return "ok";
		} else {
			return "no";
		}
	}
	
	// 상품 등록
	@RequestMapping("/upload-image")
	@ResponseBody
	public String upload_image( ImageVO vo) {
		System.out.println("Controller : " + vo.toString());
		int result = productService.upload_image(vo);
//		System.out.println(result);
		if(result == 1) {
			return "ok";
		} else {
			return "no";
		}
	}
	
	// 상품 보여주기
	@RequestMapping("/product_all")
	public void product_all(ProductVO vo, Model model) {
		model.addAttribute("productList", productService.product_all(vo));
//		System.out.println(result);
	}
	
	/*
	 * // 옵션 등록
	 * 
	 * @RequestMapping("/option_insert") public String option_insert()
	 */

	// 게시글 제목 클릭하면 내용 불러오기
		@RequestMapping("/qnaview_do")
		public String getContentList(BoardVO vo, Model model) {
			BoardVO result = boardService.qnaView(vo);
			model.addAttribute("qnacontent" , result);
			
			return "admin/qnaview";
		}
		
		// qna게시물 수정하는 폼 들어가기
		@RequestMapping("/qnaeditForm_do")
		public String getContentForm(BoardVO vo, Model model) {
			
			BoardVO result3 = boardService.qnaView(vo);
			model.addAttribute("qnacontent" , result3);
			return "admin/qnaedit";
		}
		
		// 내용 수정하고 수정된 게시물 불러오기
		@RequestMapping("/qnaedit_do")
		public String getContentEdit(BoardVO vo, Model model) {
			
			boardService.qnaEdit(vo);
			BoardVO result2 = boardService.qnaView(vo);
			
			model.addAttribute("qnacontent" , result2);
			return "redirect:/admin/qnaview_do?q_postnum=" + result2.getQ_postnum();
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

}
