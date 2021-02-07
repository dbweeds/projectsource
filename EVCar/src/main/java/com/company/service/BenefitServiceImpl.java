package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.BenefitVO;
import com.company.mapper.BenefitMapper;
@Service
public class BenefitServiceImpl implements BenefitService {
	@Autowired
	BenefitMapper mapper;
	
	@Override
	public double getFuel(String model) {
		return mapper.getFuel(model);
	}

	@Override
	public BenefitVO getVO(String model) {
		return mapper.getVO(model);
	}

}
