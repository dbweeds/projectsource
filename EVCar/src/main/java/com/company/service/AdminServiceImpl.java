package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.mapper.AdminMapper;



@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper mapper;

	@Override
	public String adminLogin(String adminId, String adminPassword) {
		return mapper.adminLogin(adminId, adminPassword);
	}
	
	
	}
