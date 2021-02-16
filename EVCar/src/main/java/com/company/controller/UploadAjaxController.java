package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.FileAttach;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UploadAjaxController {
	

	@PostMapping(value = "/uploadFile", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<FileAttach>> uploadPost(MultipartFile[] uploadFile) {
		log.info("업로드 요청");

		String uploadFolder = "C:\\upload";
		String uploadFileName = null;

		// 폴더 생성
		String uploadFolderPath = getFolder();// 2021\\01\\19
		File uploadPath = new File(uploadFolder, uploadFolderPath);// d:\\upload\\2021\\01\\19

		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		// 첨부 파일에 대한 정보를 담을 객체 생성
		List<FileAttach> attachList = new ArrayList<>();

		for (MultipartFile f : uploadFile) {
			log.info("---------------------------");
			log.info("upload file name : " + f.getOriginalFilename());
			log.info("upload file size : " + f.getSize());

			// 파일명 중복 해결
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();

			FileAttach attach = new FileAttach();
			attach.setFileName(f.getOriginalFilename());
			attach.setUploadPath(uploadFolderPath);
			attach.setUuid(uuid.toString());

			File saveFile = new File(uploadPath, uploadFileName);

			try {
				// 서버에 저장
				f.transferTo(saveFile);
				attachList.add(attach);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

		}
		return new ResponseEntity<List<FileAttach>>(attachList, HttpStatus.OK);
	}

	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> download(String fileName) {
		log.info("다운로드 요청 : " + fileName);

		Resource resource = new FileSystemResource("C:\\upload\\" + fileName);

		// uuid값 제거 후 파일 다운로드 하기
		String resourceName = resource.getFilename().substring(resource.getFilename().indexOf("_") + 1);
		log.info(resourceName);

		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-Disposition",
					"attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

	// 날짜에 따라 폴더 생성하기
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
		// 폴더 구분시 사용하는 문자 - windows \,리눅스 /->File.separator == 운영체제에따라 저걸 붙혀줌
	}
}
