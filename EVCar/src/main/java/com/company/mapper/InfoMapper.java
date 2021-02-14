package com.company.mapper;

import java.util.List;

import com.company.domain.CarInfoVO;
import com.company.domain.CarSearchVO;
import com.company.domain.InfoCriateria;

public interface InfoMapper {
	
	public int insert(CarInfoVO info); //삽입
	public int delete(int bno); //삭제
	public int update(CarInfoVO info); //제목 내용
	public List<CarInfoVO> list(CarSearchVO vo); //리스트
	public CarInfoVO read(int bno); //상세페이지
	
	public int totalCnt(CarSearchVO vo); //페이지
	
	public int count(int bno);
	//검색
	public List<CarInfoVO> countList();
}
