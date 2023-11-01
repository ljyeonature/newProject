package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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

	
	// 관리자 홈에서 회원 정보 불러오기
	@RequestMapping("/admin-index")
	public void memeber_all(MemberVO vo, Model model) {
//		System.out.println("Controller : " + vo.toString());
//		System.out.println("controller : " + memberService.member_all(vo));
		
		model.addAttribute("memberList", memberService.member_all(vo));
		
	}
	
	@RequestMapping("/point")
	public void memeber_all2(MemberVO vo, Model model) {
//		System.out.println("Controller : " + vo.toString());
//		System.out.println("controller : " + memberService.member_all(vo));
		
		model.addAttribute("memberList", memberService.member_all(vo));
		
	}
	
	@RequestMapping("/point-detail")
	public void member_point_detail(MemberVO vo, Model model) {
//		System.out.println("controller : " + memberService.member_point_detail(vo));
		model.addAttribute("memberPoint", memberService.member_point_detail(vo));
		
	}
	
	@RequestMapping("/member-point-content")
	public String member_point_content(@PathVariable String m_point, @RequestBody MemberVO vo, Model model) {
		System.out.println("포인트 수정 m_point : " + m_point);
		System.out.println(vo.getM_point());
		int result = memberService.member_point_content(vo);
		System.out.println("포인트 수정 : " + result );
		return "redirect:/point-detail/{m_id}";
	}
	
	
	
	
	
	
	
	
	

	

}
