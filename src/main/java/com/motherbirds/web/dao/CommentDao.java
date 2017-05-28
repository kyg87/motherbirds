package com.motherbirds.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.motherbirds.web.entity.Comment;



public interface CommentDao {
	/*List<Comment> getList(@Param("boardId")String boardId,@Param("page") int page);*/
	List<Comment> getList();
	int add(Comment comment);
	int delete(String boardId);
	int getSize(String boardId);
	
	Comment get(String boardId);
}
