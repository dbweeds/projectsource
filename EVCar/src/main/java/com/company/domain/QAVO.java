package com.company.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QAVO {
	private int bno;
	private String title;
	private String writer;
	private String content;
	private int password;
	private Date regDate;
	private Date updateDate;
	private int readCnt;
	private int replyCnt;
	
	
	//비밀번호 확인
	public boolean checkPw(int password) {
		return this.password == password;
	}
}
