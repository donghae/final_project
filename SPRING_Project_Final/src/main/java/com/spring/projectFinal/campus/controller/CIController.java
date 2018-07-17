package com.spring.projectFinal.campus.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CIController {

	@RequestMapping("ara")
	public String ara(HttpServletRequest req,Model model) {
		
		System.out.println("arauniversity");
		return "common/ara_main";
	}
	
	@RequestMapping("admission")
	public String admission(HttpServletRequest req,Model model) {
		
		System.out.println("admission");
		return "admission/admission";
	}
}
