package com.java.domain;

/*import lombok.Data;

@Data*/
public class MemberVO {

	private String m_id;
	private String m_pass;
	private String m_name;
	private String m_tel;
	private String m_email;
	private String m_postcode;
	private String m_addr;
	private String m_point;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_postcode() {
		return m_postcode;
	}
	public void setM_postcode(String m_postcode) {
		this.m_postcode = m_postcode;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_point() {
		return m_point;
	}
	public void setM_point(String m_point) {
		this.m_point = m_point;
	}
	
	
	
	
}
