package com.company.mapper;

import com.company.domain.BenefitVO;

public interface BenefitMapper {
	public double getFuel(String model);
	public BenefitVO getVO(String model); 
}
