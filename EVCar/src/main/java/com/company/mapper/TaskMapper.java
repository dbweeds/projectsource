package com.company.mapper;

import java.util.List;

import com.company.domain.FileAttach;

public interface TaskMapper {
	public List<String> getThumbnail();
	public List<String> getCarpicture1();
	public List<String> getCarpicture2();
	public List<String> getCarpicture3();
	
	public List<FileAttach> getOldFiles();
}
