package com.spring.projectFinal.controller;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SMController {

	int state =0;
	// 학생 메인 페이지
	@RequestMapping("st_stu")
	public String st_stu(HttpServletRequest req, Model model) {
		if(req.getParameter("state")!=null) 
			state=Integer.parseInt(req.getParameter("state"));
		req.getSession().setAttribute("state", state);
		
		if(req.getParameter("state")!=null) {
			if(Integer.parseInt(req.getParameter("state"))==1) {
				//서비스 태울 장소
			}
		}
		System.out.println("ARA university-아라대 학생페이지");
		return "student/st_main_stu";
	}

	// 교수 메인 페이지
	@RequestMapping("st_pro")
	public String st_pro(HttpServletRequest req, Model model) {
		if(req.getParameter("state")!=null) 
			state=Integer.parseInt(req.getParameter("state"));
		req.getSession().setAttribute("state", state);
		
		if(req.getParameter("state")!=null) {
			if(Integer.parseInt(req.getParameter("state"))==1) {
				//서비스 태울 장소
			}
		}
		System.out.println("ARA university-아라대 교수페이지");
		return "student/st_main_pro";
	}

	// 관리자 메인 페이지
	@RequestMapping("st_adm")
	public String st_adm(HttpServletRequest req, Model model) {
		if(req.getParameter("state")!=null) 
			state=Integer.parseInt(req.getParameter("state"));
		req.getSession().setAttribute("state", state);
		
		if(req.getParameter("state")!=null) {
			if(Integer.parseInt(req.getParameter("state"))==1) {
				//서비스 태울 장소
			}
		}
		System.out.println("ARA university-아라대 관리자페이지");
		return "student/st_main_adm";
	}
}
