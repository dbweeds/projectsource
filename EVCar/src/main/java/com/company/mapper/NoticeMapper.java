package com.company.mapper;

import java.util.List;

import com.company.domain.NoticeVO;

public interface NoticeMapper {

	//전체 조회
	public List<NoticeVO> getList();
	
	public void insert(NoticeVO notice);
	
	public void insertSelectKey(NoticeVO notice);
	
	public NoticeVO read(int bno);
	
	public int delete(int bno);
	
	public int update(NoticeVO notice);
}
