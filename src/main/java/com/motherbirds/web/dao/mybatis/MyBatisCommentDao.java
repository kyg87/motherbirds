package com.motherbirds.web.dao.mybatis;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.motherbirds.web.dao.CommentDao;
import com.motherbirds.web.entity.Comment;






public class MyBatisCommentDao implements CommentDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Comment> getList(String boardId, int page) {
		CommentDao commentDao;
		commentDao = sqlSession.getMapper(CommentDao.class);
		return commentDao.getList(boardId, page);
	}

	@Override
	public int add(Comment comment) {
		CommentDao commentDao;
		commentDao = sqlSession.getMapper(CommentDao.class);
		return commentDao.add(comment);
	}

	@Override
	public int delete(String boardId) {
		CommentDao commentDao;
		commentDao = sqlSession.getMapper(CommentDao.class);
		return commentDao.delete(boardId);
	}

	@Override
	public int getSize(String boardId) {
		CommentDao commentDao;
		commentDao = sqlSession.getMapper(CommentDao.class);
		return commentDao.getSize(boardId);
	}

	@Override
	public Comment get(String boardId) {
		CommentDao commentDao;
		commentDao = sqlSession.getMapper(CommentDao.class);
		return commentDao.get(boardId);
	}



	
	
	
	
}
