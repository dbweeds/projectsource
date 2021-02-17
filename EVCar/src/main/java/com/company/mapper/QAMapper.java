package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.Criteria;
import com.company.domain.QAVO;

public interface QAMapper {

	//전체 조회
	public List<QAVO> getList();
	
	public List<QAVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(QAVO QA);
	
	public void insertSelectKey(QAVO QA);
	
	public QAVO read(int bno);
	
	public int delete(int bno);
	
	public int update(QAVO QA);
	
	public boolean plusCnt(int bno);
	public int updateReplyCnt(int bno);
	public int getBno(int rno);
	public int removeReplyCnt(int bno);
	
	public int checkPw(@Param("password") int password,@Param("bno") int bno);
	
	public int replyCnt(QAVO QA);
	
	
}
