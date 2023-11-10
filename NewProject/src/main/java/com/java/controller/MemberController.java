package com.java.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
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
import com.java.domain.CartVO;
import com.java.domain.CartViewVO;
import com.java.domain.MemberVO;
import com.java.domain.OptionVO;
import com.java.domain.ProductVO;
import com.java.domain.WishListVO;
import com.java.service.BoardServiceImpl;
import com.java.service.MemberServiceImpl;
import com.java.service.ProductServiceImpl;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberServiceImpl memberService;

	@Autowired
	protected JavaMailSender mailSender;

	// 단순 페이지 이동
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step, Model model, WishListVO wvo) {
		model.addAttribute("wishList", memberService.wishlist_all(wvo));
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
	    	//System.out.println(result);
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
	public void memberDetail(Model model, @RequestParam("m_id") String m_id)
	{
		MemberVO result = memberService.member_detail(m_id);
//		System.out.println(result.getM_id());
//		System.out.println("select : " + result);
		model.addAttribute("memberInfo", result);
		
	}
	
	// 회원 정보 수정
	@RequestMapping("/update_do")
	public String updateMember(MemberVO vo, @RequestParam("m_id") String m_id)
	{
		int result = memberService.update_member(vo);
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
		return "redirect:/member/qna";
	}
	
	// qna게시판 목록 조회 =============> wishlist 표시 => 자동 qna로 이동
	@RequestMapping("/qna")
	public void board_all(Model model, WishListVO wvo, String sltfilter, String search, @RequestParam(defaultValue = "1") int page) {
		
		BoardVO vo = new BoardVO();
		vo.setSltfilter(sltfilter);
		vo.setSearch(search);
		
		// boardService를 사용하여 모든 QnA 게시물을 가져옵니다.
		List<BoardVO> allQna = boardService.board_all(vo);
		
		// PagedListHolder를 사용하여 페이징된 목록을 생성합니다.
		PagedListHolder<BoardVO> qnaListPage = new PagedListHolder<BoardVO>(allQna);
		// 한 페이지당 표시할 항목 수를 설정합니다.
		qnaListPage.setPageSize(5);
		
		// 요청에서 받은 페이지 번호에 따라 현재 페이지를 설정합니다. (0부터 시작)
		qnaListPage.setPage(page - 1);
		// 현재 페이지에 표시할 게시물 목록을 가져옵니다.
		List<BoardVO> result = qnaListPage.getPageList();
		
		// 가져온 게시물 목록과 페이지 정보를 모델에 추가하여 뷰로 전달합니다.
	    model.addAttribute("qnaList", result);
	    model.addAttribute("maxPages", qnaListPage.getPageCount());	//전체페이지수
	    model.addAttribute("currentPages", qnaListPage.getPage() + 1);	//현재페이지
	    model.addAttribute("wishList", memberService.wishlist_all(wvo));
	    
//	    return "member/qna";
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
	
	//qna게시글 수정하는 폼 들어가기
	@RequestMapping("/qnaeditform_do")
	public String qnaEdit(BoardVO vo, Model m) {
		
		BoardVO qna = boardService.qnaView(vo);
		m.addAttribute("qna",qna);
		return "member/qnaedit";
	}
	
	//qna게시글 수정후 수정한 게시글 불러오기
	@RequestMapping("/qnaedit_do")
	public String qnarealEdit(BoardVO vo, Model m) {
		
		boardService.qnaEdit(vo);
		BoardVO updateqna = boardService.qnaView(vo);
		
		m.addAttribute("qna",updateqna);
		return "redirect:/member/qnaview_do?q_postnum=" + updateqna.getQ_postnum();
	}
	
	
	  //qna 게시글 비밀번호랑 DB 비교후 동일한지 확인
	  
	  @RequestMapping("/checkQpass")
	  @ResponseBody
	  public String checkQpass(BoardVO vo) {
		  int result = boardService.checkQpass(vo);
		  if(result == 1) {
			  return "success";
		  }else { 
			  return "fail";
			  }
	  }
	
	@Autowired
	ProductServiceImpl productService;
	
	// 상품 보여주기
	@RequestMapping("/product")
	public void productAll(ProductVO vo, Model model, WishListVO wvo) {
		model.addAttribute("productAll",productService.product_all(vo));
		model.addAttribute("wishList", memberService.wishlist_all(wvo));
	}
	
	
	// 장바구니 중복 확인
	@RequestMapping("/alreadyInCartList")
	@ResponseBody
	public String alreadyInWishList(CartVO vo) {
//		System.out.println(vo.toString());
		int result = memberService.alreadyInCartList(vo);
		//System.out.println("alreadyInCartList : "+result);
		if(result == 1) {
			return "ok";
		}
		else {
			return "no";
		}
	}
	
	// 찜 목록 저장하기 - 해당 m_id와 p_selid
	
//	ajax로 보내면 해당 결과값을 얘가 반환해줘야함
	@RequestMapping("/product_wishlist")
	@ResponseBody
	public String product_wishlist(WishListVO vo) {
		int result = memberService.product_wishlist(vo);
//		WishListVO wish = memberService.product_wishlist(vo);
		if(result == 1) {
			return "success";
		}
		else {
			return "error";
		}
	}
	
	
	// 찜 목록 해당 ID 인 경우 찜 목록 보이기 : json으로 보내야 하기 때문에 -> pom.xml에 json 변환 도구 추가
	@RequestMapping("/wishlist_all")
	@ResponseBody
	public List<WishListVO> wishlistAll(WishListVO vo) {
		//System.out.println(vo.getM_id());
		List<WishListVO> result = memberService.wishlist_all(vo);
//		System.out.println(result);
		return result;
	}
	
	// 찜 삭제하기
	@RequestMapping("/delete_wishlist")
	@ResponseBody
	public String deleteWishlist(WishListVO vo) {
		int result = memberService.delete_wishlist(vo);
		System.out.println("delete : " + result);
		if(result == 1) {
			return "delete";
			
		} else {
			return "fail";
		}
	}

	
	// 상품상세정보 보기
	@RequestMapping("/product-detail")
	public void productDetail(Model model, @RequestParam String p_selid, WishListVO wvo) {
//		System.out.println(p_selid);
		ProductVO result = productService.product_detail(p_selid);
		List<OptionVO> option = productService.product_option(p_selid);
//		System.out.println(result.toString());
		model.addAttribute("productDetail", result);
		model.addAttribute("productOption", option);
		model.addAttribute("wishList", memberService.wishlist_all(wvo));
	}
	
	
	  // quick view 보기
	  
	@RequestMapping("/product_quickview") 
	public void productQuickview(Model model, @RequestParam String p_selid) { 
			model.addAttribute("productQuick", productService.product_detail(p_selid));

	}
	 
	
	
	// 장바구니 담기
	@RequestMapping("/add-to-cart")
	@ResponseBody
	public String addToCart(CartVO vo) {
		
		int result = memberService.add_to_cart(vo);
		if(result == 1) {
			return "success";
					
		} else {
			return "fail";
		}
	}
	
	// 장바구니 내역 보이기
	@RequestMapping("/shoping-cart")
	public void shoppingCart(CartViewVO vo, Model model, WishListVO wvo, MemberVO mvo) {
//		System.out.println(vo.toString());
		model.addAttribute("shoppingCart",memberService.shopping_cart(vo));
		model.addAttribute("wishList", memberService.wishlist_all(wvo));
		model.addAttribute("point", memberService.member_point_detail(mvo));
	}
	
	// 장바구니 수량 올리기
	@RequestMapping("/plusCartCnt")
	@ResponseBody
	public String plusCartCnt(CartVO vo) {
//		System.out.println(vo.toString());
		int result = memberService.plusCartCnt(vo);
		String total = vo.getShopping_total();
//		System.out.println(total);
		if(result == 1) {
			return total;
		} else {
			return "no";
		}
	}
	
	// 장바구니 수량 내리기
	@RequestMapping("/minusCartCnt")
	@ResponseBody
	public String minusCartCnt(CartVO vo) {
		int result = memberService.minusCartCnt(vo);
		String total = vo.getShopping_total();
//		System.out.println(total);
		if(result == 1) {
			return total;
		} else {
			return "no";
		}
	}
	
	// 장바구니 총합
	@RequestMapping("/getCartTotal")
	@ResponseBody
	public String updateTotal(CartVO vo) {
		String result = memberService.cartTotal(vo);
//		System.out.println(result);
		return result;
	}
	
	// 주문 페이지로 갈 때 데이터 불러오기
	@RequestMapping("/member-order")
	public void order(CartViewVO wvo, Model model, @RequestParam String m_id, MemberVO mvo) {
		System.out.println(m_id);
		model.addAttribute("shoppingCart",memberService.shopping_cart(wvo));
		model.addAttribute("member", memberService.memberInfo(mvo));
		
	}
	private IamportClient api;
	
	public MemberController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("6256026187130804","6moL42tAiYn3MNwPOIvqFeEedcXOm8Hhth8ObKeVVA3Aw6wpIPCrVlplp6lZZaSoQve7XAWA7NwxvoZ3");
	}
		
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}

	
}