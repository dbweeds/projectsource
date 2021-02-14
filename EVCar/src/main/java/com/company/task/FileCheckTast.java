package com.company.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import com.company.mapper.TaskMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class FileCheckTast {
	// 어제날짜의 폴더를 알아낸 후 매일 새벽 2시에 자동으로 도는 프로그램
	// 데이터베이스에서 파일 리스트를 가져와서 현재 서버의 upload 폴더와 비교한 후
	// 데이터베이스와 일치하지 않은 파일 제거
	@Autowired
	private TaskMapper mapper;

	@Scheduled(cron = "1 * * * * *")
	public void checkFiles() {
		log.warn("File check Task run...");

		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		log.warn("1111111111File check Task run...");

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
