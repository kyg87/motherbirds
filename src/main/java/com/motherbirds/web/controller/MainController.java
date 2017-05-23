package com.motherbirds.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.motherbirds.web.entity.Board;

@Controller
@RequestMapping("/main/*")
public class MainController {


	@RequestMapping("index")
	public String index() {

		return "main.index";
	}
	
	@RequestMapping("detail")
	public String detail() {

		return "main.detail";
	}
	
	@RequestMapping("free-reg")
	public String free() {

		return "main.free-reg";
	}
	
	
	@RequestMapping(value = "reg", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String free(Board freeboard, 
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content, 
			@RequestParam(value = "contentSrc") String contentSrc,
			@RequestParam(value = "memberId") String memberId
			) {

		freeboard.setTitle(title);

		freeboard.setMemberId(memberId);
		
		
		
		//freeBoardDao.add(freeboard);

		return "redirect:free-detail?c=" + freeboard.getId();

	}

}
