package com.company.service;

import java.util.List;

import com.company.domain.Criteria;
import com.company.domain.QAVO;

public interface QAService {

	public void register(QAVO QA);
	
	public QAVO get(int bno);
	
	public boolean modify(QAVO QA);
	
	public boolean remove(int bno);
	
	public List<QAVO> getList(Criteria cri);
	
	public boolean plusCnt(int bno);
	
	public int getTotalCount(Criteria cri);
	
	public int checkPw(int password);
	
}
