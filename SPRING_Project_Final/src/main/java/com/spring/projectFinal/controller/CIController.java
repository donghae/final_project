package com.spring.projectFinal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CIController {

	//캠퍼스 컨트롤러
	
	//스쿨버스 정보
	@RequestMapping("bus_list")
	public String bus_list(HttpServletRequest req,Model model) {
		
		System.out.println("bus_list-스쿨버스 목록");
		return "campus/bus_list";
	}
	
	//동아리 정보
	@RequestMapping("circle_list")
	public String circle_list(HttpServletRequest req,Model model) {
		
		System.out.println("circle_list-동아리 목록");
		return "campus/circle_list";
	}
	
	//학식 식단표 
	@RequestMapping("st_dietary_chart")
	public String st_dietary_chart(HttpServletRequest req,Model model) {
		
		System.out.println("st_dietary_chart-학식 식단표");
		return "campus/st_dietary_chart";
	}
	
}
