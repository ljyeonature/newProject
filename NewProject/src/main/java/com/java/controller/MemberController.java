package com.java.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.domain.BoardVO;
import com.java.domain.MemberVO;
import com.java.service.BoardServiceImpl;
import com.java.service.MemberServiceImpl;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberServiceImpl memberService;

	@Autowired
	protected JavaMailSender mailSender;

	// 단순 페이지 이동
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "member/" +step;
	}

	// 회원가입 하고 login 페이지로 이동
	@RequestMapping("/join_do")
	public String join(MemberVO vo) {
		memberService.insertMember(vo);
		return "member/login";
	}

	// 아이디 중복확인
	@RequestMapping("/check_Id")
	@ResponseBody
	public String checkId(MemberVO vo) {
		//System.out.println(vo.toString());
		boolean is_Id = memberService.checkId(vo);
		//System.out.println(is_Id);
		if(is_Id) {
			return "duplicate";
		}else {			
			return "available";
		}
	}

	// 로그인 확인 후 정보 없으면 login 페이지 / 있으면 세션에 logname으로 아이디 저장
	// 관리자 로그인 : m_rol이 manager인 경우
	// redirect를 해야 아래 회원 목록을 불러오는 페이지로 갔다 올 수 있음.
	@RequestMapping("/login_do")
	public String loginCheck(MemberVO vo, HttpSession session) {
		MemberVO result = memberService.loginCheck(vo);
		//		MemberVO adminResult = memberService.adminCheck(vo);
		//		System.out.println("admin Controller : " + adminResult);
		//		System.out.println(result.getM_name());
		//		System.out.println(result.getM_rol());
		if (result == null) {

			return "member/login";
		} else if ("manager".equals(result.getM_rol())) {
			session.setAttribute("logname", result.getM_name());
			session.setAttribute("logid", result.getM_id());
			return "redirect:/admin/admin-choice";

		} 

	    else {
	    	System.out.println(result);
	        session.setAttribute("logname", result.getM_name());
	        session.setAttribute("logid", result.getM_id());
	        return "redirect:/member/home";
	    }
		

	}

	// 아이디 저장하기(로그인시)



	// 세션 로그아웃
	@RequestMapping("/logout_do")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/main/home";
	}
	
	// 회원 수정할 때 페이지에 데이터 불러오기
	@RequestMapping("/member-info") 
	public void member_detail(Model model, @RequestParam("m_id") String m_id)
	{
		MemberVO result = memberService.member_detail(m_id);
//		System.out.println(result.getM_id());
//		System.out.println("select : " + result);
		model.addAttribute("memberInfo", result);
		
	}
	
	// 회원 정보 수정
	@RequestMapping("/update_do")
	public String update_member(MemberVO vo, @RequestParam("m_id") String m_id)
	{
		int result = memberService.update_member(vo);
		System.out.println();
		return "redirect:/member/mypage";
	}
	


	// 비밀번호 찾기 - 인증메일
	@RequestMapping(value = "/pw_auth")
	public ModelAndView pw_auth(HttpSession session, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String m_email = (String)request.getParameter("m_email");
		System.out.println(m_email);
		MemberVO vo = memberService.selectMember(m_email);

		if(vo != null) {
			Random r = new Random();
			int num = r.nextInt(999999); // 랜덤난수설정

			if (vo.getM_email().equals(m_email)) {
				session.setAttribute("m_email", vo.getM_email());

				String setfrom = "AQUICITY@naver.com"; // naver 
				String tomail = m_email; //받는사람
				String title = "[AQU I CITY] 비밀번호변경 인증 이메일 입니다"; 
				String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
				+ "AQU I CITY 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content); 

					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

				ModelAndView mv = new ModelAndView();
				mv.setViewName("member/pw_auth");
				mv.addObject("num", num);
				return mv;
			}else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("member/pw_find");
				return mv;
			}
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/pw_find");
			return mv;
		}

	}

	@RequestMapping(value = "/pw_set", method = RequestMethod.POST)
	public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
			@RequestParam(value = "num") String num) throws IOException{

		if(email_injeung.equals(num)) {
			return "member/pw_new";
		}
		else {
			return "member/pw_find";
		}
	} //이메일 인증번호 확인

	@RequestMapping(value = "/pw_new", method = RequestMethod.POST)
	public String pw_new(MemberVO vo, HttpSession session) throws IOException{
		int result = memberService.pwUpdate_M(vo);
		if(result == 1) {
			return "member/login";
		}
		else {
			System.out.println("pw_update"+ result);
			return "member/pw_new";
		}
	}
	
	@Autowired
	BoardServiceImpl boardService;
	
	// qna등록 하고 게시판 페이지로 이동
	@RequestMapping("/qna-add_do")
	public String qnaAdd(BoardVO vo) {
		boardService.insertQna(vo);
		return "member/qna";
	}
	
	// qna게시판 목록 조회
	@RequestMapping("/qna")
	public void board_all(BoardVO vo, Model model) {
	    List<BoardVO> result = boardService.board_all(vo);
	    model.addAttribute("qnaList", result);
	}
	
	// qna게시글 불러오기 (상세보기)
	@RequestMapping("/qnaview_do")
	public String qnaView(BoardVO vo, Model model) {
		// 게시물 조회수 증가
		boardService.incrementQnaCount(vo);
		// 게시글 로딩
		BoardVO result = boardService.qnaView(vo);
		model.addAttribute("qna", result);
		return "member/qnaview";
	}
}