package com.motherbirds.web.dao;

import com.motherbirds.web.entity.Member;

public interface MemberDao {

	//ȸ�� �߰�
	int add(String id,String pwd);
	//��ϵ� ȸ���� ���� �߰�
	int addRole(String id,String auth);
	
	int isExistId(String id);
}
