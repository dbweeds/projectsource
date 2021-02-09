package com.company.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.domain.Criteria;


import lombok.extern.slf4j.Slf4j;

//자동차 커뮤니티 컨트롤러
@Controller
@Slf4j
@RequestMapping("/news/*")
public class NewsController {
	
	@GetMapping("/news")
	public void news() {
		log.info("news start");
	}
	
	@GetMapping(value="/news_data/{page}/{order}",produces="application/json;charset=utf-8")
	public ResponseEntity<String> getNew(@PathVariable("page") int page,@PathVariable("order")  int order) {
		
		log.info("정보요청 "+page+"기준 "+order);
		
		
		String clientId = "RXfj1DhgKgaLfO9k9NKh"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "6HBReaUAPt"; //애플리케이션 클라이언트 시크릿값"

        String text = "전기차";
        try {
            text = URLEncoder.encode("전기차", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }
        
        
        //page가 1인 경우 1~20번까지의 게시물
        //page가 2인 경우 21~40번까지의 게시물
        //display는 몇 개를 가져올 것인가?
        //start는 몇번째에서 시작해서 가져올 것인가?
        int display=15;
        

        if(page!=1) {        	
        	page = (display * page)+1;
        }
        
       
        String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text+"&display="+display+"&start="+page;    // json 결과
       
        if(order==1) {
        	apiURL+="&sort=sim";
        }else {
        	apiURL+="&sort=date";
        }
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        
             

        //responseBody 안에 items는 보여줄 게시물들
        

        return new ResponseEntity<String>(responseBody, HttpStatus.OK);
		
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
