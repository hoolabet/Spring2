package org.spring2.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.spring2.model.ImageVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {

	// 날짜폴더만들기
	private String getFolder() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(date);
		return str.replace("-", "\\");
	}

	// 이미지파일 유효성검사
	public boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	@RequestMapping(value = "/uploadAjaxAction", method = RequestMethod.POST)
	public ResponseEntity<ArrayList<ImageVO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		ArrayList<ImageVO> list = new ArrayList();
		// 폴더 경로
		String uploadFolder = "D:\\01-STUDY\\upload";
		// 서버 업로드 경로와 getFolder 메서드의 날짜문자열을 이어서 하나의 폴더 생성
		File uploadPath = new File(uploadFolder, getFolder());
		// 폴더생성(D:\\01-STUDY\\upload\\현재날짜)
		if (uploadPath.exists() == false) {// uploadPath가 존재하지 않으면
			uploadPath.mkdirs(); // 부모디렉토리를 포함해 모든 디렉토리 생성
		}
		// for(배열명:변수명)
		for (MultipartFile multipartFile : uploadFile) {
			// ArrayList에 저장
			ImageVO imageVO = new ImageVO();
			System.out.println(multipartFile.getOriginalFilename());// 파일의 실제네임
			System.out.println(multipartFile.getSize()); // 파일 크기
			
			// UUID 적용(UUID_multipartFile.getOriginalFilename());
			UUID uuid = UUID.randomUUID();
			System.out.println("UUID=" + uuid.toString());
			
			// 파일저장
			String uploadFileName = uuid.toString() + "_" + multipartFile.getOriginalFilename();
			
			// 어느폴더에, 어떤파일이름으로
			File saveFile = new File(uploadPath, uploadFileName);
			System.out.println(saveFile);
			
			// 변수 리스트에 저장
			imageVO.setUploadPath(getFolder());
			imageVO.setFileName(multipartFile.getOriginalFilename());
			imageVO.setUuid(uuid.toString());

			// 파일을 전송(transferTo)
			try { // transferTo() 메서드에 예외가 없으면
				multipartFile.transferTo(saveFile); // 서버로 원본파일 전송
				// 내가 서버에 올리고자 하는 파일이 이미지이면,
				if (checkImageType(saveFile)) {
					imageVO.setImage(true);
					
					FileInputStream in = new FileInputStream(saveFile);
					// System.out.println(in);
					// 파일 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "/s_" + uploadFileName));
					// 섬네일형식의 파일 생성
					Thumbnailator.createThumbnail(in, thumbnail, 500, 300); // 이게 왜 안먹지....
					System.out.println("썸네일크기생성");
					thumbnail.close();
				} // if문(checkImageType메서드) 끝

				list.add(imageVO);
				System.out.println(list);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				System.out.println("오류남");
			} // trycatch문 끝
		} // for문 끝
		return new ResponseEntity<>(list, HttpStatus.OK);
	}// uploadAjaxPost 끝

	// 이미지 주소 생성
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName) {

		System.out.println(fileName);
		
		File file = new File("D:\\01-STUDY\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("이미지주소생성오류");
		}
		return result;
	} // getFile 끝

	// 다운로드 주소 생성
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<Resource> downloadFile(String fileName) {
		Resource resource = new FileSystemResource("D:\\01-STUDY\\upload\\" + fileName);
		// 다운로드 시 파일의 이름을 처리
		String resourceName = resource.getFilename();
		HttpHeaders headers = new HttpHeaders();
		try {
			// 다운로드 파일이름이 한글일 때, 깨지지 않게 하기 위한 설정
			headers.add("Content-Disposition", "attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}
}
