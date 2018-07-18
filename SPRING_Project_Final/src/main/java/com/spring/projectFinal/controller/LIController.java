package com.spring.projectFinal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LIController {

	//도서관 컨트롤러
		
	@RequestMapping("library")
	public String library(HttpServletRequest req,Model model) {
		
		System.out.println("library-도서관 홈");
		return "library/lib_main";
	}
	
	
}
