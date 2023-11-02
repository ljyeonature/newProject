package com.java.domain;

import lombok.Data;

@Data
public class MemberVO {			// 회원 - m_member

	private String m_id;		// 회원ID		- m_id
	private String m_pass;		// 비밀번호		- m_pass
	private String m_name;		// 이름		- m_name
	private String m_tel;		// 전화번호		- m_tel
	private String m_email;		// 이메일		- m_email
	private String m_postcode;	// 우편번호		- m_postcode
	private String m_addr;		// 주소		- m_addr
	private String m_point;		// 적립금		- m_point
	private String m_rol;		// 매니저역할	- m_role
	

	
}
