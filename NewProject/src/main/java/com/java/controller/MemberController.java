package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	/*
	 * @RequestMapping("login") public void login() { };
	 * 
	 * @RequestMapping("join") public void join() { };
	 * 
	 * @RequestMapping("product") public void product() { };
	 */
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return step;
	}
	
	

}
