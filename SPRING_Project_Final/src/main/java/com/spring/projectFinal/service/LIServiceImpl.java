package com.spring.projectFinal.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.projectFinal.LIVO.BookLoanVO;
import com.spring.projectFinal.LIVO.BookVO;
import com.spring.projectFinal.LIVO.SeatVO;
import com.spring.projectFinal.persistence.LIDAOImpl;

@Service
public class LIServiceImpl implements LIService{

	@Autowired
	LIDAOImpl lidao;
	
	
	//도서 등록 처리
	@Override
	public void lib_bookAddPro(MultipartHttpServletRequest req, Model model) {
		
		int amt = Integer.parseInt(req.getParameter("amt"));
		
		int insertCnt = 0;
		long b_isbn = Long.parseLong(req.getParameter("isbn"));
		
		for(int i=0; i<amt; i++) {
			
			MultipartFile file = req.getFile("img");
			//저장 경로
			String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/library_img/");
			
			//상품 대표이미지 저장경로
			String realDir="J:\\Dev36\\ARAuni\\final_project\\SPRING_Project_Final\\src\\main\\webapp\\resources\\images\\library_img\\";
				
			try {
				file.transferTo(new File(saveDir+file.getOriginalFilename()));
	
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
				
				int data = 0;
				
				while((data = fis.read())!= -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
				
				
				BookVO bVO = new BookVO();
				
				//isbn번호가 일치하는 책이 있는지 검색
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("b_isbn", b_isbn);
				
				int isbnCnt = lidao.isbnCheck(map);
				
				
				//isbn번호가 일치하는 책이 있다면 해당 도서 정보를 읽어와 같은 값으로 저장
				if(isbnCnt > 0) { 
					
					bVO = lidao.bookinfo(b_isbn+"_"+isbnCnt);
					
					bVO.setB_no(req.getParameter("isbn")+ "_" + (isbnCnt+1));
					bVO.setB_isbn(bVO.getB_isbn());
					bVO.setB_global(bVO.getB_global());
					bVO.setB_category(bVO.getB_category());
					bVO.setB_title(bVO.getB_title());
					bVO.setB_price(bVO.getB_price());
					bVO.setB_author(bVO.getB_author());
					bVO.setB_publish(bVO.getB_publish());
					
					//발행일						
					bVO.setB_date(bVO.getB_date());
					
					//도서 이미지
					bVO.setB_img(bVO.getB_img());
					
					//반입일
					java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());			
					bVO.setB_intoDate(sqlDate);
									
					insertCnt += lidao.bookadd(bVO);
					
					
				//isbn번호가 일치하는 책이 없다면 입력받은 값으로 데이터 저장
				} else {
					bVO.setB_no(req.getParameter("isbn")+ "_1");
					bVO.setB_isbn(Long.parseLong(req.getParameter("isbn")));
					bVO.setB_global(Integer.parseInt(req.getParameter("global")));
					bVO.setB_category(Integer.parseInt(req.getParameter("category")));
					bVO.setB_title(req.getParameter("title"));
					bVO.setB_price(Integer.parseInt(req.getParameter("price")));
					bVO.setB_author(req.getParameter("author"));
					bVO.setB_publish(req.getParameter("publish"));
					
					//발행일
					String year = req.getParameter("year");
					String month = req.getParameter("month");
					String day = req.getParameter("day");		
					bVO.setB_date((year+"/"+month+"/"+day));
					
					//도서 이미지
					bVO.setB_img(file.getOriginalFilename());
					
					//반입일
					java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());			
					bVO.setB_intoDate(sqlDate);
									
					insertCnt += lidao.bookadd(bVO);
				}
	
			} catch(Exception e) { 
				e.printStackTrace();
			}
			
					
		}
		model.addAttribute("amt", amt);
		model.addAttribute("insertCnt",insertCnt);	
		System.out.println("insertCnt:" + insertCnt);
		System.out.println("amt : "+ amt);
	}

	
	
	//도서 전체 리스트
	@Override
	public void getBooklist(HttpServletRequest req, Model model) {
		
		int pageSize = 10;		//한 페이지당 출력할 글 갯수
		int pageBlock = 5;		//한 블럭당 보여질 페이지의 수 
		
		int cnt = 0;			//책 개수
		int start = 0;			//현재 페이지 시작 글 번호
		int end = 0;			//현재 페이지 마지막 글 번호
		int number = 0;			//게시글 번호
		String pageNum = null;	//페이지 번호 
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 개수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		
		cnt = lidao.bookcnt(null);
		System.out.println("출력될 목록 개수 : "+ cnt);
		
		
		pageNum = req.getParameter("pageNum");		
		if(pageNum == null) pageNum="1";
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt/pageSize) + (cnt%pageSize>0 ? 1:0);
		start = (currentPage-1) * pageSize+1;
		end = start+pageSize-1;
		
		if(end>cnt) end = cnt;
		
		number = cnt-(currentPage-1) * pageSize;
		
	
		//목록조회
		if(cnt > 0) {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			/*if(req.getParameter("b_global") != null) {
				map.put("b_global", req.getParameter("b_global"));
			}*/
			
			ArrayList<BookVO> bVOs = lidao.booklist(map);
			model.addAttribute("bVOs", bVOs);
		}
		
		
		//시작페이지
		startPage = (currentPage/pageBlock) * pageBlock+1;
		if(currentPage%pageBlock == 0) startPage -= pageBlock;
		
		//마지막 페이지
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;	
			
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if(cnt>0) {//도서가 하나 이상 있을시
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);			
		}

	}


	//도서 한 권 조회
	@Override
	public void getBookInfo(HttpServletRequest req, Model model) {
		
		String b_no = req.getParameter("b_no");
		
		BookVO bVO = new BookVO();
		bVO = lidao.bookinfo(b_no);
		
		model.addAttribute("bVO", bVO);
		
	}


	//도서 수정
	@Override
	public void lib_bookModiPro(MultipartHttpServletRequest req, Model model) {
		
		MultipartFile file = req.getFile("img");
		//저장 경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/library_img/");
		
		/*String fileName="";
		
		if(!file.isEmpty()) {
			String getFileName[] = file.getOriginalFilename().split("\\");
			fileName = getFileName[0];
		}*/
		
		
		//상품 대표이미지 저장경로
		String realDir="J:\\Dev36\\ARAuni\\final_project\\SPRING_Project_Final\\src\\main\\webapp\\resources\\images\\library_img\\";
			
		try {
	
			if(!file.isEmpty()) {
				file.transferTo(new File(saveDir+file.getOriginalFilename()));

				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
				
				int data = 0;
				
				while((data = fis.read())!= -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}
			

			BookVO bVO = new BookVO();
			
			
			bVO.setB_global(Integer.parseInt(req.getParameter("global")));
			bVO.setB_category(Integer.parseInt(req.getParameter("category")));
			bVO.setB_title(req.getParameter("title"));
			
			bVO.setB_price(Integer.parseInt(req.getParameter("price")));
			bVO.setB_author(req.getParameter("author"));
			bVO.setB_publish(req.getParameter("publish"));
			
			String year = req.getParameter("year");
			String month = req.getParameter("month");
			String day = req.getParameter("day");

			bVO.setB_date((year+"/"+month+"/"+day));
			
			bVO.setB_img(file.getOriginalFilename());
			
			
			//대여가능 여부 구하기
			ArrayList<BookLoanVO> bloanVOs = new ArrayList<BookLoanVO>();
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("b_no", req.getParameter("b_no"));
			
			bloanVOs = lidao.bookloanlist(map);
			
			
			for(int i=0; i<bloanVOs.size(); i++) {
				
				BookLoanVO vo = bloanVOs.get(i);
				//loan_state (0:정상반납, 1:대여중, 11:반납예정, 12:미반납, 2:예약중, 3:장기미납)
				if(vo.getLoan_state() == 0) {
					bVO.setB_state_fl(1);	//대여가능
				} else {
					bVO.setB_state_fl(2);	//대여불가
				} 
				
			}
			
		
			map.put("bVO", bVO);
			map.put("b_no", req.getParameter("b_no"));
			/*map.put("confirmImage", Integer.parseInt(req.getParameter("confirmImage")));*/
			
			int updateCnt = lidao.bookupdate(map);
			
			model.addAttribute("updateCnt",updateCnt);
			model.addAttribute("b_no",req.getParameter("b_no"));
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}


	//도서 삭제 처리
	@Override
	public void lib_bookDelPro(HttpServletRequest req, Model model) {
		
		String b_no = req.getParameter("b_no");
		
		int deleteCnt = lidao.bookdelete(b_no);
		
		model.addAttribute("b_no", b_no);
		model.addAttribute("deleteCnt", deleteCnt);
	
	}


	//도서 대여 처리
	@Override
	public void lib_bookLoanPro(HttpServletRequest req, Model model) {
		
		String[] b_nos = req.getParameterValues("b_no");		
		System.out.println("책 번호 : "+req.getParameterValues("b_no"));
		
		String user_no = req.getParameter("user_no"); 
		System.out.println("사용자 번호 : "+user_no);
		
		//교수,관리자,학생이 맞는지 확인
		int certiry = 0;	//증명완료 : 1, 증명실패:-1
		int stCertiry_fl = lidao.stCertiry(user_no);
		int adCertiry_fl = lidao.adCertiry(user_no);
		int pfCertiry_fl = lidao.pfCertiry(user_no);
		
		//증명 처리 
		if(stCertiry_fl>0 || adCertiry_fl>0 || pfCertiry_fl>0) {
			certiry = 1;	//증명완료 : 1
		} else {
			certiry = -1;	//증명실패:-1
		}
		System.out.println("certiry : "+certiry);
				
		
		//증명 완료시, 대여 처리
		if(certiry == 1) {
			
			int loanCnt=0;
			
			//1권씩 대여 처리
			for(int i=0; i<b_nos.length; i++) {
				
				String b_no = b_nos[i];
				System.out.println("b_nos :"+b_no );
				
				BookVO bVO = new BookVO();				
				bVO = lidao.bookinfo(b_no);
				
				//해당 도서가 db에 있고, 대여가능 상태면
				if(bVO != null && bVO.getB_state_fl()==1) {
															
					BookLoanVO bloanVO = new BookLoanVO();
					System.out.println("user_no : "+user_no);					
					bloanVO.setB_no(b_no);
					bloanVO.setUser_no(user_no);
					
					//대여일					
					Calendar calendar = Calendar.getInstance();
			        SimpleDateFormat format = new SimpleDateFormat();
			         
			        format.applyPattern("yyyy/MM/dd");
			        			        
			        bloanVO.setLoan_dt(calendar.getTime());
			        System.out.println("대여일:"+format.format(calendar.getTime()));

			        
			        //반납일 +3일
			        calendar.add(Calendar.DAY_OF_MONTH, 3);
			        
			        String returndate = format.format(calendar.getTime());					
					bloanVO.setReturn_sche(returndate);
					System.out.println("반납일 : "+format.format(calendar.getTime()));
					
					
					bloanVO.setOverdue(0);
					
					bloanVO.setLoan_state(1);	//대여중	
					
					loanCnt += lidao.bookloan(bloanVO);
					
					
					//bVO의 도서 대여 상태를 대여 불가능으로 업데이트한다					
					
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("b_no", b_no);
					map.put("b_isbn", bVO.getB_isbn());
					map.put("b_global", bVO.getB_global());
					map.put("b_category", bVO.getB_category());
					map.put("b_title", bVO.getB_title());
					map.put("b_price", bVO.getB_price());
					map.put("b_author", bVO.getB_author());
					map.put("b_publish", bVO.getB_publish());
					map.put("b_date", bVO.getB_date());
					map.put("b_img", bVO.getB_img());
					map.put("b_intoDate", bVO.getB_intoDate());
					map.put("b_state_fl", 2);
					
					lidao.bookupdate(map);
				
				}								
				
			}
			//대여된 책의 권수 누적
			model.addAttribute("loanCnt",loanCnt);				
		}
		//증명완료 : 1, 증명실패:-1
		model.addAttribute("certiry",certiry);
		
	}


	//도서 반납 처리
	@Override
	public void lib_bookReturnPro(HttpServletRequest req, Model model) {
		
		String[] b_nos = req.getParameterValues("b_no");		
		System.out.println("책 번호 : "+req.getParameterValues("b_no"));
		
		String user_no = req.getParameter("user_no"); 
		System.out.println("사용자 번호 : "+user_no);
		
		//교수,관리자,학생이 맞는지 확인
		int certiry = 0;	//증명완료 : 1, 증명실패:-1
		int stCertiry_fl = lidao.stCertiry(user_no);
		int adCertiry_fl = lidao.adCertiry(user_no);
		int pfCertiry_fl = lidao.pfCertiry(user_no);
		
		//증명 처리 
		if(stCertiry_fl>0 || adCertiry_fl>0 || pfCertiry_fl>0) {
			certiry = 1;	//증명완료 : 1
		} else {
			certiry = -1;	//증명실패:-1
		}
		
				
		//증명 완료시, 반납 처리
		if(certiry == 1) {
			
			int returnCnt=0;
			
			//1권씩 반납 처리
			for(int i=0; i<b_nos.length; i++) {
				
				String b_no = b_nos[i];
				
				BookVO bVO = new BookVO();				
				bVO = lidao.bookinfo(b_no);
				
				//해당 도서가 db에 있고, 대여불가 상태면
				if(bVO != null && bVO.getB_state_fl()==2) {		
					
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("b_no", b_no);
					map.put("user_no", user_no);
					
					BookLoanVO bloanVO = lidao.bookloanOne(map);
				
					/*bloanVO.setB_no(b_no);
					bloanVO.setUser_no(user_no);*/
					
					//대여일										
			        bloanVO.setLoan_dt(bloanVO.getLoan_dt());
		        
			        //반납일예정일	        				
					bloanVO.setReturn_sche(bloanVO.getReturn_sche());
					
					bloanVO.setOverdue(bloanVO.getOverdue());
					
					//반납일
					Calendar cal = Calendar.getInstance();
					
			    /*    SimpleDateFormat fmt = new SimpleDateFormat();			         
			        fmt.applyPattern("yyyy/MM/dd");*/
			        			        
			        bloanVO.setReturn_dt(cal.getTime());
					
			        //대여상태
					bloanVO.setLoan_state(0);	//정상반납
					
					returnCnt += lidao.loanupdate(bloanVO);
					
					
					//bVO의 도서 대여 상태를 대여 가능으로 업데이트한다
					bVO.setB_state_fl(1);
					
					Map<String,Object> map1 = new HashMap<String,Object>();
					map1.put("b_no", b_no);
					map1.put("b_isbn", bVO.getB_isbn());
					map1.put("b_global", bVO.getB_global());
					map1.put("b_category", bVO.getB_category());
					map1.put("b_title", bVO.getB_title());
					map1.put("b_price", bVO.getB_price());
					map1.put("b_author", bVO.getB_author());
					map1.put("b_publish", bVO.getB_publish());
					map1.put("b_date", bVO.getB_date());
					map1.put("b_img", bVO.getB_img());
					map1.put("b_intoDate", bVO.getB_intoDate());
					map1.put("b_state_fl", bVO.getB_state_fl());
					
					lidao.bookupdate(map1);
				
				}								
			}
			//반납된 책의 권수 누적
			model.addAttribute("returnCnt",returnCnt);				
		}
		//증명완료 : 1, 증명실패:-1
		model.addAttribute("certiry",certiry);
	
	}


	//대여 연장 처리
	@Override
	public void lib_bookRenewPro(HttpServletRequest req, Model model) {
		
		String[] b_nos = req.getParameterValues("b_no");		
		System.out.println("책 번호 : "+req.getParameterValues("b_no"));
		
		String user_no = req.getParameter("user_no"); 
		System.out.println("사용자 번호 : "+user_no);
		
		//교수,관리자,학생이 맞는지 확인
		int certiry = 0;	//증명완료 : 1, 증명실패:-1
		int stCertiry_fl = lidao.stCertiry(user_no);
		int adCertiry_fl = lidao.adCertiry(user_no);
		int pfCertiry_fl = lidao.pfCertiry(user_no);
		
		//증명 처리 
		if(stCertiry_fl>0 || adCertiry_fl>0 || pfCertiry_fl>0) {
			certiry = 1;	//증명완료 : 1
		} else {
			certiry = -1;	//증명실패:-1
		}
		
				
		//증명 완료시, 연장 처리
		if(certiry == 1) {
			
			int renewCnt=0;
			
			//1권씩 연장 처리
			for(int i=0; i<b_nos.length; i++) {
												
				String b_no = b_nos[i];
				
				BookVO bVO = new BookVO();
				bVO = lidao.bookinfo(b_no);
												
				//해당 도서가 db에 있고, 대여불가 상태면
				if(bVO != null && bVO.getB_state_fl()==2) {				
					
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("b_no", b_no);
					map.put("user_no", user_no);
					
					int[] array = {1,11};//1:대여 중, 11:반납예정
					map.put("loan_state", array);
													
					BookLoanVO bloanVO = lidao.bookloanOne(map);
					
										
					bloanVO.setB_no(b_no);
					bloanVO.setUser_no(user_no);
					
					//대여일										
			        bloanVO.setLoan_dt(bloanVO.getLoan_dt());
		        
			        //반납일예정일	        											
					String schedule = bloanVO.getReturn_sche();
					
					String[] date = schedule.split("/");
					Calendar cal = Calendar.getInstance();
					
					cal.set(Calendar.YEAR, Integer.parseInt(date[0]));
					cal.set(Calendar.MONTH, Integer.parseInt(date[1])-1);
					cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(date[2]));
			        
					cal.add(Calendar.DAY_OF_MONTH, 3);
					
					SimpleDateFormat fmt = new SimpleDateFormat();			         
			        fmt.applyPattern("yyyy/MM/dd");
			        
					bloanVO.setReturn_sche(fmt.format(cal.getTime()));
					
					//연체일
					bloanVO.setOverdue(bloanVO.getOverdue());
					
					//반납일
					bloanVO.setReturn_dt(null);
					
			        //대여상태
					bloanVO.setLoan_state(1);	
					
					renewCnt += lidao.loanupdate(bloanVO);
			
				}								
			}
			//연장된 책의 권수 누적
			model.addAttribute("renewCnt",renewCnt);				
		}
		//증명완료 : 1, 증명실패:-1
		model.addAttribute("certiry",certiry);
		
	}



	
	//도서 검색
	@Override
	public void lib_bookSearchResult(HttpServletRequest req, Model model) {		
		
		//검색 결과 페이지 구성
		int pageSize = 10;		//한 페이지당 출력할 검색 결과 개수
		int pageBlock = 5;		//한 블럭당 보여질 페이지의 수 
		
		int cnt = 0;			//검색결과 수
		int start = 0;			//현재 페이지 시작 글 번호
		int end = 0;			//현재 페이지 마지막 글 번호
		int number = 0;			//게시글 번호
		String pageNum = null;	//페이지 번호 
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		
		//검색 단어, start,end 맵에 넣기
		Map<String,Object> map = new HashMap<String,Object>();
		
		String title = req.getParameter("title");
		String author = req.getParameter("author");
		
		
		if(title != null) {
			map.put("title", title + "%");
		} 
		
		if(author != null) {
			map.put("author", author + "%");
		} 
		
		//검색 결과 개수 구하기
		cnt = lidao.bookcnt(map);	
		System.out.println("총 검색 결과의 수 : " + cnt);	
			
		
		

		//검색결과 페이지 구성
		pageNum = req.getParameter("pageNum");
		
		//첫 페이지를 1페이지로 설정
		if(pageNum == null) {
			pageNum = "1";	
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("현재 페이지 : "+currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		System.out.println("페이지 수 : " + pageCount);
		
		start = (currentPage - 1) * pageSize + 1;
		
		end = start + pageSize - 1;
		System.out.println("시작 : " + start + " , 끝 : " + end);
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize; 
		System.out.println("글 수 : " + number + " , " + "한 페이지당 글 갯수 : " + pageSize);
		
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}		
		System.out.println("블럭 첫 페이지 : " + startPage);
		
		
		//마지막 페이지
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println("블럭 마지막 페이지 : " + endPage);
		
		//검색 결과 내용 읽어오기
		if(cnt > 0) {
			
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<BookVO> bVOs = lidao.booksearch(map);
			
			if((author == null || author.equals("")) && (title == null || title.equals(""))) {
				model.addAttribute("bVOs",null);
			} else {
				model.addAttribute("bVOs",bVOs);
			}
		}
		
		//6단계. 처리 결과 넘기기
		req.setAttribute("cnt", cnt);//글 갯수
		req.setAttribute("number", number);//글번호
		req.setAttribute("pageNum", pageNum);//페이지 번호
		if(cnt>0) { //글이 하나 이상 있을 때 
			req.setAttribute("startPage", startPage);//시작 페이지
			req.setAttribute("endPage", endPage);//마지막 페이지
			req.setAttribute("pageBlock", pageBlock);//페이지 블럭
			req.setAttribute("pageCount", pageCount);//페이지 갯수
			req.setAttribute("currentPage", currentPage);//현재 페이지	
			
		}
		
	}



	//도서 검색-예제
	@Override
	public void searchtest(HttpServletRequest req, Model model) {
				
		String keyword = req.getParameter("keyword");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword + "%");
		
		ArrayList<BookVO> bVOs = lidao.booksearch(map);

		
		ArrayList<String> list = new ArrayList<String>();
		
		for(int i=0; i<bVOs.size(); i++) {
			
			list.add(bVOs.get(i).getB_title());
		}
		
		
		
		if(keyword == null || keyword.equals("")) {
			model.addAttribute("bVOs",null);
		}else {
			model.addAttribute("bVOs",bVOs);
		}
		
	}


	
	//도서 대여 조회
	@Override
	public void lib_bookLoanlist(HttpServletRequest req, Model model) {
		
		//검색 결과 페이지 구성
		int pageSize = 20;		//한 페이지당 출력할 검색 결과 개수
		int pageBlock = 10;		//한 블럭당 보여질 페이지의 수 
		
		int cnt = 0;			//검색결과 수
		int start = 0;			//현재 페이지 시작 글 번호
		int end = 0;			//현재 페이지 마지막 글 번호
		int number = 0;			//게시글 번호
		String pageNum = null;	//페이지 번호 
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		
		
		//관리자일 때는 전체 조회, 이용자는 본인 것만 조회  if(adId != null)
		cnt = lidao.bookloanCnt();
		

		//검색결과 페이지 구성
		pageNum = req.getParameter("pageNum");
		
		//첫 페이지를 1페이지로 설정
		if(pageNum == null) {
			pageNum = "1";	
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("현재 페이지 : "+currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		System.out.println("페이지 수 : " + pageCount);
		
		start = (currentPage - 1) * pageSize + 1;
		
		end = start + pageSize - 1;
		System.out.println("시작 : " + start + " , 끝 : " + end);
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize; 
		System.out.println("글 수 : " + number + " , " + "한 페이지당 글 갯수 : " + pageSize);
		
		
		//시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}		
		System.out.println("블럭 첫 페이지 : " + startPage);
		
		
		//마지막 페이지
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println("블럭 마지막 페이지 : " + endPage);
		
		//검색 결과 내용 읽어오기
		if(cnt > 0) {
			
			ArrayList<BookLoanVO> bloanVOs = lidao.bookloanlist(null);
			model.addAttribute("bloanVOs",bloanVOs);
		}
		
		//6단계. 처리 결과 넘기기
		req.setAttribute("cnt", cnt);//글 갯수
		req.setAttribute("number", number);//글번호
		req.setAttribute("pageNum", pageNum);//페이지 번호
		if(cnt>0) { //글이 하나 이상 있을 때 
			req.setAttribute("startPage", startPage);//시작 페이지
			req.setAttribute("endPage", endPage);//마지막 페이지
			req.setAttribute("pageBlock", pageBlock);//페이지 블럭
			req.setAttribute("pageCount", pageCount);//페이지 갯수
			req.setAttribute("currentPage", currentPage);//현재 페이지	
			
		}
	
		/*String user_no = req.getParameter("adId");*/
		//관리자일 때
		/*String user_no = "";*/
		
		//검색할 날짜 가져가기 
		/*Calendar cal = Calendar.getInstance();
		
		SimpleDateFormat fmt = new SimpleDateFormat();			         
        fmt.applyPattern("yyyy/MM/dd");
        
		String searching = fmt.format(cal.getTime());*/
	
	}
	
	
	
	
	
	
	//전체 좌석 현황 조회
	@Override
	public void lib_viewSeat(HttpServletRequest req, Model model) {
		
		String rdRoom_no = req.getParameter("rdRoom_no");
		System.out.println("rdRoom_no : "+rdRoom_no);
		
		ArrayList<SeatVO> sVOs = lidao.viewSeat(rdRoom_no);
					
		
		model.addAttribute("sVOs", sVOs);
	}



	//좌석 업데이트
	@Override
	public void lib_seat_update(HttpServletRequest req, Model model) {
		
		String rdRoom_no = req.getParameter("rdRoom_no");
		int seat_no = Integer.parseInt(req.getParameter("seat_no"));	
		/*String user_no = req.getParameter("user_no");	*/	
		String user_no = "218401001";
		int updateCnt = 0;
		
		
		//교수,관리자,학생이 맞는지 확인
		int certiry = 0;	//증명완료 : 1, 증명실패:-1
		int stCertiry_fl = lidao.stCertiry(user_no);
		int adCertiry_fl = lidao.adCertiry(user_no);
		int pfCertiry_fl = lidao.pfCertiry(user_no);
		
		//증명 처리 
		if(stCertiry_fl>0 || adCertiry_fl>0 || pfCertiry_fl>0) {
			certiry = 1;	//증명완료 : 1
		} else {
			certiry = -1;	//증명실패:-1
		}
		System.out.println("certiry : "+certiry);
				
		
		//증명 완료 시, 업데이트 처리
		if(certiry == 1) {
			//해당 이용자가 이미 이용 중인 좌석이 있는지 확인			
			int selectCnt = lidao.seatUserCnt(user_no);
			
			//중복되지 않는다면
			if(selectCnt == 0) {
				//선택된 좌석의 정보 가져오기		
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("seat_no", seat_no);
				map.put("rdRoom_no", rdRoom_no);
				
				SeatVO sVO = new SeatVO();
				sVO = lidao.seatOne(map);
				
				
				int state = sVO.getSeat_state();
								        
		        switch(state) {
			        case 0 : //빈좌석 -> 이용중

			        	sVO.setUser_no(user_no);
			        	
						//시작 시각 : 현재 시간
						/*java.sql.Date sqldate = new java.sql.Date(new java.util.Date().getTime());
						sVO.setSeat_st_dt(sqldate);
						
						SimpleDateFormat fmt = new SimpleDateFormat();			         
				        fmt.applyPattern("yyyy/MM/dd HH:MM:SS");
				        
						System.out.println(fmt.format(cal.getTime()));*/
						
						//종료 시각 : 현재에서 2분 +
						/*Calendar cal = Calendar.getInstance();
						cal.add(Calendar.MINUTE, 10);
						sVO.setSeat_end_dt(cal.getTime());
						*/
						sVO.setseat_usetime("10MI");
						sVO.setSeat_state(1);
						
						updateCnt = lidao.seatupdate(sVO);
						break;
						
			        case 1: //이용 취소			        	
			        	break;
			        	
			        case 2: //이용불가 	        	
			        	break;		        	
		        }
				
				
				
			} else {
				//선택된 좌석의 정보 가져오기		
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("seat_no", seat_no);
				map.put("rdRoom_no", rdRoom_no);
				
				SeatVO sVO = new SeatVO();
				sVO = lidao.seatOne(map);
				
				
				int state = sVO.getSeat_state();
								        
		        switch(state) {
			        case 0 : //빈좌석 -> 이용중
			        	break;
			        case 1: //이용 취소
			        	if(sVO.getUser_no().equals(user_no)) {
				        	
							sVO.setSeat_state(0);							
							updateCnt = lidao.seatupdate(sVO);
			        	}
			        	break;
			        	
			        case 2: //이용불가 	        	
			        	break;	
		        }
		        
			}
			model.addAttribute("updateCnt",updateCnt);
			System.out.println("업데이트 성공여부 : "+updateCnt);
			model.addAttribute("selectCnt",selectCnt);						
		}
		model.addAttribute("certiry",certiry);
	}



	
	
	


}
