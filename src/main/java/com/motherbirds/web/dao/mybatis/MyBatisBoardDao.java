package com.motherbirds.web.dao.mybatis;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.motherbirds.web.dao.BoardDao;
import com.motherbirds.web.entity.Board;




public class MyBatisBoardDao implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Board get(String id) {
		BoardDao boardDao;
		boardDao = sqlSession.getMapper(BoardDao.class);
		return boardDao.get(id);
	}

	@Override
	public List<Board> getList() {
		BoardDao boardDao;
		boardDao = sqlSession.getMapper(BoardDao.class);
		return boardDao.getList();
	}

	@Override
	public int add(Board id) {
		BoardDao boardDao;
		boardDao = sqlSession.getMapper(BoardDao.class);
		return boardDao.add(id);
	}

	@Override
	public int delete(String id) {
		BoardDao boardDao;
		boardDao = sqlSession.getMapper(BoardDao.class);
		return boardDao.delete(id);
	}

	@Override
	public int update(Board id) {
		BoardDao boardDao;
		boardDao = sqlSession.getMapper(BoardDao.class);
		return boardDao.update(id);
	}

	
	
	
	
}
