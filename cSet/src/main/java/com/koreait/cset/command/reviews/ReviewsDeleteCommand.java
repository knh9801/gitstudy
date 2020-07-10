package com.koreait.cset.command.reviews;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.cset.common.CsetCommand;
import com.koreait.cset.dao.ReviewsDAO;

public class ReviewsDeleteCommand implements CsetCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// delete했을 때 pNo - list로 가야하기 때문에 pNo를 받는다.
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		ReviewsDAO rDAO = sqlSession.getMapper(ReviewsDAO.class);
		rDAO.deleteReviews(rNo);	
		
	

	}

}
