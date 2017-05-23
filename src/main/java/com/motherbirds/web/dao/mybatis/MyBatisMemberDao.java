package com.motherbirds.web.dao.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.motherbirds.web.dao.MemberDao;
import com.motherbirds.web.entity.Member;

public class MyBatisMemberDao implements MemberDao {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int add(String id, String pwd) {
		MemberDao memberDao;
		memberDao = sqlSession.getMapper(MemberDao.class);
		
		return memberDao.add(id, pwd);
	}

	@Override
	public int addRole(String id, String auth) {
		MemberDao memberDao;
		memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.addRole(id, auth);
	}

	@Override
	public int isExistId(String id) {
		MemberDao memberDao;
		memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.isExistId(id);
	}

	

}
