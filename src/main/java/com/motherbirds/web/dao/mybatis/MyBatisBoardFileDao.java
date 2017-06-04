package com.motherbirds.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.motherbirds.web.dao.BoardFileDao;
import com.motherbirds.web.entity.BoardFile;

public class MyBatisBoardFileDao  implements BoardFileDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BoardFile get(String id) {
		
		BoardFileDao fileDao;
		fileDao = sqlSession.getMapper(BoardFileDao.class);
		
		return fileDao.get(id);
	}

	@Override
	public List<BoardFile> getList() {
		BoardFileDao fileDao;
		fileDao = sqlSession.getMapper(BoardFileDao.class);
		
		return fileDao.getList();
	}

	@Override
	public int add(BoardFile board) {
		BoardFileDao fileDao;
		fileDao = sqlSession.getMapper(BoardFileDao.class);
		
		return fileDao.add(board);
	}

	@Override
	public int delete(String id) {
		BoardFileDao fileDao;
		fileDao = sqlSession.getMapper(BoardFileDao.class);
		
		return fileDao.delete(id);
	}

	@Override
	public int update(BoardFile id) {
		BoardFileDao fileDao;
		fileDao = sqlSession.getMapper(BoardFileDao.class);
		
		return fileDao.update(id);
	}

}
