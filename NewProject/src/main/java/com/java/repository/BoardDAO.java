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
	
	//qna게시물 수정
	public void qnaEdit(BoardVO vo);
	
	//QnA게시글 수정할때 비밀번호 비교
	public int checkQpass(BoardVO vo);
	
	//관리자페이지에서 qna게시물 삭제
	public void deleteQna(BoardVO vo);
}
