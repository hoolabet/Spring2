package org.spring2.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.spring2.model.BoardVO;
import org.spring2.model.CartVO;
import org.spring2.model.ImageVO;
import org.spring2.model.MadeVO;
import org.spring2.model.MemberVO;
import org.spring2.service.BoardService;
import org.spring2.service.MadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MadeController {
	@Autowired
	MadeService ms;
	
	@Autowired
	BoardService bs;
	
	@RequestMapping(value = "/made/chooseForMade", method = RequestMethod.GET)
	public void made() {
	}
	
	@RequestMapping(value = "/made/chooseForMade", method = RequestMethod.POST)
	public void madePOST(MadeVO mvo) {
		ms.madeOrder(mvo);
	}
	
	@RequestMapping(value = "/made/list", method = RequestMethod.GET)
	public void madeList(HttpSession session, Model model) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)session.getAttribute("userInfo");
		model.addAttribute("made",ms.madeList(mvo.getId()));
	}
	
	@RequestMapping(value = "/madeaddproduct", method = RequestMethod.POST)
	public ResponseEntity<String> madeAddProduct(@RequestBody BoardVO bvo) {
		try {
			ImageVO ivo = new ImageVO();
			ivo.setUuid(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
			ivo.setFileName(Integer.toString(bvo.getCategory_type()));
			System.out.println(ivo);
			ms.addProduct(bvo);
			ms.madeAddPimage(ivo);
			return new ResponseEntity<>("success",HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/madeaddcart", method = RequestMethod.POST)
	public ResponseEntity<String> madeAddCart(@RequestBody CartVO cvo) {
		int result=ms.madeAddCart(cvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/maderemove", method = RequestMethod.DELETE)
	public ResponseEntity<String> madeRemove(@RequestBody MadeVO mvo) {
		int result=ms.madeRemove(mvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
