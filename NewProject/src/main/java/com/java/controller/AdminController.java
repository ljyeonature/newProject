package com.java.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.domain.MemberVO;
import com.java.service.MemberServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	MemberServiceImpl memberService;
	
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
	
	
	
	
	
	
	
	
	

	

}
