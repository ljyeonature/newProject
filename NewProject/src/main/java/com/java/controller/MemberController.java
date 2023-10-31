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
public class MemberController {
	
	@Autowired
	MemberServiceImpl memberService;
	
	// 단순 페이지 이동
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return step;
	}
	
	// 회원가입 하고 login 페이지로 이동
	@RequestMapping("/join_do")
	public String join(MemberVO vo) {
		memberService.insertMember(vo);
		return "login";
	}
	
	// 아이디 중복확인
	@RequestMapping("/check_Id")
	@ResponseBody
	public String checkId(MemberVO vo) {
		//System.out.println(vo.toString());
		boolean is_Id = memberService.checkId(vo);
		//System.out.println(is_Id);
		if(is_Id) {
			return "duplicate";
		}else {			
			return "available";
		}
	}
	
	// 로그인 확인 후 정보 없으면 login 페이지 / 있으면 세션에 logname으로 아이디 저장
	// 관리자 로그인 : admin / admin1234 일 때만	
	@RequestMapping("/login_do")
	public String loginCheck(MemberVO vo, HttpSession session) {
		MemberVO result = memberService.loginCheck(vo);
		MemberVO adminResult = memberService.adminCheck(vo);
		System.out.println("Controller : " + adminResult);
		System.out.println(result.getM_name());
		
		if(result == null) {
			return "login";
		} else if(result != null && adminResult != null) { 
			session.setAttribute("logname", result.getM_name());
			return "admin-index";
		}
		else {
			session.setAttribute("logname", result.getM_name());
			return "home";
		}
	}
	
	
	
	// 세션 로그아웃
	@RequestMapping("/logout_do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "home";
	}
	
	// 관리자 홈에서 회원 정보 불러오기
	@RequestMapping("/admin-index")
	public void memeber_all(MemberVO vo, Model model) {
		System.out.println("Controller : " + vo.toString());
		System.out.println("controller : " + memberService.member_all(vo));
		model.addAttribute("memberList", memberService.member_all(vo));
		
	}
	
	
	
	
	
	
	

	

}
