package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.Criteria;
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
	public void register(NoticeVO board) {

		log.info("register......" + board);

		mapper.insertSelectKey(board);
	}

	@Override
	public NoticeVO get(int bno) {

		log.info("get......" + bno);

		return mapper.read(bno);

	}

	@Override
	public boolean modify(NoticeVO board) {

		log.info("modify......" + board);

		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(int bno) {

		log.info("remove...." + bno);

		return mapper.delete(bno) == 1;
	}

	// @Override
	// public List<NoticeVO> getList() {
	//
	// log.info("getList..........");
	//
	// return mapper.getList();
	// }

	@Override
	public List<NoticeVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);

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

}