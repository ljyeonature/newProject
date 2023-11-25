package com.java.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.java.domain.BoardVO;
import com.java.domain.FstDivVO;
import com.java.domain.ImageVO;
import com.java.domain.LogVO;
import com.java.domain.LogVO2;
import com.java.domain.MemberVO;
import com.java.domain.OptionFinalVO;
import com.java.domain.OptionVO;
import com.java.domain.ProductVO;
import com.java.domain.SndDivVO;
import com.java.domain.TrdDivVO;
import com.java.service.BoardServiceImpl;
import com.java.service.MemberServiceImpl;
import com.java.service.ProductServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	MemberServiceImpl memberService;

	@Autowired
	BoardServiceImpl boardService;

	@Autowired
	ProductServiceImpl productService;

	// 단순 페이지 이동
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "admin/" + step;
	}



	// 세션 로그아웃
	@RequestMapping("/logout_do")
	public String logout(HttpSession session) {

		session.invalidate();

		return "/main/home";
	}
	
	//------------------------------------------차트--------------------------------- 

	// 관리자 홈에서 회원 정보 불러오기
	@RequestMapping("/admin-index")
	public void memeber_dash(MemberVO mvo, Model model, LogVO vo, LogVO2 vo2) {
		System.out.println("Controller : " + mvo.toString());
		System.out.println("controller : " + memberService.member_dash(mvo));
		
		// 차트 내용 보이기
		List<LogVO> logNameList = memberService.fstOrder(vo);
		List<LogVO2> logNameList2 = memberService.monthOrder(vo2);
		
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		// 대분류 주문
		Iterator<LogVO> it = logNameList.iterator();
		while(it.hasNext()) {
			LogVO curVO = it.next();
			JsonObject object = new JsonObject();
			String fstdivname = curVO.getFstdivname();
			int cnt = Integer.parseInt(curVO.getCnt());
			
			object.addProperty("Fstdivname", fstdivname);
			object.addProperty("Count", cnt);
			jArray.add(object);
		}
		Gson gson2 = new Gson();
		JsonArray jArray2 = new JsonArray();
		
		// 월별 매출
		Iterator<LogVO2> it2 = logNameList2.iterator();
		while(it2.hasNext()) {
			LogVO2 curVO = it2.next();
			JsonObject object = new JsonObject();
			String month = curVO.getMonth();
			double total = Double.parseDouble(curVO.getTotal());
			
			object.addProperty("Month", month);
			object.addProperty("Total", total);
			jArray2.add(object);
		}
		
		String json = gson.toJson(jArray);
		System.out.println(json);
		model.addAttribute("json", json);
		
		String json2 = gson2.toJson(jArray2);
		System.out.println(json2);
		model.addAttribute("json2", json2);

		model.addAttribute("memberList", memberService.member_dash(mvo));

	}
	// 전체 관리자 홈에서 회원 정보 불러오기
	@RequestMapping("/member_all")
	public void member_all(MemberVO vo, Model model) {
		List<MemberVO> member = memberService.member_all(vo);
		System.out.println("Controller :" + member.toString());
		model.addAttribute("memberList" , member);
	}

	@RequestMapping("/point")
	public void memeber_all2(MemberVO vo, Model model) {
		//		System.out.println("Controller : " + vo.toString());
		//		System.out.println("controller : " + memberService.member_all(vo));

		model.addAttribute("memberList", memberService.member_dash(vo));

	}

	@RequestMapping("/point-detail")
	public void member_point_detail(MemberVO vo, Model model) {
		System.out.println("controller : " + vo);
		//		System.out.println("포인트 수정 p_point : " + vo.getM_point());
		model.addAttribute("memberPoint", memberService.member_point_detail(vo));

	}

	//	ajax로 보내면 해당 결과값을 얘가 반환해줘야함
	
	@RequestMapping("/member-point-content")
	@ResponseBody
	public String member_point_content(MemberVO vo) {
		int result = memberService.member_point_content(vo);
		MemberVO point = memberService.member_point_detail(vo);
		if(result == 1) {
			return point.getM_point();
		}
		else {
			return "error";
		}
	}


	// product_resister 페이지 들어가면 분류 내용 보내기
	@RequestMapping("/product_resister")
	public void select_cate(FstDivVO fvo, SndDivVO svo, TrdDivVO tvo, Model model) {

		model.addAttribute("fstcate", productService.select_FstCate(fvo));
		model.addAttribute("sndcate", productService.select_SndCate(svo));
		model.addAttribute("trdcate", productService.select_TrdCate(tvo));

	}

	// 상품 등록
	@RequestMapping("/product_insert")
	@ResponseBody
	public String product_insert( ProductVO vo) {
		int result = productService.product_insert(vo);
		//		System.out.println(result);
		if(result == 1) {
			return "ok";
		} else {
			return "no";
		}
	}

	// 상품 등록
	@RequestMapping("/upload-image")
	@ResponseBody
	public String upload_image( ImageVO vo) {
		System.out.println("Controller : " + vo.toString());
		int result = productService.upload_image(vo);
		//		System.out.println(result);
		if(result == 1) {
			return "ok";
		} else {
			return "no";
		}
	}

	// 상품 보여주기
	@RequestMapping("/product_all")
	public void product_all(ProductVO vo, Model model) {
		model.addAttribute("productList", productService.product_all(vo));
		//	System.out.println(result);
	}


	//옵션 상품 띄우기
	@RequestMapping(value = "/product_option", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String product_option(OptionVO vo) {
		// System.out.println(vo.getP_selid());
		List<OptionVO> result = productService.product_option(vo);
		//System.out.println(result);
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String jsonData = objectMapper.writeValueAsString(result);
			//System.out.println(jsonData);
			return jsonData;
		} catch (JsonProcessingException e) {
			// JSON 변환 예외 처리
			return "Error occurred while processing data.";

		}
	}

	// 옵션 등록
	@RequestMapping(value="/insert_option")
	@ResponseBody
	public String insertOption(@RequestBody OptionFinalVO vo) {
		int result = productService.insertProduct(vo);
		if(result == 1) {
			return "ok";
		} else {
			return "no";
		}

	}
	
	// 옵션 재고등록
	@RequestMapping(value="/update_stock")
	@ResponseBody
	public void updateOption(@RequestBody OptionFinalVO vo) {
		System.out.println("insert_stock 진입" + vo.toString());
		int result = productService.updateOption(vo);
		
	}
	
	//옵션 재고 내역 불러오기
	@RequestMapping(value="/product_stock_res")
	public void opcollect(OptionFinalVO vo, Model model) {
//		System.out.println(vo.getP_selid());
		List<OptionFinalVO> result = productService.opcollect(vo);
				System.out.println(result.toString());
		model.addAttribute("product_stock_res", productService.opcollect(vo) );
	}
	
	//재고관리에 등록된 상품 불러오기
	@RequestMapping("/product_stock")
	public void product_optionList(ProductVO vo, Model model) {
		model.addAttribute("product_stock", productService.product_optionList(vo));
	}


	
	

	//-----------------------------------------------------------------------------------------------------
	//----------------------------------------여기서부터 관리자 QnA-----------------------------------
	//-----------------------------------------------------------------------------------------------------

	// qna게시판 목록 조회 (검색, 수정 합쳐서)
	@RequestMapping("/qna")
	public String board_all(Model model, String sltfilter, String search) {

		BoardVO vo = new BoardVO();
		vo.setSltfilter(sltfilter);	// HashMap map = new HashMap(); -> map.put("",변수명);
		vo.setSearch(search);

		List<BoardVO> result = boardService.board_all(vo);
		model.addAttribute("qnaList", result);

		return "admin/qna";
	}

	// 게시글 제목 클릭하면 내용 불러오기
	@RequestMapping("/qnaview_do")
	public String getContentList(BoardVO vo, Model model) {
		BoardVO result = boardService.qnaView(vo);
		model.addAttribute("qnacontent" , result);

		return "admin/qnaview";
	}

	// qna게시물 수정하는 폼 들어가기
	@RequestMapping("/qnaeditForm_do")
	public String getContentForm(BoardVO vo, Model model) {

		BoardVO result3 = boardService.qnaView(vo);
		model.addAttribute("qnacontent" , result3);
		return "admin/qnaedit";
	}


	// 내용 수정하고 수정된 게시물 불러오기
	@RequestMapping("/qnaedit_do")
	public String getContentEdit(BoardVO vo, Model model) {

		boardService.qnaEdit(vo);
		BoardVO result2 = boardService.qnaView(vo);

		model.addAttribute("qnacontent" , result2);
		return "redirect:/admin/qnaview_do?q_postnum=" + result2.getQ_postnum();
	}

	// 체크박스 선택 상품 삭제
	@RequestMapping(value="productdelete", method=RequestMethod.POST)
	@ResponseBody
	public String deleteProduct(ProductVO vo) {

		System.out.println("deleteProduct vo : " + vo);

		productService.deleteProduct(vo);
		return "redirect:/admin/product_all";
	}
      
  // 관리자페이지에서 qna 게시물 삭제
 @RequestMapping("qnadelete_do")
 public String deleteQna(BoardVO vo) {
   boardService.deleteQna(vo);
   return "redirect:/admin/qna";
 }

  
 // p_list_edit 페이지 들어가면 분류 내용 보내기
 @RequestMapping("/p_list_edit")
 public void select_cate2(FstDivVO fvo, SndDivVO svo, TrdDivVO tvo, Model model) {
    System.out.println("fvo:"+fvo + "svo:" + svo + "tvo:" + tvo);
    model.addAttribute("fstcate2", productService.select_FstCate2(fvo));
    model.addAttribute("sndcate2", productService.select_SndCate2(svo));
    model.addAttribute("trdcate2", productService.select_TrdCate2(tvo));
 }
	
	
	
	

}
