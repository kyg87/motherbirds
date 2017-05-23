package com.motherbirds.web.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.motherbirds.web.dao.MemberDao;

//import com.motherbirds.web.dao.MemberDao;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {
	
	@Autowired
	private MemberDao memberDao;

	
	@RequestMapping(value="singIn", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String singIn(
			@RequestParam(value="id")String id, 
			@RequestParam(value="pass")String pwd
			) {

		int result = memberDao.add(id, pwd);
		
		
		if(result > 0) memberDao.addRole(id, "ROLE_USER");
		
		
		return "redirect:../main/index";
	}
	
	
	@RequestMapping("mypage")
	public String mypage(Principal principal){
		
		String memberId = principal.getName();
		
		System.out.println("joinusController.java:" + memberId);
		
		return "redirect:../main/index";	
	}
	
	@RequestMapping("singin")
	public String singin(){
		
		return "joinus.singin";		
	}
	
	@RequestMapping("login")
	public String login(){
		
		return "joinus.login";		
	}
	
	@RequestMapping("isSingIn")
	@ResponseBody
	public String isSingIn(
			@RequestParam(value="id")String id){
		
		int result = memberDao.isExistId(id);
		
		
		return Integer.toString(result);
	}

	
	
}
