package com.spring.projectFinal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DTController {

	// 학생 기숙사 컨트롤러
	
	@RequestMapping("dormitory")
	public String dormitory(HttpServletRequest req,Model model) {
		
		System.out.println("dormitory-기숙사 홈");
		
		return "dormitory/dorm_main";
	}
	
	@RequestMapping("dormitory_history")
	public String dt_history(HttpServletRequest req,Model model) {
		
		System.out.println("dt_history-설립목적 및 연혁");
		
		return "dormitory/dt_history";
	}
	
	// 관리자 기숙사
	@RequestMapping("dormitory_admin")
	public String admin(HttpServletRequest req,Model model) {
		
		System.out.println("admin-관리자 기숙사 홈");
		
		return "dormitory/dt_admin_main";
	}	
	
	
}
