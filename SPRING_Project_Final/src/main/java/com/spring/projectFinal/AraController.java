package com.spring.projectFinal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.projectFinal.controller.SMController;
import com.spring.projectFinal.service.SMService;

@Controller
public class AraController {

	@Autowired
	SMService service;

	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(SMController.class);

	@RequestMapping("ara")
	public String ara(HttpServletRequest req, Model model) {
		System.out.println("arauniversity-아라대 홈");
		return "common/ara_main";
	}

	@RequestMapping("admission")
	public String admission(HttpServletRequest req, Model model) {
		System.out.println("admission-원서접수");
		return "common/admission";
	}

	// 입학신청서 폼
	@RequestMapping("application")
	public String application(HttpServletRequest req, Model model) {
		System.out.println("application-입학지원서");
		return "common/application";
	}

	// 신청확인
	@RequestMapping(value = "appPro", method = RequestMethod.POST)
	public String appPro(MultipartHttpServletRequest req, Model model) {
		int chkCnt = service.juminChk(req, model);
		if (chkCnt == 0) {
			service.appPro(req, model);
		}
		return "common/applicationPro";
	}

	// 합격자조회 페이지
	@RequestMapping("chk")
	public String chk(HttpServletRequest req, Model model) {
		logger.info("chk()");
		return "student/2_st_applicantsCheck";
	}

	// 합격자 조회 버튼 - 이름, 주민등록번호 확인
	@RequestMapping("confirmJumin")
	public String confirmJumin(HttpServletRequest req, Model model) {
		logger.info("confirmJumin()");
		service.passChkPro(req, model);
		return "student/2_st_applicantsCheckPro";
	}

	// 합격자조회후 페이지
	@RequestMapping("chk2")
	public String chk2(HttpServletRequest req, Model model) {
		logger.info("chk2()");
		/*service.st_profile(req, model);*/
		return "student/2_st_applicantsResult";
	}
}
