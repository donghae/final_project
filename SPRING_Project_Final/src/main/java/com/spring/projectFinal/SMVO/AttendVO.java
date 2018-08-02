package com.spring.projectFinal.SMVO;

import java.sql.Date;

// 출결
public class AttendVO {

	private int attend_no; // 출석번호
	private int st_no; // 학번
	private int lec_no; // 강의번호
	private int attend_fl; // 출결여부
	private Date lec_dt; // 강의날짜

	public int getAttend_no() {
		return attend_no;
	}

	public void setAttend_no(int attend_no) {
		this.attend_no = attend_no;
	}

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

	public int getAttend_fl() {
		return attend_fl;
	}

	public void setAttend_fl(int attend_fl) {
		this.attend_fl = attend_fl;
	}

	public Date getLec_dt() {
		return lec_dt;
	}

	public void setLec_dt(Date lec_dt) {
		this.lec_dt = lec_dt;
	}
}