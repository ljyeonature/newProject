package com.java.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//게시물등록
	@Override
	public void insertQna(BoardVO vo) {
//		System.out.println(vo.toString());
		int result = sqlSession.insert("org.java.BoardMapper.insertQna", vo);
		System.out.println("insert : " + result);
	}

}
