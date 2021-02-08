package com.company.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.Criteria;
import com.company.domain.QAVO;
import com.company.mapper.QAMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class QAServiceImpl implements QAService {

	@Autowired
	private QAMapper mapper;
	
	@Override
	public void register(QAVO QA) {
		
		log.info("QAregister..."+QA);

		mapper.insertSelectKey(QA);
	}

	@Override
	public QAVO get(int bno) {
		
		log.info("QAGet..."+bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(QAVO QA) {
		
		log.info("QAModify..."+QA);
		return mapper.update(QA) == 1;
	}

	@Override
	public boolean remove(int bno) {
		
		log.info("QAremove..."+bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<QAVO> getList(Criteria cri) {
		
		log.info("QAget List with criteria : "+cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public boolean plusCnt(int bno) {
		return mapper.plusCnt(bno);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public boolean checkPw(int password,int bno) {
		
		return mapper.checkPw(password,bno)>0?true:false;	
		 
	}

}
