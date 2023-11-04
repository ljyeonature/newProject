package com.java.repository;

import java.util.HashMap;
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
}
