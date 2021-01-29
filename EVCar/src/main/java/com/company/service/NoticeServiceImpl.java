package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.NoticeVO;
import com.company.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public void register(NoticeVO notice) {
		
		log.info("register..."+notice);
		
		mapper.insertSelectKey(notice);
	}

	@Override
	public NoticeVO get(int bno) {
		
		log.info("get..."+bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		
		log.info("modify..." + notice);
		
		return mapper.update(notice) == 1;
	}

	@Override
	public boolean remove(int bno) {
		
		log.info("remove..." + bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<NoticeVO> getList() {
		
		log.info("getList...");
		
		return mapper.getList();
	}

}
