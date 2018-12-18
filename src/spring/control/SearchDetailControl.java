package spring.control;

import java.net.URI;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.LibDAO;
import mybatis.dao.NormalDAO;
import mybatis.vo.LibraryVO;
import mybatis.vo.NormalVO;
import spring.util.PageUtil;
import spring.util.Paging;

@Controller
public class SearchDetailControl {
	//카카오 책검색에 사용될 key
	private String kakaoKey = "de6b4d081663a01db2e3bc26e9c95fd2";
	
	//도서관정보나루 api요청에 사용될 key
	private String appKey = "7496dac2e3c3d7181939ba1abf59fed38c30c64ff83ec93871de30bdeeeef6c4";
	@Autowired
	private LibDAO lib_dao;
	

	@RequestMapping("searchDetail.inc")
	public ModelAndView table(String isbn) {
		String isbn13 = null;
		String libCode =null;
		if(isbn !=null &&isbn.length() > 13) {
			int len =isbn.length();
			isbn13 = isbn.substring(len-13, len-1);
			System.out.println(isbn13);
		}else {
			System.out.println(isbn);
		}
		//RestTemplate
		RestTemplate template = new RestTemplate();
		String apiURL = "https://dapi.kakao.com/v3/search/book?query=9788983925602&target=isbn&sort=accuracy";
		//String apiURL = "https://dapi.kakao.com/v3/search/book?query="+isbn13+"&target=isbn&sort=accuracy";
		HttpHeaders headers = new HttpHeaders();

		headers.add("Authorization", "KakaoAK b81c7bf805c551a9e7825a553c0788cf");
		
		ResponseEntity<String> response = null;
		try {
			RequestEntity<String> rq = new RequestEntity<String>(headers, HttpMethod.GET, new URI(apiURL));
			//ResponseEntity<Map> mapresponse= template.exchange(rq, Map.class);
			
			response = template.exchange(rq, String.class);
			System.out.println(response.getBody());
			
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		//
		
		LibraryVO[] ar = lib_dao.selectLib("서울특별시 관악구");
		for(LibraryVO vo : ar) {
			libCode =vo.getLibCode();
			if(libCode !=null && isbn13 !=null) {
				System.out.print("도서관코드 : "+libCode);
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("searchDetail");
		return mv;
	}
	//받은 정보로 url을 구성한다
	public String makeUrl(String appKey,String libCode, String isbn) {
		StringBuffer sb = new StringBuffer();
		sb.append("http://data4library.kr/api/bookExist?authKey=");
		sb.append(appKey);
		sb.append("&libCode=");
		sb.append(libCode);
		sb.append("&isbn13=");
		sb.append(isbn);
		sb.append("&format=json");
		return sb.toString();
	}
	
}
