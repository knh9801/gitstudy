package com.koreait.cset.command.reviews;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.cset.common.CsetCommand;
import com.koreait.cset.dao.ReviewsDAO;

public class ReviewsInsertCommand implements CsetCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		RedirectAttributes rttr = (RedirectAttributes) map.get("rttr");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		
		String rContent = mr.getParameter("rContent");
		int rRating = Integer.parseInt(mr.getParameter("rRating"));
		MultipartFile files = mr.getFile("files");
		
		// 임의로 넣는 값(pNo, mId)
		int pNo = Integer.parseInt(mr.getParameter("pNo")); // pNo는 받아와서 넘겨야 하는 값인데 
		String mId = mr.getParameter("mId"); // mId에서 받아와야 하는 값인데 임의로 삽입
		
				// 업로드 할 파일의 이름 / 확장자 분리하기
				String originFilename = files.getOriginalFilename();
				
				String extName = originFilename.substring(originFilename.lastIndexOf(".")+ 1 );
						
				String saveFilename = null;
				// 저장할 파일 이름 만들기
			try {
							
					saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
								   "-" + 
								   System.currentTimeMillis() +
								   "." + extName;
							
					// 업로드
					// 파일이 저장될 경로 알아내기
					String realPath = mr.getSession().getServletContext().getRealPath("resources/reviewsStorage");
					// 경로가 없다면 만들기
					File directory = new File(realPath);
					if ( !directory.exists()) {
						directory.mkdirs();
					}
							
					// 서버에 저장할 파일 만들기
					File saveFile = new File(realPath, saveFilename);
							
					// 업로드
					files.transferTo(saveFile);
							
					// DB에 저장
				
				} catch (Exception e) {
					e.printStackTrace();
				}
		
			ReviewsDAO rDAO = sqlSession.getMapper(ReviewsDAO.class);
			
			rttr.addFlashAttribute("insertResult", rDAO.insertReviews( pNo, mId, rContent, saveFilename, rRating));
			
			rttr.addFlashAttribute("beInserted", true);
			
			model.addAttribute( "pNo", pNo );
			}
	}


