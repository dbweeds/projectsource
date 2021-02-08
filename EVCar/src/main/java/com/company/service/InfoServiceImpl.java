package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.CarInfoVO;
import com.company.domain.InfoCriateria;
import com.company.mapper.InfoMapper;

@Service
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private InfoMapper mapper;
	
	@Override
	public List<CarInfoVO> getList(InfoCriateria cri) {
		return mapper.list(cri);
	}

	@Override
	public boolean regist(CarInfoVO info) {
		return mapper.insert(info)>0?true:false;
	}

	@Override
	public boolean remove(int bno) {
		return mapper.delete(bno)>0?true:false;
	}

	@Override
	public boolean modify(CarInfoVO info) {
		return mapper.update(info)>0?true:false;
	}

	@Override
	public CarInfoVO getRow(int bno) {
		return mapper.read(bno);
	}

	@Override
	public int getTotalCnt() {
		return mapper.totalCnt();
	}

	//검색 못함...
}
