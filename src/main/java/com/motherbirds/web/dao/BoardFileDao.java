package com.motherbirds.web.dao;

import java.util.List;

import com.motherbirds.web.entity.BoardFile;

public interface BoardFileDao {
	
	BoardFile get(String id);
	
	List<BoardFile> getList();

	int add(BoardFile board);

	int delete(String id);

	int update(BoardFile id);
}
