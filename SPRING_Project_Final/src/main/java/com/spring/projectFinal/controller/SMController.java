package com.spring.projectFinal.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.projectFinal.service.SMService;

@Controller
public class SMController {

	int st_state = 0;

	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(SMController.class);

	@Autowired
	SMService service;

	// 학생 메인 페이지
	@RequestMapping("st_stu")
	public String st_stu(HttpServletRequest req, Model model) {
		if (req.getParameter("st_state") != null)
			st_state = Integer.parseInt(req.getParameter("st_state"));
		req.getSession().setAttribute("st_state", st_state);

		if (req.getParameter("st_state") != null) {
			// 학적 관리 > 기본 학적
			if (Integer.parseInt(req.getParameter("st_state")) == 10) {
				service.st_profile(req, model);
			}
			// 수업관리 > 시간표
			if (Integer.parseInt(req.getParameter("st_state")) == 21) {
				service.st_timetable(req, model);
			}

			// 수업관리 > 내 강의실 > 강의목록
			if (Integer.parseInt(req.getParameter("st_state")) == 11) {
				service.st_lectureList(req, model);
			}
			
			// 수업관리 > 수강 계획 도우미
			if (Integer.parseInt(req.getParameter("st_state")) == 13) {
				service.lectureList(req, model);
			}

			// 수업관리 > 내 강의실 > 강의목록 > 출결현황
			if (Integer.parseInt(req.getParameter("st_state")) == 19) {
				service.st_attendList(req, model);
				String lec_name = req.getParameter("lec_name");
				req.setAttribute("lec_name", lec_name);
			}

			// 성적관리 > ①금학기 성적 조회
			if (Integer.parseInt(req.getParameter("st_state")) == 15) {

				String semester = req.getParameter("semester");
				req.setAttribute("semester", semester);
				service.st_gpaList(req, model);
			}

			// 장학금관리 > ①장학금 신청
			if (Integer.parseInt(req.getParameter("st_state")) == 16) {
				service.st_scholarAppli(req, model);
			}

			// 장학금관리 > ②장학금 수여 내역 조회
			if (Integer.parseInt(req.getParameter("st_state")) == 17) {
			}
			System.out.println("ARA university-아라대 학생페이지");
		}
		return "student/st_main_stu";
	}

	// 교수 메인 페이지
	@RequestMapping("st_pro")
	public String st_pro(HttpServletRequest req, Model model) {
		if (req.getParameter("st_state") != null)
			st_state = Integer.parseInt(req.getParameter("st_state"));
		req.getSession().setAttribute("st_state", st_state);

		if (req.getParameter("st_state") != null) {
			if (Integer.parseInt(req.getParameter("st_state")) == 1) {
				// 서비스 태울 장소
			}
		}
		System.out.println("ARA university-아라대 교수페이지");
		return "student/st_main_pro";
	}

	// 관리자 메인 페이지
	@RequestMapping("st_adm")
	public String st_adm(HttpServletRequest req, Model model) {
		if (req.getParameter("st_state") != null)
			st_state = Integer.parseInt(req.getParameter("st_state"));
		req.getSession().setAttribute("st_state", st_state);

		if (req.getParameter("st_state") != null) {
			if (Integer.parseInt(req.getParameter("st_state")) == 1) {
				// 서비스 태울 장소
			}
			// 입학신청서조회
			if (Integer.parseInt(req.getParameter("st_state")) == 5) {
				service.applyList(req, model);
			}
			// 합격자목록
			if (Integer.parseInt(req.getParameter("st_state")) == 6) {
				service.applyPassList(req, model);
			}
			// 추가합격자 승인목록
			if (Integer.parseInt(req.getParameter("st_state")) == 7) {
				service.applyExtraList(req, model);
			}
			// 강의목록,검색
			if (Integer.parseInt(req.getParameter("st_state")) == 8) {
				service.lectureList(req, model);
			}
			// 강의 추가
			if (Integer.parseInt(req.getParameter("st_state")) == 9) {
			}
			// 강의 추가
			if (Integer.parseInt(req.getParameter("st_state")) == 100) {
				int lec_no = Integer.parseInt(req.getParameter("lec_no"));
				req.setAttribute("lec_no", lec_no);
				service.lectureModi(req, model);
			}
		}
		System.out.println("ARA university-아라대 관리자페이지");
		return "student/st_main_adm";
	}

	// 신청자 승인버튼
	@RequestMapping("applicationPro")
	public String applicationPro(HttpServletRequest req, Model model) {
		System.out.println("신청자 승인하기");
		service.recognize(req, model);
		int major = Integer.parseInt(req.getParameter("major"));
		req.setAttribute("major", major);
		return "student/st_admin/2_st_ad_applicationPro";
	}

	// 담당 교수 검색하기
	@RequestMapping("searchProf")
	public String searchProf(HttpServletRequest req, Model model) {
		logger.info("searchProf()");
		service.searchProf(req, model);
		return "student/st_admin/3_st_ad_searchProf";
	}

	// 학적 관리 > 기본 학적 - 정보수정 처리
	@RequestMapping("StModiPro")
	public String StModiPro(HttpServletRequest req, Model model) {
		logger.info("StModiPro()");
		service.st_profileModiPro(req, model);
		return "student/4_st_modiPro";
	}

	// 강의 추가-등록버튼
	@RequestMapping("lecturePro")
	public String lecturePro(HttpServletRequest req, Model model) {
		logger.info("lecturePro()");
		service.lecturePlus(req, model);
		return "student/st_admin/3_st_ad_lecturePro";
	}

	// 강의 수정 버튼
	@RequestMapping("modiPro")
	public String modiPro(HttpServletRequest req, Model model) {
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		req.setAttribute("lec_no", lec_no);
		logger.info("modiPro()");
		service.lectureModiPro(req, model);
		return "student/st_admin/3_st_ad_modiPro";
	}

	// 삭제 처리 페이지
	@RequestMapping("deletePro")
	public String deleteLePro(HttpServletRequest req, Model model) {
		logger.info("deletePro()");
		service.deletePro(req, model);
		return "student/st_admin/3_st_ad_deletePro";
	}
}
