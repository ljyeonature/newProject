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
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	MemberServiceImpl memberService;
	
	// 단순 페이지 이동
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "main/" +step;
	}
	

	
	

	
	
	
	
	
	
	

	

}
