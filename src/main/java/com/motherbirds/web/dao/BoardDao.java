package com.motherbirds.web.dao;

import java.util.List;

import com.motherbirds.web.entity.Board;

public interface BoardDao {

	Board get(String id);
	
	List<Board> getList();

	int add(Board board);

	int delete(String id);

	int update(Board id);
}
