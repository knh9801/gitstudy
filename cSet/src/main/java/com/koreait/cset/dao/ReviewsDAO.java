package com.koreait.cset.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.koreait.cset.dto.ReviewsDTO;

public interface ReviewsDAO {
	
	// 상품 번호 목록
	public ArrayList<ReviewsDTO> selectReviewsProductsList();
	
	// 리뷰 목록
	public ArrayList<ReviewsDTO> selectReviewsList( int pNo );
	
	
	// 리뷰 개별 항목 (reviewsViewPage)
	public ReviewsDTO selectByrNo( int rNo );

	// 리뷰 수정 (reviewsUpdatePage)
	public void updateReviews( @Param("rContent") String rContent, @Param("rFilename") String rFilename,@Param("rRating") int rRating,@Param("rNo") int rNo );
	
	// 리뷰 삭제
	public void deleteReviews( @Param("rNo") int rNo );
	
	// 리뷰로 이동하기 전 정보를 가지고 감
	public  ReviewsDTO selectBypNo( @Param("pNo") int pNo );
	
	// 리뷰 작성(int pNo, int mId -> 임의로 삽입)
	public int insertReviews( int pNo, String mId, String rContent, String saveFilename, int rRating);
	
}
