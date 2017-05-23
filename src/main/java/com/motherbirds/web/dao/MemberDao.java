package com.motherbirds.web.dao;

import com.motherbirds.web.entity.Member;

public interface MemberDao {

	//회원 추가
	int add(String id,String pwd);
	//등록된 회원에 권한 추가
	int addRole(String id,String auth);
	
	int isExistId(String id);
}
