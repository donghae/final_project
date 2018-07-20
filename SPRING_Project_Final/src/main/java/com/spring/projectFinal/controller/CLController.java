package com.spring.projectFinal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CLController {

	//사이버강의 컨트롤러
	@RequestMapping("cy_main")
	public String cy_main(HttpServletRequest req, Model model) {
		
		System.out.println("cy_main");
		return "cyber/cy_main";
	}
	@RequestMapping("cy_comm")
	public String cy_comm(HttpServletRequest req, Model model) {
		
		return "cyber/cy_comm";
	}
	@RequestMapping("cy_add")
	public String cy_add(HttpServletRequest req, Model model) {
		
		return "cyber/cy_add";
	}
	
}
