package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.company.domain.Criteria;
import com.company.domain.ReplyPageDTO;
import com.company.domain.ReplyVO;
import com.company.mapper.QAMapper;
import com.company.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

  @Autowired
  private ReplyMapper mapper;
  @Autowired
  private QAMapper qMapper;

  
  
  @Override
  public int register(ReplyVO vo) {

    log.info("register......" + vo);
    qMapper.updateReplyCnt(vo.getBno());
    return mapper.insert(vo);

  }

  @Override
  public ReplyVO get(int rno) {

    log.info("get......" + rno);

    return mapper.read(rno);

  }

  @Override
  public int modify(ReplyVO vo) {

    log.info("modify......" + vo);

    return mapper.update(vo);

  }

  @Override
  public int remove(int rno) {
    log.info("remove...." + rno);
    int bno = qMapper.getBno(rno);
    qMapper.removeReplyCnt(bno);

    return mapper.delete(rno);

  }

  @Override
  public List<ReplyVO> getList(Criteria cri, int bno) {

    log.info("get Reply List of a Board " + bno);

    return mapper.getListWithPaging(cri, bno);

  }
  
  @Override
  public ReplyPageDTO getListPage(Criteria cri, int bno) {
       
    return new ReplyPageDTO(
        mapper.getCountByBno(bno), 
        mapper.getListWithPaging(cri, bno));
  }

}

