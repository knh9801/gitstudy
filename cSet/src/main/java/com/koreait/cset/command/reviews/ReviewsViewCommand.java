package com.koreait.cset.command.reviews;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.cset.common.CsetCommand;
import com.koreait.cset.dao.ReviewsDAO;

public class ReviewsViewCommand implements CsetCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
				
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		String mId = request.getParameter("mId");
		
		ReviewsDAO rDAO = sqlSession.getMapper(ReviewsDAO.class);
		session.setAttribute("rDTO", rDAO.selectByrNo(rNo));	
		
	}

}
