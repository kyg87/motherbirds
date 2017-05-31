package com.motherbirds.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.motherbirds.web.dao.BoardDao;
import com.motherbirds.web.dao.CommentDao;
import com.motherbirds.web.entity.Board;
import com.motherbirds.web.entity.Comment;



@Controller
@RequestMapping("/main/*")
public class MainController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private BoardDao boardDao;

	@Autowired
	private CommentDao commentDao;
	
	@RequestMapping("index")
	public String index(Model model) {

		
		List<Board> boardList = sqlSession.getMapper(BoardDao.class).getList();
		
		model.addAttribute("boardList", boardList);
		return "main.index";
	}
	
	@RequestMapping("detail")
	public String detail(@RequestParam("c") String id,
			Model model) {

		Board board = new Board();

		board = sqlSession.getMapper(BoardDao.class).get(id);
		board.setComments(sqlSession.getMapper(CommentDao.class).getList(id));

		model.addAttribute("n", board);
		
		return "main.detail";
	}
	
	@RequestMapping("reg")
	public String free() {

		return "main.free-reg";
	}
	
	
	@RequestMapping(value = "reg", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String free(Board board, 
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content, 
		
			@RequestParam(value = "memberId") String memberId
			) {
		
		board.setTitle(title);
		board.setContent(content);
		board.setMemberId(memberId);
		
		System.out.println(title);
		System.out.println(content);
		System.out.println(memberId);
		
		boardDao.add(board);
		//freeBoardDao.add(freeboard);

		return "redirect:detail?c=" + board.getId();

	}
	
	@RequestMapping(value = "board-comment-add", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String comment(Comment comment, 
			
			@RequestParam(value = "message") String message,
			@RequestParam(value = "boardId") String boardId, 
			@RequestParam(value = "memberId") String memberId
			
	) {
		
		comment.setComment(message);
		comment.setBoardId(boardId);
		comment.setMemberId(memberId);

		
		
		int result = commentDao.add(comment);
		
			
		return String.valueOf(result);

	}
	

}
