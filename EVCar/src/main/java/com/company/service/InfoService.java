package com.company.service;

import java.util.List;

import com.company.domain.CarInfoVO;
import com.company.domain.CarSearchVO;
import com.company.domain.InfoCriateria;

public interface InfoService {
	
	//차량등록
	public boolean regist(CarInfoVO info);
	
	//삭제
	public boolean remove(int bno);
	
	//수정
	public boolean modify(CarInfoVO info);
	
	//목록
	public List<CarInfoVO> getList(CarSearchVO vo); 

	//조회(상세페이지)
	public CarInfoVO getRow(int bno);
	
	//게시물수 6
	public int getTotalCnt(CarSearchVO vo);
}
