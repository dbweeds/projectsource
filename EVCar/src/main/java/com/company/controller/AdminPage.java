package com.company.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.mapper.TaskMapper;
import com.company.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminPage {
	@Autowired
	private TaskMapper mapper;
	
	@Autowired
	AdminService service;
	
	@GetMapping("/adminPage")
	public void adminPage() {
		log.info("admin 시작");
	}
	
	@PostMapping("/adminPage")
	public String adminLogin(String adminId,String adminPassword,RedirectAttributes attr,HttpSession session,HttpServletRequest req) {
		log.info(adminId);
		log.info(adminPassword);
		
		String admin = service.adminLogin(adminId, adminPassword);
		if(admin != null) {
			session.setAttribute("admin", admin);
			checkFiles(req);
			return "redirect:/";
		}else {
			attr.addFlashAttribute("error", "아이디와 비밀번호를 확인해주세요.");
			return "redirect:/adminPage";
		}
	}
	
	public void checkFiles(HttpServletRequest req) {
		
		log.warn("File check Task run...");


		// 어제날짜의 파일 정보 데이터베이스에서 가져오기
		List<String> thumbnailList = mapper.getThumbnail();
		List<String> carpicture1List = mapper.getCarpicture1();
		List<String> carpicture2List = mapper.getCarpicture2();
		List<String> carpicture3List = mapper.getCarpicture3();


		// list 구조를 stream 으로 변경(필터링,합계, 평균 ...,매핑 과같은 중간처리를 할 수 있음)
		Stream<String> thumbnailStream = thumbnailList.stream();
		Stream<String> carpicture1Stream = carpicture1List.stream();
		Stream<String> carpicture2Stream = carpicture2List.stream();
		Stream<String> carpicture3Stream = carpicture3List.stream();

		// map() : 스트림의 요소에 저장된 값 중에서 원하는 필드만 추출하거나 특정 형태로 변환시 사용
		Stream<Path> thumbnailPath = thumbnailStream
				.map(vo -> Paths.get( req.getServletContext().getRealPath("\\resources\\assets\\custom\\infoimage"), vo));
		List<Path> thumbnailListPath = thumbnailPath.collect(Collectors.toList());
		Stream<Path> carpicture1Path = carpicture1Stream
				.map(vo -> Paths.get( req.getServletContext().getRealPath("\\resources\\assets\\custom\\infoimage"), vo));
		List<Path> carpicture1ListPath = carpicture1Path.collect(Collectors.toList());
		Stream<Path> carpicture2Path = carpicture2Stream
				.map(vo -> Paths.get( req.getServletContext().getRealPath("\\resources\\assets\\custom\\infoimage"), vo));
		List<Path> carpicture2ListPath = carpicture2Path.collect(Collectors.toList());
		Stream<Path> carpicture3Path = carpicture3Stream
				.map(vo -> Paths.get( req.getServletContext().getRealPath("\\resources\\assets\\custom\\infoimage"), vo));
		List<Path> carpicture3ListPath = carpicture3Path.collect(Collectors.toList());

		File targetDir = Paths.get(req.getServletContext().getRealPath("\\resources\\assets\\custom\\infoimage")).toFile();
		File[] removeFiles = targetDir.listFiles(file -> thumbnailListPath.contains(file.toPath()) == false);

		for (File file : removeFiles) {
			file.delete();
		}
		removeFiles = targetDir.listFiles(file -> carpicture1ListPath.contains(file.toPath()) == false);
		
		for (File file : removeFiles) {
			file.delete();
		}
		removeFiles = targetDir.listFiles(file -> carpicture2ListPath.contains(file.toPath()) == false);
		
		for (File file : removeFiles) {
			file.delete();
		}
		removeFiles = targetDir.listFiles(file -> carpicture3ListPath.contains(file.toPath()) == false);
		
		for (File file : removeFiles) {
			file.delete();
		}

	}
}
