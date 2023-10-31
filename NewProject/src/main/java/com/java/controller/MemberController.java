package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.domain.MemberVO;
import com.java.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl memberService;
	
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return step;
	}
	
	@RequestMapping("/join_do")
	public String join(MemberVO vo) {
		memberService.insertMember(vo);
		return "login";
	}
	
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
	

}
