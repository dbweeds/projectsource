package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.company.domain.Criteria;
import com.company.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);

	public ReplyVO read(int bno);

	public int delete(int bno);

	public int update(ReplyVO reply);

	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") int bno);

	public int getCountByBno(int bno);
}
