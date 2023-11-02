package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.domain.MemberVO;
import com.java.repository.MemberDAO;

//### (1) 해당 어노테이션 지정
@Service
public class MemberServiceImpl implements MemberService{

	// ### (2) 해당 어노테이션 지정
	@Autowired
	private MemberDAO memberDAOImpl;
	
	public void insertMember(MemberVO vo) {
		memberDAOImpl.insertMember(vo);
	}
	
	public MemberVO loginCheck(MemberVO vo) {
		// System.out.println("로그인 : " + vo.getM_id() +"/" +vo.getM_pass());
		return memberDAOImpl.loginCheck(vo);
	}
	
	public boolean checkId(MemberVO vo) {
		//System.out.println(memberDAOImpl.checkId(vo));
		return memberDAOImpl.checkId(vo);
	}

	@Override

	public List<MemberVO> member_dash(MemberVO vo) {
		System.out.println("MemberService: "+ vo.toString());
		List<MemberVO> result = memberDAOImpl.member_dash(vo);
		System.out.println(result);


	@Override
	public MemberVO member_point_detail(MemberVO vo) {
//		System.out.println(vo.getM_id());
		MemberVO result = memberDAOImpl.member_point_detail(vo);
		return result;
	}

	@Override
	public int member_point_content(MemberVO vo) {
		System.out.println(vo.getM_pass());
		int result = memberDAOImpl.member_point_content(vo);
		System.out.println("Service : " + result);

		return result;
	}
	
	@Override
	public List<MemberVO> member_all(MemberVO vo){
		List<MemberVO> result = memberDAOImpl.member_all(vo);
		return result;
	}

	
	
}
