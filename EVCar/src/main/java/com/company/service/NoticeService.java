package com.company.service;

import java.util.List;

import com.company.domain.NoticeVO;

public interface NoticeService {

	public void register(NoticeVO notice);
	
	public NoticeVO get(int bno);
	
	public boolean modify(NoticeVO notice);
	
	public boolean remove(int bno);
	
	public List<NoticeVO> getList();
	
	public boolean plusCnt(int bno);
}
