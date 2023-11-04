package com.java.service;

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
	
	public void insertQna(BoardVO vo) {
		boardDAOImpl.insertQna(vo);
	}

}
