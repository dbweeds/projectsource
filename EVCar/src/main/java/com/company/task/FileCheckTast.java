package com.company.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.company.domain.FileAttach;
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

	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();

		c.add(Calendar.DATE, -1);
		String str = sdf.format(c.getTime());

		return str.replace("-", File.separator);
	}

	@Scheduled(cron = "* * 2 * * *")
	public void checkFiles() {
		log.warn("File check Task run...");

		// 어제날짜의 파일 정보 데이터베이스에서 가져오기
		List<FileAttach> fileList = mapper.getOldFiles();

		// list 구조를 stream 으로 변경(필터링,합계, 평균 ...,매핑 과같은 중간처리를 할 수 있음)
		Stream<FileAttach> stream = fileList.stream();

		// map() : 스트림의 요소에 저장된 값 중에서 원하는 필드만 추출하거나 특정 형태로 변환시 사용
		Stream<Path> filePath = stream
				.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()));
		List<Path> fileListPath = filePath.collect(Collectors.toList());

		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		File[] removeFiles = targetDir.listFiles(file -> fileListPath.contains(file.toPath()) == false);

		for (File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}

	}
}
