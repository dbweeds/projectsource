package com.company.service;

import com.company.domain.BenefitVO;

public interface BenefitService {
	public double getFuel(String model);
	public BenefitVO getVO(String model);
}
