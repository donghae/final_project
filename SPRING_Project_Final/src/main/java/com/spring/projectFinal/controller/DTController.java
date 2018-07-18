package com.spring.projectFinal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DTController {

	//기숙사 컨트롤러
	
	@RequestMapping("dormitory")
	public String dormitory(HttpServletRequest req,Model model) {
		
		System.out.println("dormitory-기숙사 홈");
		return "dormitory/dorm_main";
	}
}
