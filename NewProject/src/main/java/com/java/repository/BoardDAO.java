package com.java.repository;

import java.util.List;

import com.java.domain.BoardVO;

public interface BoardDAO {
	
	//qna게시물등록
	public void insertQna(BoardVO vo);
	
	//qna게시판에서 목록 불러오기
	public List<BoardVO> board_all(BoardVO vo);
	
	//qna게시물조회
	public BoardVO qnaView(BoardVO vo);

	//qna게시물 조회수 증가
	public void incrementQnaCount(BoardVO vo);
}
