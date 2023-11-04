package com.java.repository;

import java.util.HashMap;
import java.util.List;

import com.java.domain.BoardVO;

public interface BoardDAO {
	
	//qna게시물등록
	public void insertQna(BoardVO vo);
	
	//qna게시판에서 목록 불러오기
	public List<BoardVO> board_all(BoardVO vo);

}
