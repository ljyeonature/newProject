package com.java.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.domain.BoardVO;

//### (1) 해당 어노테이션 지정
@Repository
public class BoardDAOImpl implements BoardDAO{
	
	//### (2) 해당 어노테이션 지정
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//게시물등록
	@Override
	public void insertQna(BoardVO vo) {
//		System.out.println(vo.toString());
		int result = sqlSession.insert("org.java.BoardMapper.insertQna", vo);
		System.out.println("insert : " + result);
	}
	
	//QnA게시판에서 게시물목록보기
	@Override
	public List<BoardVO> board_all(BoardVO vo){
		return sqlSession.selectList("org.java.BoardMapper.board_all",vo);
	}
	
	//QnA게시물 불러오기
	@Override
	public BoardVO qnaView(BoardVO vo) {
		return sqlSession.selectOne("org.java.BoardMapper.qnaView",vo);
	}
	
	//QnA게시물 조회수증가
	@Override
	public void incrementQnaCount(BoardVO vo) {
		sqlSession.update("org.java.BoardMapper.incrementQnaCount",vo);
	}
	
	//QnA게시물 수정
	@Override
	public void qnaEdit(BoardVO vo) {
		int result = sqlSession.update("org.java.BoardMapper.qnaEdit",vo);
	}
	
	//QnA게시글 수정할때 비밀번호 비교
	@Override
	public int checkQpass(BoardVO vo) {
		return sqlSession.selectOne("org.java.BoardMapper.checkQpass",vo);
	}
	
	//QnA게시글 관리자 페이지에서 삭제
	public void deleteQna(BoardVO vo) {
		sqlSession.delete("org.java.BoardMapper.deleteQna",vo);
	}
}
