package com.spring.projectFinal.SMVO;

// 성적
public class GpaVO {

	private int st_no; // 학번
	private int lec_no; // 강의번호
	private String gpa_semester; // 학기
	private int gpa; // 평점

	public int getSt_no() {
		return st_no;
	}

	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}

	public int getLec_no() {
		return lec_no;
	}

	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}

	public String getGpa_semester() {
		return gpa_semester;
	}

	public void setGpa_semester(String gpa_semester) {
		this.gpa_semester = gpa_semester;
	}

	public int getGpa() {
		return gpa;
	}

	public void setGpa(int gpa) {
		this.gpa = gpa;
	}
}