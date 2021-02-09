package com.company.mapper;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
	public String adminLogin(@Param("adminId") String adminId,@Param("adminPassword") String adminPassword);
}
