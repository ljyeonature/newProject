package com.java.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.domain.BoardVO;
import com.java.repository.BoardDAO;

// 1) 어노테이션
@Service
public class BoardServiceImpl implements BoardService{
	
	// 2) 어노테이션
	@Autowired
	private BoardDAO boardDAOImpl;
	
	//QnA게시판 게시물등록
	public void insertQna(BoardVO vo) {
		boardDAOImpl.insertQna(vo);
	}
	
	//QnA게시판 게시물목록
	@Override
	public List<BoardVO> board_all(BoardVO vo){
		List<BoardVO> result = boardDAOImpl.board_all(vo);
		return result;
	}

}
