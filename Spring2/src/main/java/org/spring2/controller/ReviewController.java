package org.spring2.controller;


import org.spring2.model.RICriteriaVO;
import org.spring2.model.RIPageVO;
import org.spring2.model.ReviewVO;
import org.spring2.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService rs;
	
	// 리뷰리스트, 페이징
	@RequestMapping(value = "/board/newreview", method = RequestMethod.GET)
	public String list(Model model,RICriteriaVO cri) {
		// 리스트
		model.addAttribute("list",rs.list(cri));
		
		// 전체 평점 건수
		int total = rs.total(cri);
		System.out.println("total :"+total);
		
		// 각 평점 건수
		System.out.println("controller 평점1 건수 : " +rs.scope1cnt(cri));
		model.addAttribute("sc1", rs.scope1cnt(cri));
		System.out.println("controller 평점2 건수 : " +rs.scope2cnt(cri));
		model.addAttribute("sc2", rs.scope2cnt(cri));
		System.out.println("controller 평점3 건수 : " +rs.scope3cnt(cri));
		model.addAttribute("sc3", rs.scope3cnt(cri));
		System.out.println("controller 평점4 건수 : " +rs.scope4cnt(cri));
		model.addAttribute("sc4", rs.scope4cnt(cri));
		System.out.println("controller 평점5 건수 : " +rs.scope5cnt(cri));
		model.addAttribute("sc5", rs.scope5cnt(cri));
		
		// 평점 평균
		System.out.println("controller 평점평균 : "+rs.scopeavg(cri));
		model.addAttribute("savg",rs.scopeavg(cri));
		
		// 페이징
		model.addAttribute("paging",new RIPageVO(cri, total));
		return "/board/newreview";
	}
	// 리뷰 작성(get)
	@RequestMapping(value = "/newreview/write", method = RequestMethod.GET)
	public String writeGet() {
		System.out.println("write연결 get");
		return "/board/newreview";
	}
	// 리뷰 작성(post)
	@RequestMapping(value = "/newreview/write", method = RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody ReviewVO rvo){
		int result = rs.write(rvo);
		
		System.out.println("writecontroller"+rvo);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
