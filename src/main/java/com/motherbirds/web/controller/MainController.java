package com.motherbirds.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.motherbirds.web.dao.BoardDao;
import com.motherbirds.web.dao.BoardFileDao;
import com.motherbirds.web.dao.CommentDao;
import com.motherbirds.web.entity.Board;
import com.motherbirds.web.entity.BoardFile;
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
	
	@Autowired
	private BoardFileDao boardFileDao;
	@Autowired
	private ServletContext context;
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
		
		
		BoardFile file = boardFileDao.get(id);
		System.out.println(file.getName());
		model.addAttribute("n", board);
		model.addAttribute("file", file);
		
		return "main.detail";
	}
	
	@RequestMapping("reg")
	public String free() {

		return "main.free-reg";
	}
	
	
	@RequestMapping(value = "board-reg", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String free(Board board,
			BoardFile boardFile,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "file", defaultValue="null") MultipartFile file,
			@RequestParam(value = "content") String content, 
			@RequestParam(value = "select", required = true )List<String> selects,
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

		
		if(!file.isEmpty()){
			
			String path = context.getRealPath("/resource/upload");
			
			//String path = "Motherbirds\\resources\\upload";
			
			File d = new File(path);
			if(!d.exists())//��ΰ� �������� �ʴ´ٸ�
				d.mkdir();
		
			String originalFilename = file.getOriginalFilename(); // fileName.jpg
		    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
			
		    String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
		    String fullPath = path + "\\" + rename;
		    
		    if (!file.isEmpty()) {
		        try {
		            byte[] bytes = file.getBytes();
		            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
		            stream.write(bytes);
		            stream.close();
		            //model.addAttribute("resultMsg", "������ ���ε� ����!");
		            System.out.println("���ε� ����");
		        } catch (Exception e) {
		            //model.addAttribute("resultMsg", "������ ���ε��ϴ� ���� �����߽��ϴ�.");
		        	System.out.println("���ε� ����");
		        }
		    } else {
		        //model.addAttribute("resultMsg", "���ε��� ������ �������ֽñ� �ٶ��ϴ�.");
		    	System.out.println("���ε� ���� x");
		    }
		    
		    fullPath = "\\Motherbirds\\resource\\upload\\";
		    
		  
		    boardFile.setBoardId(board.getId());
		    boardFile.setName(rename);
			
			boardFileDao.add(boardFile);
		    
		    System.out.println(fullPath);
		}
		
		
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
	
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}

}
