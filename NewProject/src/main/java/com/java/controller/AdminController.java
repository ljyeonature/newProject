package com.java.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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

	
	// 관리자 홈에서 회원 정보 불러오기
	@RequestMapping("/admin-index")
	public void memeber_all(MemberVO vo, Model model) {
		System.out.println("Controller : " + vo.toString());
		System.out.println("controller : " + memberService.member_all(vo));
		
		model.addAttribute("memberList", memberService.member_all(vo));
		
	}
	
	
	
	
	
	
	

	

}
