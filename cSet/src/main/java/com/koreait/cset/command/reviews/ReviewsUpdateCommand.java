package com.koreait.cset.command.reviews;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.cset.common.CsetCommand;
import com.koreait.cset.dao.ReviewsDAO;

public class ReviewsUpdateCommand implements CsetCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String rContent = request.getParameter("rContent");
		String rFilename = request.getParameter("rFilename");
		int rRating = Integer.parseInt(request.getParameter("rRating"));
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		ReviewsDAO rDAO = sqlSession.getMapper(ReviewsDAO.class);
		rDAO.updateReviews(rContent, rFilename, rRating, rNo);
		
		model.addAttribute("rNo", rNo);
		
	}

}
