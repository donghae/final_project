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
import com.spring.projectFinal.LIVO.SituationVO;
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
				
				//반입일
				java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());			
				bVO.setB_intoDate(sqlDate);
								
				insertCnt += lidao.bookadd(bVO);
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
		
	
		//도서 정보 조회
		if(cnt > 0) {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);			
			
			ArrayList<BookVO> bVOs = lidao.booklist(map);
			model.addAttribute("bVOs", bVOs);
			
			
			//관리자일 시에는 해당 도서의 대여정보도 가져온다
			String id = (String)req.getSession().getAttribute("id");
			
			System.out.println("관리자있음 id : " + id);
			if(id != null && id.substring(0,1).equals("0")) {
				
				ArrayList<BookLoanVO> bloanVOs = new ArrayList<BookLoanVO>();
				
				for(int i=0; i<bVOs.size(); i++) {
					
					Map<String,Object> loanmap = new HashMap<String,Object>();
					loanmap.put("b_no",bVOs.get(i).getB_no());
					

					System.out.println("b_no : " + bVOs.get(i).getB_no());
					
					BookLoanVO bloanVO = lidao.loanlistlast(loanmap);					
					bloanVOs.add(bloanVO);									
				}				
				model.addAttribute("bloanVOs",bloanVOs);				
			}
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
		

		BookVO bVO = new BookVO();
		
		System.out.println("globla:" + req.getParameter("global"));
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
		
				
		//대여가능 여부 구하기
		ArrayList<BookLoanVO> bloanVOs = new ArrayList<BookLoanVO>();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("b_no", req.getParameter("b_no"));
		
		bloanVOs = lidao.loanlist(map);
		
		if(bloanVOs.size() > 0) {
			for(int i=0; i<bloanVOs.size(); i++) {
				
				BookLoanVO vo = bloanVOs.get(i);
				//loan_state (0:정상반납, 1:대여중, 11:반납예정, 12:정상반납, 2:예약중, 3:미반납, 31:장기미납)
				if(vo.getLoan_state() == 0 || vo.getLoan_state() == 12) {
					bVO.setB_state_fl(1);	//대여가능
				} else {
					bVO.setB_state_fl(2);	//대여불가
				} 					
			}
		}else {
			bVO.setB_state_fl(1);	//대여가능
		}
		
		
	
		map.put("bVO", bVO);
		/*map.put("confirmImage", Integer.parseInt(req.getParameter("confirmImage")));*/
		
		int updateCnt = lidao.bookupdate(map);
		
		model.addAttribute("updateCnt",updateCnt);
		model.addAttribute("b_no",req.getParameter("b_no"));							
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
	public void lib_loanPro(HttpServletRequest req, Model model) {
		
		String[] b_nos = req.getParameterValues("b_no");		
		System.out.println("책 번호 : "+req.getParameterValues("b_no"));
		
		String user_no = req.getParameter("user_no"); 
		System.out.println("사용자 번호 : "+user_no);
		
		//1. 교수,관리자,학생이 맞는지 확인
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
		//증명완료 : 1, 증명실패:-1
		model.addAttribute("certiry",certiry);
		
				
		//2. 도서관에 소장중인 도서인지 확인		
		int b_certiry = 0;	
		if(b_nos != null) {			
					
			Map<String,Object> map = new HashMap<String,Object>();
			
			for(int i=0; i<b_nos.length; i++) {
				
				map.put("b_no",b_nos[i]);
				int count = lidao.bnoCheck(map);
				
				if(count > 0) {
					b_certiry = 1;
				} else {
					b_certiry = 0;
				}			
			}			
			model.addAttribute("b_certiry",b_certiry);			
		}
		
		
		//증명 완료시, 대여 처리
		if(certiry == 1) {
			if(b_certiry == 1) {
			
				int loanCnt=0;
				
				ArrayList<String> loan_unable = new ArrayList<String>();
				
				//1권씩 대여 처리
				for(int i=0; i<b_nos.length; i++) {
					
					
					String b_no = b_nos[i];
					System.out.println("b_nos :"+b_no );
					
					BookVO bVO = new BookVO();				
					bVO = lidao.bookinfo(b_no);
										
					//3. 대여 중인 도서인지 (1:대여가능 , 2:대여불가)
					int loaning = bVO.getB_state_fl();			
					
					//해당 도서가 db에 있고,
					if(bVO != null) { 						
						//대여 불가 상태일 시, 대여 처리할 수 없는 도서 번호들을 담는다
						if(loaning==2) {
							loan_unable.add(b_no);						
							
							System.out.println("대여x:"+loan_unable);
						//대여 가능 상태일 시, 대여 처리한다
						} else if(loaning==1) {
							
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
							
							loanCnt += lidao.loan(bloanVO);				
														
							//bVO의 도서 대여 상태를 대여 불가능으로 업데이트한다											
							Map<String,Object> map = new HashMap<String,Object>();
							bVO.setB_no(bVO.getB_no());
							bVO.setB_isbn(bVO.getB_isbn());
							bVO.setB_global(bVO.getB_global());
							bVO.setB_category(bVO.getB_category());
							bVO.setB_title(bVO.getB_title());
							bVO.setB_price(bVO.getB_price());
							bVO.setB_author(bVO.getB_author());
							bVO.setB_publish(bVO.getB_publish());
							bVO.setB_date(bVO.getB_date());							
							bVO.setB_intoDate(bVO.getB_intoDate());
							bVO.setB_state_fl(2);
							
							map.put("b_no", bVO.getB_no());	
							map.put("bVO", bVO);						
							int bookupdate = lidao.bookupdate(map);	
							System.out.println("도서 상태 변경:"+bookupdate);
						}
						
					} 
				}			
				
				if(loan_unable.size() > 0) {
					//대여 처리안된 도서들(대여 중인 도서들)
					model.addAttribute("loan_unable",loan_unable);	
				}
				
				
				//대여된 책의 권수 누적
				model.addAttribute("loanCnt",loanCnt);	
				System.out.println("loanCnt:"+loanCnt);
			}						
		}				
	}


	//도서 반납 처리
	@Override
	public void lib_returnPro(HttpServletRequest req, Model model) {
		
		String[] b_nos = req.getParameterValues("b_no");		
		System.out.println("책 번호 : "+req.getParameterValues("b_no")[0]);
		
		String user_no = req.getParameter("user_no"); 
		System.out.println("사용자 번호 : "+user_no);
		
		//1. 교수,관리자,학생이 맞는지 확인
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
		//증명완료 : 1, 증명실패:-1
		model.addAttribute("certiry",certiry);
		System.out.println("certiry:"+certiry);
		
		
		//2. 도서관에 소장중인 도서인지 확인
		int b_certiry = 0;
		
		if(b_nos != null) {
		
			Map<String,Object> map = new HashMap<String,Object>();
			
			for(int i=0; i<b_nos.length; i++) {
				
				map.put("b_no",b_nos[i]);
				int count = lidao.bnoCheck(map);
				
				if(count > 0) {
					b_certiry = 1;
				} else {
					b_certiry = 0;
				}
			}			
			model.addAttribute("b_certiry",b_certiry);	
			System.out.println("b_certiry:"+b_certiry);
		}
		
				
		//증명 완료시, 반납 처리
		if(certiry == 1) {
			if(b_certiry == 1) {
				int returnCnt=0;
			
				
				ArrayList<String> return_unable = new ArrayList<String>();
				//1권씩 반납 처리
				for(int i=0; i<b_nos.length; i++) {
					
					String b_no = b_nos[i];
					System.out.println("b_no:"+b_no);
					
					BookVO bVO = new BookVO();				
					bVO = lidao.bookinfo(b_no);
						
					//3. 대여 중인 도서인지 (1:대여가능 , 2:대여불가)
					//해당 도서가 db에 있고
					if(bVO != null) {		
						
						int loaning = bVO.getB_state_fl();
						model.addAttribute("loaning",loaning);
						
						if(loaning == 1) {
							return_unable.add(b_no);						
							
							System.out.println("반납x:"+return_unable);
							
						//대여 불가 상태일 시, 반납 처리한다
						} else if(loaning==2) {

							BookLoanVO bloanVO = new BookLoanVO();
							bloanVO.setB_no(b_no);
							bloanVO.setUser_no(user_no);
							
							Map<String,Object> map = new HashMap<String,Object>();
							map.put("b_no", b_no);
							map.put("user_no", user_no);
								
							bloanVO = lidao.loanlistlast(map);								
								
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
							bloanVO.setLoan_state(12);	//정상반납
													
							returnCnt += lidao.loanreturn(bloanVO);						
							
							
							//bVO의 도서 대여 상태를 대여 가능으로 업데이트한다
							bVO.setB_no(bVO.getB_no());
							bVO.setB_isbn(bVO.getB_isbn());
							bVO.setB_global(bVO.getB_global());
							bVO.setB_category(bVO.getB_category());
							bVO.setB_title(bVO.getB_title());
							bVO.setB_price(bVO.getB_price());
							bVO.setB_author(bVO.getB_author());
							bVO.setB_publish(bVO.getB_publish());
							bVO.setB_date(bVO.getB_date());							
							bVO.setB_intoDate(bVO.getB_intoDate());
							bVO.setB_state_fl(1);
	
							Map<String,Object> map1 = new HashMap<String,Object>();
							map1.put("b_no", bVO.getB_no());		
							map1.put("bVO", bVO);
							
							lidao.bookupdate(map1);		
						}
					}
				}
				
				//반납 처리안된 도서들(대여 중이 아닌 도서들)
				if(return_unable.size() > 0) {					
					model.addAttribute("return_unable",return_unable);	
				}
				
				//반납된 책의 권수 누적
				model.addAttribute("returnCnt",returnCnt);	
				System.out.println("반납 성공:"+returnCnt);
			}				
		}
	}


	//대여 연장 처리
	@Override
	public void lib_renewPro(HttpServletRequest req, Model model) {
		
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
		//증명완료 : 1, 증명실패:-1
		model.addAttribute("certiry",certiry);	
		System.out.println("certiry : "+certiry);		
		
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
													
					BookLoanVO bloanVO = lidao.loanlistOne(map);
					
					int loan_state = bloanVO.getLoan_state();
					model.addAttribute("last_loan_state",loan_state);
					
					System.out.println("bloanVO.b_no : "+bloanVO.getB_no());												
					bloanVO.setB_no(b_no);
					bloanVO.setUser_no(user_no);
					
		        
					
/*			        //반납 예정일	        											
					String schedule = bloanVO.getReturn_sche();
					String[] date = schedule.split("/");
					Calendar cal = Calendar.getInstance();
					
					cal.set(Calendar.YEAR, Integer.parseInt(date[0]));
					cal.set(Calendar.MONTH, Integer.parseInt(date[1])-1);
					cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(date[2]));
			        
					cal.add(Calendar.DAY_OF_MONTH, 3);
					
					SimpleDateFormat fmt = new SimpleDateFormat();			         
			        fmt.applyPattern("yyyy/MM/dd");
			        
					bloanVO.setReturn_sche(fmt.format(cal.getTime()));*/
					
					
					
			        //대여상태
					bloanVO.setLoan_state(1);	
					
					renewCnt += lidao.loanrenew(bloanVO);	
					
					
				}								
			}
			//연장된 책의 권수 누적
			model.addAttribute("renewCnt",renewCnt);				
		}			
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
		
		String b_title = req.getParameter("b_title");
		String b_author = req.getParameter("b_author");
		String b_global = req.getParameter("b_global");
		String b_category = req.getParameter("b_category");
		
		System.out.println("제목:" + b_title);
		System.out.println("작가:" + b_author);
		System.out.println("대분류:" + b_global);
		System.out.println("중분류:" + b_category);
		
		
		if(b_title != null) {
			map.put("b_title", "%" + b_title + "%");
		} 	
		
		if(b_author != null) {
			map.put("b_author", "%" + b_author + "%");
		} 
		
		if(!b_global.equals("0")) {
			map.put("b_global", Integer.parseInt(b_global));
			System.out.println("대분류:" +Integer.parseInt(b_global));
		} 
		
		if(!b_category.equals("0")) {
			System.out.println("중분류:");
			map.put("b_category", Integer.parseInt(b_category));
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
			
			//책 정보 가져오기
			ArrayList<BookVO> bVOs = lidao.booksearch(map);
			
			
			model.addAttribute("bVOs",bVOs);
			
			
			
			//관리자일 시에는 해당 도서의 대여정보도 가져온다
			String id = (String)req.getSession().getAttribute("id");
			
			System.out.println("관리자있음 id : " + id);
			if(id != null && id.substring(0,1).equals("0")) {
				
				ArrayList<BookLoanVO> bloanVOs = new ArrayList<BookLoanVO>();
				
				for(int i=0; i<bVOs.size(); i++) {
					
					Map<String,Object> loanmap = new HashMap<String,Object>();
					loanmap.put("b_no",bVOs.get(i).getB_no());
					

					System.out.println("b_no : " + bVOs.get(i).getB_no());
					
					BookLoanVO bloanVO = lidao.loanlistOne(loanmap);					
					bloanVOs.add(bloanVO);									
				}
				
				model.addAttribute("bloanVOs",bloanVOs);
				System.out.println("bloanVOs.loan_state : " + bloanVOs.toString());
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


	
	//관리자 : 도서 대여 기록 조회
	@Override
	public void lib_loanSuperlist(HttpServletRequest req, Model model) {
		
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
		
		
		int loan_state = Integer.parseInt(req.getParameter("loan_state"));
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(loan_state == 1) {//대여목록 
			map.put("loan_state", 1);
		} else if(loan_state == 12) {//반납목록
			map.put("loan_state", 12);
		} else if(loan_state == 11) {//반납예정 목록
			map.put("loan_state", 11);
		} else if(loan_state == 2) {//예약목록
			map.put("loan_state", 2);
		}
		
		
		//관리자일 때는 전체 조회, 이용자는 본인 것만 조회  if(adId != null)
		cnt = lidao.loanCnt(map);
		System.out.println("출력될 목록 개수 : "+ cnt);

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
			System.out.println("1111");
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<BookLoanVO> bloanVOs = lidao.loanlist(map);

			model.addAttribute("bloanVOs",bloanVOs);
		}
		
		//6단계. 처리 결과 넘기기
		model.addAttribute("cnt", cnt);//글 갯수
		model.addAttribute("number", number);//글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		model.addAttribute("loan_state",loan_state);
		if(cnt>0) { //글이 하나 이상 있을 때 
			model.addAttribute("startPage", startPage);//시작 페이지
			model.addAttribute("endPage", endPage);//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);//페이지 블럭
			model.addAttribute("pageCount", pageCount);//페이지 갯수
			model.addAttribute("currentPage", currentPage);//현재 페이지	
			
		}
	
		String viewNum = req.getParameter("viewNum");
		model.addAttribute("viewNum",viewNum);
	
	}
	
	


	
	
	
	//전체 좌석 현황 조회
	@Override
	public void lib_viewSeat(HttpServletRequest req, Model model) {
		
		String rdRoom_no = req.getParameter("rdRoom_no");
		System.out.println("rdRoom_no : "+rdRoom_no);
		
		String id = (String)req.getSession().getAttribute("id");		
		//관리자가 아닐 시, 본인이 이용 중인 좌석 읽어오기
		if(id.substring(0, 1) != "0") {
			Map<String,Object> map = new HashMap<String,Object>();	
			map.put("user_no", id);
			
			SeatVO mySeat = lidao.seatUser(map);			
			model.addAttribute("mySeat",mySeat);
		} 
		
		ArrayList<SeatVO> sVOs = lidao.viewSeat(rdRoom_no);		
		model.addAttribute("sVOs", sVOs);
	}



	//좌석 이용 등록
	@Override
	public void lib_seat_use(HttpServletRequest req, Model model) {
		
		int insertCnt = 0;
		
		String rdRoom_no = req.getParameter("rdRoom_no");
		int seat_no = Integer.parseInt(req.getParameter("seat_no"));
				
		String user_no = null;
		String id = (String)req.getSession().getAttribute("id");
		//관리자일 시
		if(id.substring(0, 1).equals("0")) {
			//화면에서 입력받은 아이디를 가져온다
			user_no = req.getParameter("user_no"); 
		} else {
			user_no = id;
		}
		
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
		model.addAttribute("certiry",certiry);		
		
		//증명 완료 시, 업데이트 처리
		if(certiry == 1) {
			//해당 이용자가 이미 이용 중인 좌석이 있는지 확인			
			int selectCnt = lidao.seatUserCnt(user_no);			
			model.addAttribute("selectCnt",selectCnt);
			
			//중복되지 않는다면
			if(selectCnt == 0) {
				//선택된 좌석의 정보 가져오기		
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("seat_no", seat_no);
				map.put("rdRoom_no", rdRoom_no);
				
				SeatVO sVO = new SeatVO();
				sVO = lidao.seatOne(map);
								
				int state = sVO.getSeat_state();				
				
		        if(state == 0) {			        
		        	System.out.println("state:"+state);
		        	sVO.setUser_no(user_no);
		        	
					//시작 시각 : 현재 시간
					/*java.sql.Date sqldate = new java.sql.Date(System.currentTimeMillis());
					sVO.setSeat_st_dt(sqldate);*/
					
					/*SimpleDateFormat fmt = new SimpleDateFormat();			         
			        fmt.applyPattern("yyyy/MM/dd HH:MM:SS");
			        
					System.out.println(fmt.format(cal.getTime()));*/
					
					//종료 시각 : 현재에서 10분 +
				/*	Calendar cal = Calendar.getInstance();
					cal.add(Calendar.MINUTE, 10);
					sVO.setSeat_end_dt(cal.getTime());*/
					
					sVO.setseat_usetime("10MI");
					sVO.setSeat_state(1);
					
					insertCnt = lidao.seatinsert(sVO);
					model.addAttribute("insertCnt",insertCnt);
					model.addAttribute("rdRoom_no",rdRoom_no);	
					model.addAttribute("seat_no",seat_no);	
		        }					
			}			
		}
	}


	
	//좌석 이용 정보 보기
	@Override
	public void lib_seat_user(HttpServletRequest req, Model model) {
		
		int seat_no = Integer.parseInt(req.getParameter("seat_no"));
		String rdRoom_no = req.getParameter("rdRoom_no");
				
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("seat_no", seat_no);
		map.put("rdRoom_no", rdRoom_no);	
		
		SeatVO sVO = lidao.seatUser(map);
		req.setAttribute("sVO", sVO);
		model.addAttribute("sVO",sVO);
	}


	//좌석 이용 중지
	@Override
	public void lib_seat_stopPro(HttpServletRequest req, Model model) {
		
		int updateCnt=0;
		
		int seat_no = Integer.parseInt(req.getParameter("seat_no"));
		String rdRoom_no = req.getParameter("rdRoom_no");
		
		String user_no = null;
		String id = (String)req.getSession().getAttribute("id");
		//관리자일 시
		if(id.substring(0, 1).equals("0")) {			
			user_no = req.getParameter("user_no"); 
		} else {
			user_no = id;
		}
		
		System.out.println("seat_no:"+seat_no);
		System.out.println("rdRoom_no:"+rdRoom_no);
		System.out.println("user_no:"+user_no);
		
		//선택된 좌석의 정보 가져오기		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("seat_no", seat_no);
		map.put("rdRoom_no", rdRoom_no);
		map.put("user_no", user_no);
		
		SeatVO sVO = new SeatVO();
		sVO = lidao.seatOne(map);
		
		int state = sVO.getSeat_state();
		
		if(state == 1) {
			System.out.println("state:"+state);
        	sVO.setSeat_st_dt(null);
        	sVO.setSeat_end_dt(null);
        	sVO.setUser_no(null);
        	sVO.setseat_usetime(null);
        	sVO.setSeat_state(0);
        	
        	updateCnt = lidao.seatupdate(sVO);
        	model.addAttribute("updateCnt",updateCnt);
		}
 	
		model.addAttribute("rdRoom_no",rdRoom_no);
		model.addAttribute("seat_no",seat_no);
	}


	//마이 라이브러리
	@Override
	public void lib_myLibrary(HttpServletRequest req, Model model) {
		
		String user_no = (String)req.getSession().getAttribute("id");
		
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
		
	
		cnt = lidao.myloanCnt(user_no);
		System.out.println("출력될 목록 개수 : "+ cnt);

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
			
			ArrayList<BookLoanVO> bloanVOs = lidao.myloan(user_no);
			model.addAttribute("bloanVOs",bloanVOs);
			
			ArrayList<BookVO> bVOs = new ArrayList<BookVO>();
			//대여한 책의 정보 가져오기
			for(int i=0; i<bloanVOs.size(); i++) {
				String b_no = bloanVOs.get(i).getB_no();
				BookVO bVO = lidao.bookinfo(b_no);
				bVOs.add(bVO);
				System.out.println("bVOs:" + bVOs.get(i).getB_isbn());	
			}
			model.addAttribute("bVOs",bVOs);
		}
		
		//6단계. 처리 결과 넘기기
		model.addAttribute("cnt", cnt);//글 갯수
		model.addAttribute("number", number);//글번호
		model.addAttribute("pageNum", pageNum);//페이지 번호
		
		if(cnt>0) { //글이 하나 이상 있을 때 
			model.addAttribute("startPage", startPage);//시작 페이지
			model.addAttribute("endPage", endPage);//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);//페이지 블럭
			model.addAttribute("pageCount", pageCount);//페이지 갯수
			model.addAttribute("currentPage", currentPage);//현재 페이지				
		}		
	}


	
	//도서 현황(도서 안내페이지)
	@Override
	public void lib_situation(HttpServletRequest req, Model model) {
		ArrayList<SituationVO> stuVOs = new ArrayList<SituationVO>();
		stuVOs = lidao.bookCateSum();
		
		for(int i=0; i<stuVOs.size(); i++) {
			System.out.println("stuVOs:"+stuVOs.get(i).getB_global());
		}
		
		model.addAttribute("stuVOs",stuVOs);
	}
	
}
