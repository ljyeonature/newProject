package com.java.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.domain.MemberVO;

//### (1) 해당 어노테이션 지정
@Repository
public class MemberDAOImpl implements MemberDAO{

	//### (2) 해당 어노테이션 지정
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*
	 * public void insertMember(MemberVO vo) {
	 * sqlSession.insert("org.java.MemberMapper.insertMember", vo); }
	 */
	
	/*
	 * //--------------------------------------------- public MemberVO
	 * loginCheck(MemberVO vo) { return
	 * sqlSession.selectOne("org.javassem.MemberMapper.loginCheck", vo); }
	 */

	@Override
	public void insertMember(com.java.domain.MemberVO vo) {
		System.out.println(vo.toString());
		int result = sqlSession.insert("org.java.MemberMapper.insertMember", vo);
		System.out.println("insert : " + result);
	}

	@Override
	public com.java.domain.MemberVO loginCheck(com.java.domain.MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkId(MemberVO vo) {
		//System.out.println(vo.toString());
		int result = sqlSession.selectOne("org.java.MemberMapper.selectcheckIdMember", vo);
		//System.out.println("select id : " + result);
		// result==1이란 말은 중복 아이디가 있다는 말
		if(result == 1) {
			return true;
		}
			
		return false;
	}
}
