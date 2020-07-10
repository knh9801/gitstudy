package com.koreait.cset.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.cset.command.reviews.GoReviewsInsertCommand;
import com.koreait.cset.command.reviews.GoReviewsUpdateCommand;
import com.koreait.cset.command.reviews.ReviewsDeleteCommand;
import com.koreait.cset.command.reviews.ReviewsInsertCommand;
import com.koreait.cset.command.reviews.ReviewsListCommand;
import com.koreait.cset.command.reviews.ReviewsProductsListCommand;
import com.koreait.cset.command.reviews.ReviewsUpdateCommand;
import com.koreait.cset.command.reviews.ReviewsViewCommand;
import com.koreait.cset.common.CsetCommand;

@Controller
public class ReviewsController {
	

	@Autowired
	private SqlSession sqlSession;
	private CsetCommand reviewsCommand;
				// (테이블이름)Command
	
	@RequestMapping("/")
	public String goIndex() {
		return "reviews/index";
	}
	// product list(확인용)
	@RequestMapping("reviewsProductsListPage")
	public String reviewsProductsListPage( HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		reviewsCommand = new ReviewsProductsListCommand();
		reviewsCommand.execute(sqlSession, model);
		return "reviews/reviewsProductsListPage";
	}
	// 리뷰 리스트
	@RequestMapping("reviewsListPage")
	public String reviewsListPage( HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("pNo", request.getParameter("pNo"));
		reviewsCommand = new ReviewsListCommand();
		reviewsCommand.execute(sqlSession, model);
		return "reviews/reviewsListPage";
	}

	// 리뷰 단일 항목
	@RequestMapping("reviewsViewPage")
	public String reviewsViewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		reviewsCommand = new ReviewsViewCommand();
		reviewsCommand.execute(sqlSession, model);
		return "reviews/reviewsViewPage";
	}
	// 업데이트 페이지로 이동
	@RequestMapping(value="goReviewsUpdatePage", method = {RequestMethod.GET, RequestMethod.POST})
	public String goReviewsUpdatePage(HttpServletRequest request, Model model ) {
		model.addAttribute("request",request);
		reviewsCommand = new GoReviewsUpdateCommand();
		reviewsCommand.execute(sqlSession, model);
		return "reviews/reviewsUpdatePage";
	}
	
	// 리뷰 업데이트
	@RequestMapping(value="reviewsUpdatePage", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewsUpdatePage(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		reviewsCommand = new ReviewsUpdateCommand();
		reviewsCommand.execute(sqlSession, model);
		return "redirect:reviewsViewPage";
	}
	// 리뷰 삭제
	@RequestMapping(value="reviewsDeletePage")
	public String reviewsDeletePage(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		model.addAttribute("pNo", request.getParameter("pNo")); 
		reviewsCommand = new ReviewsDeleteCommand();
		reviewsCommand.execute(sqlSession, model);
		return "redirect:reviewsListPage"; // 정보 삭제 후 바로 reviewsListPage.jsp로 이동
	}
	
	// 리뷰 작성 페이지로 이동(단순이동 안되고 pNo값을 받아서 가야한다.)
	@RequestMapping("reviewsInsert")
	public String goReviewsInsert(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("pNo", request.getParameter("pNo")); // 값을 reviewsInsertPage로 한 번 더 넘긴다
		reviewsCommand = new GoReviewsInsertCommand();
		reviewsCommand.execute(sqlSession, model);
		return "reviews/reviewsInsertPage";
	}
	
	// 리뷰 작성
	@RequestMapping(value="reviewsInsertPage",method=RequestMethod.POST)
	public String reviewsInsertPage(MultipartHttpServletRequest mr
									, RedirectAttributes rttr
									, Model model ) {
		model.addAttribute("rttr", rttr);
		model.addAttribute("mr", mr);
		model.addAttribute("pNo", mr.getParameter("pNo"));
		reviewsCommand = new ReviewsInsertCommand();
		reviewsCommand.execute(sqlSession, model);
		return "redirect:reviewsListPage";
		
	}

}
