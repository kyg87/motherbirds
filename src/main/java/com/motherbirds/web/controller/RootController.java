package com.motherbirds.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class RootController {
	
	
	@RequestMapping("index")
	public String index() {

		return "index";
	}

	
}
