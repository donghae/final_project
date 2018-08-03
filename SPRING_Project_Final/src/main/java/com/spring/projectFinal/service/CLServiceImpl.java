package com.spring.projectFinal.service;


import com.spring.projectFinal.CLVO.CyberAttendanceVO;
import com.spring.projectFinal.CLVO.CyberLecNoticeVO;
import com.spring.projectFinal.CLVO.CyberNoticeVO;
import com.spring.projectFinal.CLVO.LectureVO;
import com.spring.projectFinal.CLVO.RoundVO;
import com.spring.projectFinal.persistence.CLDAO;

import com.xuggle.xuggler.IContainer;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;




@Service
public class CLServiceImpl implements CLService{

	@Autowired
	CLDAO dao;
	
	@Override
	public void addRound(MultipartHttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		MultipartFile file = req.getFile("lectureVideo");
		String saveDir = req.getRealPath("/resources/video/"); //저장 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        String fileName = "";
        if(!file.isEmpty()) {
        	String getFileName[] = file.getOriginalFilename().split("\\.");
        	fileName = getFileName[0] + "_" + sdf.format(c.getTime()) + "." +getFileName[1];
        }
        
		
        String realDir="J:\\Dev36\\ARAuni\\final_project\\SPRING_Project_Final\\src\\main\\webapp\\resources\\video\\"; // 저장 경로
        try {
	        if(!file.isEmpty()) {
	        	file.transferTo(new File(saveDir+fileName));
	            
	            FileInputStream fis = new FileInputStream(saveDir + fileName);
	            FileOutputStream fos = new FileOutputStream(realDir + fileName);
	            
	            int data = 0;
	            
	            while((data = fis.read()) != -1) {
	                fos.write(data);
	            }
	            fis.close();
	            fos.close();
	            

	            IContainer container = IContainer.make();
	            int result = container.open(saveDir + fileName, IContainer.Type.READ, null);
	            long duration = container.getDuration();
	            long fileSize = container.getFileSize();
	            
	            
	            
	            int lec_no = Integer.parseInt(req.getParameter("lec_no"));
	            int round_no = Integer.parseInt(req.getParameter("round_no"));
	            String round_name = req.getParameter("round_name");
	            String file_name = fileName;
	            long file_len = duration/1000000;
	            
	            RoundVO vo = new RoundVO();
	            vo.setLec_no(lec_no);
	            vo.setRound_no(round_no);
	            vo.setRound_name(round_name);
	            vo.setFile_name(file_name);
	            vo.setFile_len(file_len);
	                       
	            int insertCnt = dao.addRound(vo);
	            
	            model.addAttribute("insertCnt", insertCnt);
	            model.addAttribute("lec_no",lec_no);
	            System.out.println("duration : " + duration);
	            System.out.println("time : " + file_len + "초");
	            System.out.println("fileSize : " + fileSize);
	         
	        }		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	}

	@Override
	public void downloadFile(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String saveDir = req.getRealPath("/resources/video/");
        String filename = req.getParameter("fileName");
        
        File file = new File(saveDir + filename);
        
//        resp.setContentType("aplication/octet-stream");        // download 동일
        res.setContentType("application/download");
        res.setContentLength((int) file.length());
        //res.setContentLengthLong(file.length());
        
        // 모든 브라우저가 지원
        filename = URLEncoder.encode(filename, "utf-8").replace("+", "%20").replace("(", "%28").replace(")", "%29");
        
        // 익스플로러는 지원 안됨
//        originFileName = new String(originFileName.getBytes("utf-8"), "iso-8859-1").replace("+", "%20");
 
        // Content-Disposition: form-data; name="fileName"; filename="파일명"
        res.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
        
        PrintWriter out = res.getWriter();
        FileInputStream fis = null;
        
        try {
            int temp;
            fis = new FileInputStream(file);
            while((temp = fis.read()) != -1) {
                out.write(temp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(fis != null) {
                try {
                    fis.close();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
            if(out != null) out.close();
        }


	}

	@Override
	public void addLecNotice(MultipartHttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int insertCnt = 0;
		MultipartFile file = req.getFile("attFile");
		String saveDir = req.getRealPath("/resources/video/"); //저장 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        String fileName = "";
        if(!file.isEmpty()) {
        	String getFileName[] = file.getOriginalFilename().split("\\.");
        	fileName = getFileName[0] + "_" + sdf.format(c.getTime()) + "." +getFileName[1];
        }
        
		
        String realDir="J:\\Dev36\\ARAuni\\final_project\\SPRING_Project_Final\\src\\main\\webapp\\resources\\video\\"; // 저장 경로
        try {
	        if(!file.isEmpty()) {
	        	file.transferTo(new File(saveDir+fileName));
	            
	            FileInputStream fis = new FileInputStream(saveDir + fileName);
	            FileOutputStream fos = new FileOutputStream(realDir + fileName);
	            
	            int data = 0;
	            
	            while((data = fis.read()) != -1) {
	                fos.write(data);
	            }
	            fis.close();
	            fos.close();
	            

	            CyberLecNoticeVO vo = new CyberLecNoticeVO();
	            System.out.println("lec_no : "+req.getParameter("lec_no"));
	            int lec_no = Integer.parseInt(req.getParameter("lec_no"));
	            vo.setLec_no(lec_no);
	            vo.setCy_lec_n_title(req.getParameter("title"));
	            vo.setCy_lec_n_content(req.getParameter("content"));
	            vo.setProf_no("118202001");
	            vo.setCy_lec_n_dt(new java.sql.Date(new Timestamp(System.currentTimeMillis()).getTime()));
	            vo.setCy_lec_n_file(fileName);
	            vo.setCy_lec_n_cnt(0);
				
				Map<String, Object> map = new HashMap<>();
				map.put("vo", vo);
				insertCnt = dao.addLecNotice(map);
				
				model.addAttribute("lec_no", lec_no);
				model.addAttribute("insertCnt", insertCnt);
	         
	        }		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
	}

	@Override
	public void getLecNoticeList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int pageSize = 10; // 한페이지당 출력할 글 개수
		int pageBlock = 5; // 한 블럭당 페이지 개수
		int cnt = 0; // 전체 글 개수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지
		int pageCount = 0; // 페이지 개수
		int startPage = 0; // 시작 페이지
		int endPage = 0;
		
		int lec_no = 0;
		
		Map<String,Object> map = new HashMap<>();
		if(req.getParameter("lec_no")!=null) {
			lec_no = Integer.parseInt(req.getParameter("lec_no"));
		}
		map.put("lec_no", lec_no);
		cnt = dao.getLecNoticeCnt(map);
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert할것
		pageNum = req.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 개수 + 나머지있으면 1

		start = (currentPage - 1) * pageSize + 1; // 현재 페이지 시작번호

		end = start + pageSize - 1; // 현재 페이지 끝번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		ArrayList<CyberLecNoticeVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회
						
			map.put("start", start);
			map.put("end", end);			
			dtos = dao.getLecNoticeList(map);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		endPage = startPage + pageBlock - 1; // 마지막 페이지

		if (endPage > pageCount)
			endPage = pageCount;

		// 글 개수 구하기
		model.addAttribute("lec_no",lec_no);
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
			model.addAttribute("pageCount", pageCount); // 페이지 개수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	@Override
	public void getLecNotice(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int num= Integer.parseInt(req.getParameter("num"));
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		int pageNum=1;
		if(req.getParameter("pageNum")!=null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		CyberLecNoticeVO vo = dao.getLecNotice(num);
		
		model.addAttribute("vo", vo);
		model.addAttribute("lec_no", lec_no);
		model.addAttribute("pageNum", pageNum);
	}

	@Override
	public void getLecList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
// 게시판관련
		int pageSize = 10; // 한페이지당 출력할 글 개수
		int pageBlock = 5; // 한 블럭당 페이지 개수
		int cnt = 0; // 전체 글 개수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지
		int pageCount = 0; // 페이지 개수
		int startPage = 0; // 시작 페이지
		int endPage = 0;

		cnt = dao.getLecCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert할것
		pageNum = req.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 개수 + 나머지있으면 1

		start = (currentPage - 1) * pageSize + 1; // 현재 페이지 시작번호

		end = start + pageSize - 1; // 현재 페이지 끝번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		ArrayList<LectureVO> dtos = null;
		HashMap<Integer, Integer> lecPersonCnt = null;
		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.getLecList(map);

			lecPersonCnt = new HashMap<>();
			for (LectureVO vo : dtos) {
				lecPersonCnt.put(vo.getLec_no(), dao.getLecPersonCnt(vo.getLec_no()));
			}
			model.addAttribute("lecPersonCnt", lecPersonCnt);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		endPage = startPage + pageBlock - 1; // 마지막 페이지

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
			model.addAttribute("pageCount", pageCount); // 페이지 개수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	@Override
	public void addNotice(MultipartHttpServletRequest req, Model model) {
		int insertCnt = 0;
		MultipartFile file = req.getFile("attFile");
		String saveDir = req.getRealPath("/resources/video/"); //저장 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        String fileName = "";
        if(!file.isEmpty()) {
        	String getFileName[] = file.getOriginalFilename().split("\\.");
        	fileName = getFileName[0] + "_" + sdf.format(c.getTime()) + "." +getFileName[1];
        }
        
		
        String realDir="J:\\Dev36\\ARAuni\\final_project\\SPRING_Project_Final\\src\\main\\webapp\\resources\\video\\"; // 저장 경로
        try {
	        if(!file.isEmpty()) {
	        	file.transferTo(new File(saveDir+fileName));
	            
	            FileInputStream fis = new FileInputStream(saveDir + fileName);
	            FileOutputStream fos = new FileOutputStream(realDir + fileName);
	            
	            int data = 0;
	            
	            while((data = fis.read()) != -1) {
	                fos.write(data);
	            }
	            fis.close();
	            fos.close();
	            

	            CyberNoticeVO vo = new CyberNoticeVO();
	            vo.setCy_n_title(req.getParameter("title"));
	            vo.setCy_n_content(req.getParameter("content"));
	            vo.setAd_no("018202001");
	            vo.setCy_n_dt(new java.sql.Date(new Timestamp(System.currentTimeMillis()).getTime()));
	            vo.setCy_n_file(fileName);
	            vo.setCy_n_cnt(0);
				
				Map<String, Object> map = new HashMap<>();
				map.put("vo", vo);
				insertCnt = dao.addNotice(map);
				
				model.addAttribute("insertCnt", insertCnt);
	         
	        }		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
	}

	@Override
	public void getNoticeList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int pageSize = 10; // 한페이지당 출력할 글 개수
		int pageBlock = 5; // 한 블럭당 페이지 개수
		int cnt = 0; // 전체 글 개수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지
		int pageCount = 0; // 페이지 개수
		int startPage = 0; // 시작 페이지
		int endPage = 0;
		
		cnt = dao.getNoticeCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert할것
		pageNum = req.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 개수 + 나머지있으면 1

		start = (currentPage - 1) * pageSize + 1; // 현재 페이지 시작번호

		end = start + pageSize - 1; // 현재 페이지 끝번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		ArrayList<CyberNoticeVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<>();
			map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);			
			dtos = dao.getNoticeList(map);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		endPage = startPage + pageBlock - 1; // 마지막 페이지

		if (endPage > pageCount)
			endPage = pageCount;

		// 글 개수 구하기
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
			model.addAttribute("pageCount", pageCount); // 페이지 개수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
		
	}

	@Override
	public void getNotice(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int num= Integer.parseInt(req.getParameter("num"));
		int pageNum=1;
		if(req.getParameter("pageNum")!=null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		CyberNoticeVO vo = dao.getNotice(num);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pageNum", pageNum);
		
	}

	@Override
	public void getRoundList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int pageSize = 10; // 한페이지당 출력할 글 개수
		int pageBlock = 5; // 한 블럭당 페이지 개수
		int cnt = 0; // 전체 글 개수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지
		int pageCount = 0; // 페이지 개수
		int startPage = 0; // 시작 페이지
		int endPage = 0;
		int lec_no = 0;
		Map<String,Object> map = new HashMap<>();
		if(req.getParameter("lec_no")!=null) {
			lec_no = Integer.parseInt(req.getParameter("lec_no"));
		}
		map.put("lec_no", lec_no);
		cnt = dao.getRoundCnt(map);
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert할것
		pageNum = req.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 개수 + 나머지있으면 1

		start = (currentPage - 1) * pageSize + 1; // 현재 페이지 시작번호

		end = start + pageSize - 1; // 현재 페이지 끝번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		ArrayList<RoundVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회
			
			
			map.put("start", start);
			map.put("end", end);			
			dtos = dao.getRoundList(map);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		endPage = startPage + pageBlock - 1; // 마지막 페이지

		if (endPage > pageCount)
			endPage = pageCount;

		// 글 개수 구하기
		model.addAttribute("lec_no",lec_no);
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
			model.addAttribute("pageCount", pageCount); // 페이지 개수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
		
	}

	@Override
	public void updateCyAttendance(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void checkCyAttendance(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		int round_no = Integer.parseInt(req.getParameter("round_no"));
		long watch_time = Long.parseLong(req.getParameter("time"));
		String st_no = "218202001";
		Date watch_dt = new java.sql.Date(new Timestamp(System.currentTimeMillis()).getTime());
		
		CyberAttendanceVO vo = new CyberAttendanceVO();
		vo.setLec_no(lec_no);
		vo.setRound_no(round_no);
		vo.setWatch_time(watch_time);
		vo.setSt_no(st_no);
		vo.setWatch_dt(watch_dt);
	}

	@Override
	public void addCyAttendance(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
