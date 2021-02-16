package com.company.service;

import java.util.List;

import com.company.domain.Criteria;
import com.company.domain.ReplyPageDTO;
import com.company.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);

	public ReplyVO get(int rno);

	public int modify(ReplyVO vo);

	public int remove(int rno);

	public List<ReplyVO> getList(Criteria cri, int bno);
	
	public ReplyPageDTO getListPage(Criteria cri, int bno);

}
