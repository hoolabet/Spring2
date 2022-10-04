package org.spring2.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.spring2.model.CriteriaVO;

import org.spring2.model.OrderVO;
import org.spring2.model.PageVO;

import org.spring2.model.ReviewLikeVO;
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
import org.springframework.web.bind.annotation.RequestBody;
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
	public ResponseEntity<ArrayList<ReviewVO>> getList(@PathVariable int pno , CriteriaVO cri){
		String n = String.valueOf(pno);
		cri.setSearch(n);
		//cri.setAmount(5);
		int total = rs.total(cri);
		PageVO p = new PageVO(cri,total);
		System.out.println(p);
		System.out.println(rs.list(cri));
		return new ResponseEntity<>(rs.list(cri),HttpStatus.OK);
	}
	@RequestMapping(value = "/reviewable", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<OrderVO>> reviewable(OrderVO ovo){
		System.out.println("리뷰셀렉"+rs.reviewable(ovo));
		
		return new ResponseEntity<>(rs.reviewable(ovo),HttpStatus.OK);
	}
	
	//좋아요 버튼 체크
	@RequestMapping(value = "/likecheck", method = RequestMethod.GET)
	public ResponseEntity<Integer> likelist(ReviewLikeVO rvo) {
		return new ResponseEntity<>(rs.findLike(rvo), HttpStatus.OK);
	}
	//좋아요 버튼 클릭시 추가
	@RequestMapping(value = "/likeadd", method = RequestMethod.POST)
	public ResponseEntity<String> likeAdd(@RequestBody ReviewLikeVO rvo) {
		int result=rs.likeAdd(rvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//좋아요 버튼 클릭시 삭제
	@RequestMapping(value = "/likeremove", method = RequestMethod.DELETE)
	public ResponseEntity<String> likeRemove(@RequestBody ReviewLikeVO rvo) {
		int result=rs.likeRemove(rvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//좋아요 버튼클릭시 ReviewVO likeNum컬럼 수정
	@RequestMapping(value = "/likeupdate", method = RequestMethod.PUT)
	public ResponseEntity<String> likeUpdate(@RequestBody ReviewVO rvo) {
		System.out.println(rvo);
		int result=rs.likeUpdate(rvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 리뷰 작성(get)
	@RequestMapping(value = "/board/reviewwrite", method = RequestMethod.GET)
	public void writeGet(Model model,CriteriaVO cri,int pno) {
		String n = String.valueOf(pno);
		cri.setSearch(n);
		model.addAttribute("pro",rs.pro(cri));
	}	
	// 리뷰 작성(post)
	@RequestMapping(value = "/board/reviewwrite", method = RequestMethod.POST)
	public String writePost (ReviewVO rvo,Model model,CriteriaVO cri) {
		rvo.setContent(rvo.getContent().replaceAll("\r\n","<br>"));
		rs.write(rvo);
		cri.setSearch(String.valueOf(rvo.getPno()));
		return "redirect:/board/detail?pno="+cri.getSearch();
	}
	//리뷰 삭제
	@RequestMapping(value = "/board/reviewremove", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove( @RequestBody ReviewVO rvo) {
		int result=rs.remove(rvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//리뷰 수정
	@RequestMapping(value = "/board/reviewmodify", method = RequestMethod.GET)
	public void rModify(Model model,CriteriaVO cri,int pno, int rno, ReviewVO rvo) {
		String n = String.valueOf(pno);
		cri.setSearch(n);
		model.addAttribute("pro",rs.pro(cri));
		rvo.setPno(pno);
		rvo.setRno(rno);
		model.addAttribute("rlist", rs.findReview(rvo));
		System.out.println(rs.findReview(rvo));
	}
	@RequestMapping(value = "/board/reviewmodify", method = RequestMethod.POST)
	public String rModifyPost(ReviewVO rvo) {
		rvo.setContent(rvo.getContent().replaceAll("\r\n","<br>"));
		rs.modify(rvo);
		return "redirect:/board/detail?pno="+rvo.getPno();
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
		
		String uploadFolder="D:\\01-STUDY\\upload";
		
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
		
		File file = new File("D:\\01-STUDY\\upload\\"+filename);
		
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
