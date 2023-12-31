package com.java.service;

import java.util.List;

import com.java.domain.BoardVO;

public interface BoardService {
	
	//QnA게시물 DB저장
	public void insertQna(BoardVO vo);
	
	//QnA게시판에서 게시물 목록보기
	public List<BoardVO> board_all(BoardVO vo);
	
	//QnA게시글 조회수 증가
	void incrementQnaCount(BoardVO vo);
	
	//QnA게시글 수정
	void qnaEdit(BoardVO vo);
	
	//QnA게시글 수정할때 비밀번호 비교
	int checkQpass(BoardVO vo);
	
	//QnA게시글 관리자 페이지에서 삭제
	public void deleteQna(BoardVO vo);

}
