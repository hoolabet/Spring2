package org.spring2.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.spring2.model.BoardVO;
import org.spring2.model.RICriteriaVO;
import org.spring2.model.RIPageVO;
import org.spring2.model.ReviewVO;
import org.spring2.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService rs;
	
	// 리뷰리스트 in 디테일
	@RequestMapping(value = "/reviewlist/{pno}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<ReviewVO>> getList(@PathVariable int pno){
		
		return new ResponseEntity<>(rs.Rlist(pno),HttpStatus.OK);
	}
	
	// 리뷰리스트, 페이징
	@RequestMapping(value = "/board/newreview", method = RequestMethod.GET)
	public String list(Model model,RICriteriaVO cri) {
		// 리스트
		model.addAttribute("list",rs.list(cri));
		System.out.println("controller"+rs.list(cri));
		
		// 전체 평점 건수
		int total = rs.total(cri);
		
		// 상품정보
		model.addAttribute("pro",rs.pro(cri));
		
		System.out.println("상품정보"+cri);
		
		// 각 평점 건수
		model.addAttribute("sc1", rs.scope1cnt(cri));
		model.addAttribute("sc2", rs.scope2cnt(cri));
		model.addAttribute("sc3", rs.scope3cnt(cri));
		model.addAttribute("sc4", rs.scope4cnt(cri));
		model.addAttribute("sc5", rs.scope5cnt(cri));
		
		// 평점 평균
		model.addAttribute("savg",rs.scopeavg(cri));
		
		// 페이징
		model.addAttribute("paging",new RIPageVO(cri, total));
		return "/board/newreview";
	}
	// 리뷰 작성(get)
	@RequestMapping(value = "/board/reviewwrite", method = RequestMethod.GET)
	public void writeGet(int pno) {
		rs.Rlist(pno);
		System.out.println("write연결 get="+pno);
	}	
	// 리뷰 작성(post)
	@RequestMapping(value = "/board/reviewwrite", method = RequestMethod.POST)
	public String writePost (ReviewVO rvo) {
		rs.write(rvo);
		System.out.println("write post");
		
		return "redirect:/board/detail";
	}
	
	// 파일 업로드 폴더 생성
	private String getFolder() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(date);
		
		return str.replace("-", "\\");
	}
	// 이미지 파일 구분 
	private boolean checkImageType(File file) {
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			System.out.println("contentType="+contentType);
			
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// 업로드(post)
	@RequestMapping(value = "/imgupload", method = RequestMethod.POST)
	public ResponseEntity<ArrayList<ReviewVO>> insertimg(MultipartFile[] uploadFile,ReviewVO rvo){
		
		System.out.println("imgupload 연결완료");
		ArrayList<ReviewVO> attachlist = new ArrayList<>();
		
		String uploadFolder="D:\\01-STUDY\\Spring2\\upload";
		
		File uploadPath = new File(uploadFolder,getFolder());
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
	
		for(MultipartFile multipartFile : uploadFile) {
			
			
			System.out.println(multipartFile.getOriginalFilename());
			System.out.println(multipartFile.getSize());
			
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			
			rvo.setUploadpath(getFolder());
			rvo.setFilename(multipartFile.getOriginalFilename());
			rvo.setUuid(uuid.toString());
			
			File saveFile = new File(uploadPath,uuid.toString()+"_"+multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
				
				if(checkImageType(saveFile)) {
					rvo.setImage(true);
					
					FileOutputStream thumnail = new FileOutputStream(new File(uploadPath,"s_"+uuid.toString()+"_"+multipartFile.getOriginalFilename()));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumnail,150,100);
					
					thumnail.close();
				}
				attachlist.add(rvo);
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return  new ResponseEntity<>(attachlist,HttpStatus.OK);
	}
	// 이미지 주소 생성
	@RequestMapping(value = "/board/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String filename){
		
		File file = new File("D:\\01-STUDY\\Spring2\\upload\\"+filename);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers,HttpStatus.OK);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
