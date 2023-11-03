package com.java.repository;

import java.util.List;

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

	// 회원가입
	@Override
	public void insertMember(MemberVO vo) {
//		System.out.println(vo.toString());
		int result = sqlSession.insert("org.java.MemberMapper.insertMember", vo);
		System.out.println("insert : " + result);
	}


	// 회원가입 id 체크
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
	// 로그인 체크
	@Override
	public MemberVO loginCheck(MemberVO vo) {
//		System.out.println("memberDAO : "+vo.toString());
		return sqlSession.selectOne("org.java.MemberMapper.loginCheck", vo);
		
	}

	//관리자 홈에서 회원가입리스트
	@Override
	public List<MemberVO> member_dash(MemberVO vo) {
//		System.out.println("MemberDAO : " + vo.toString());
		return sqlSession.selectList("org.java.MemberMapper.member_dash", vo);
	}
	
	//회원정보관리에서 회원가입리스트
	@Override
	public List<MemberVO> member_all(MemberVO vo){
		
		return sqlSession.selectList("org.java.MemberMapper.member_all",vo);
	}

	// 포인트 관리 페이지에서 회원 목록 보이기
	@Override
	public MemberVO member_point_detail(MemberVO vo) {
//		System.out.println("MemberDAO m_id: " + vo.getM_id());
		return sqlSession.selectOne("org.java.MemberMapper.member_point_detail", vo);
	}

	// 포인트 차감
	@Override
	public int member_point_content(MemberVO vo) {
//		System.out.println("MemberPoint : " + vo.getM_point());
		int result=sqlSession.update("org.java.MemberMapper.member_point_content", vo);
//		System.out.println("DAO : " + result);
		return result;
	}


	// 비밀번호 찾기 : 이메일 인증 - 이메일 찾기
	@Override
	public MemberVO selectMember(String m_email) {
		MemberVO result = sqlSession.selectOne("org.java.MemberMapper.selectMember", m_email);
		System.out.println("selectMember DAO : " + result);
		return result;
	}


	@Override
	public int pwUpdate_M(MemberVO vo) {
		int result=sqlSession.update("org.java.MemberMapper.pwUpdate_M", vo);
		System.out.println("pwUpdate_M DAO : " + result);
		return result;
	}


	
}
