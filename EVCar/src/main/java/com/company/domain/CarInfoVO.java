package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class CarInfoVO {
		private int bno;  				//전부 소문자로 입력함!
		private String brand;			// 브랜드
		private String carname;			// 차명
		private String carname_en; 		// 차명 영어
		private String cartype; 		// 종류 -상세페이지
		private int rowprice;  			// 최저가
		private int highprice; 			// 최대가
		private int support; 			// 보조금
		private float fuel; 			// 연비 -상세페이지
		private int mileage; 		 	// 주행거리 -상세페이지
		private String chargetype; 		// 충전방식
		private int releasedate;		// 출시연도
		private String title;  			// 제목 -상세페이지
		private String content; 		// 설명 -상세페이지
		private String thumbnail;
		private String carpicture1;
		private String carpicture2;
		private String carpicture3;
		private String reviewtitle1;
		private String review1;
		private String youtubeurl;
}


