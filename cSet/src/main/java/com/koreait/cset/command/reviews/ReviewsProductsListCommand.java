package com.koreait.cset.command.reviews;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.cset.common.CsetCommand;
import com.koreait.cset.dao.ReviewsDAO;
import com.koreait.cset.dto.ReviewsDTO;

public class ReviewsProductsListCommand implements CsetCommand {

	// reviewList = rList
	@Override
	public void execute(SqlSession sqlSession, Model model) {	
		
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ReviewsDAO rDAO = sqlSession.getMapper(ReviewsDAO.class);
		ArrayList<ReviewsDTO> pList = rDAO.selectReviewsProductsList();
	
		// 이거는 원래 productViewCommand와 합쳐져야 할 것
		// productListPage에서 상품을 선택하면 pNo를 가지고 productViewCommand에 오게 된다.
		// 넘어온 pNo를 가지고 해당 상품에 대한 모든 정보를 가져온다 
		// ProductDTO pDTO = pDAO.productSelectBypNo( pNo );
		// session.setAttribute( "pDTO", pDTO );
		// 위의 pDTO에서 pNo를 이후 모든 작업에서 가져다 사용하면 된다.
		
		HttpSession session = request.getSession();
		//session.setAttribute("pNo", value);
		
		
		model.addAttribute("pList", pList);
	
	}

}
