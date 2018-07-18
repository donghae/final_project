package com.spring.projectFinal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AraController {

	@RequestMapping("ara")
	public String ara(HttpServletRequest req,Model model) {
		
		System.out.println("arauniversity-아라대 홈");
		return "common/ara_main";
	}
	
	@RequestMapping("admission")
	public String admission(HttpServletRequest req,Model model) {
		
		System.out.println("admission-원서접수");
		return "common/admission";
	}
}
