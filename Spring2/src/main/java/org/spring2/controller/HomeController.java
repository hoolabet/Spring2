package org.spring2.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring2.model.BoardVO;
import org.spring2.model.OrderVO;
import org.spring2.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	BoardService bs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("homeImage", bs.homeImage());
		return "home";
	}
	@RequestMapping(value = "/homeImage", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<BoardVO>> homeImage(){
		System.out.println("홈이미지"+bs.homeImage());
		return new ResponseEntity<>(bs.homeImage(),HttpStatus.OK);
	}
}
