package com.koreait.cset.command.reviews;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.server.reactive.TomcatHttpHandlerAdapter;
import org.springframework.ui.Model;

import com.koreait.cset.common.CsetCommand;
import com.koreait.cset.common.PageMaker;
import com.koreait.cset.dao.ReviewsDAO;
import com.koreait.cset.dto.ReviewsDTO;

public class ReviewsListCommand implements CsetCommand {

	// reviewList = rList
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		ReviewsDAO rDAO = sqlSession.getMapper(ReviewsDAO.class);
		ArrayList<ReviewsDTO> rList = rDAO.selectReviewsList(pNo);
		
/*		// 페이지 생성 고민 해 볼게
		
		// 현제 페이지가 없거나 비어있으면 1페이지
		String rPage = request.getParameter("rPage");
		if ( rPage == null || rPage.isEmpty()) {
			rPage = "1";
		}
		int reviewsPage = Integer.parseInt(rPage);
		// 페이지당 게시글 수 7개
		int recordPerPage = 7;
		// 시작 게시글 번호 // 끝 게시글 번호
		int beginRecord = (reviewsPage - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
	
		String pageView = PageMaker.getPageView("reviewsListPage", reviewsPage, recordPerPage, rList.size());
		
*/		
		
		model.addAttribute("rList", rList);
		// 전체 게시글 수
		model.addAttribute("totalCount", rList.size());
		
		// 세션에 올라간 rDTO 내리기
		session.removeAttribute("rDTO");

	}

}
