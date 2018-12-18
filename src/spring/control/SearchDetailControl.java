package spring.control;

import java.net.URI;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

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
	
	//도서상세정보 출력
	@RequestMapping("searchDetail.inc")
	public ModelAndView searchDetail(String isbn) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("searchDetail");
		String isbn13 = null;
		String libCode =null;
		if(isbn !=null &&isbn.length() > 13) {
			int len =isbn.length();
			isbn13 = isbn.substring(len-13, len);
			System.out.println(isbn13);
		}else {
			System.out.println(isbn);
		}
		//RestTemplate
		RestTemplate template = new RestTemplate();
		String apiURL = "https://dapi.kakao.com/v3/search/book?query="+isbn13+"&target=isbn&sort=accuracy";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK "+kakaoKey);
		ResponseEntity<String> response = null;
		try {
			RequestEntity<String> rq = new RequestEntity<String>(headers, HttpMethod.GET, new URI(apiURL));
			response = template.exchange(rq, String.class);
			System.out.println(response.getBody());
			JsonParser parser = new JsonParser();
			JsonObject jobj = (JsonObject)parser.parse(response.getBody());
			JsonArray jarr= jobj.getAsJsonArray("documents");
			JsonObject jo = jarr.get(0).getAsJsonObject();
			JsonArray authors = jo.getAsJsonArray("authors");
			
			String author = jsarToString(authors);
			String contents = jo.get("contents").getAsString();
			String datetime = jo.get("datetime").getAsString().substring(0, 10);
			String price = jo.get("price").getAsString();
			String publisher = jo.get("publisher").getAsString();
			String thumbnail = jo.get("thumbnail").getAsString();
			String title = jo.get("title").getAsString();
			String translators = jsarToString(jo.getAsJsonArray("translators"));
			mv.addObject("author", author);
			mv.addObject("contents", contents);
			mv.addObject("datetime", datetime);
			mv.addObject("price", price);
			mv.addObject("publisher", publisher);
			mv.addObject("thumbnail", thumbnail);
			mv.addObject("title", title);
			mv.addObject("translators", translators);
			mv.addObject("isbn13", isbn13);
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		return mv;
		
	}
	
	//isbn과 주소를 가지고 해당 지역에 isbn를 가지고 있는 도서관들을 보내준다
	@RequestMapping("searchLib.inc")
	@ResponseBody
	public Map<String, Object> searchLib(String isbn13, String address) {
		if(address == null)
			address = "서울특별시 관악구";
		Map<String, Object> map = new HashMap<>();
		LibraryVO[] ar = lib_dao.selectLib(address);
		JsonParser parser = new JsonParser();
		String libCode = null;
		RestTemplate template = new RestTemplate();
		RequestEntity<String> rq = null;
		ResponseEntity<String> response = null;
		String url = null;
		List<LibraryVO> list = new ArrayList<>();
		for(LibraryVO vo : ar) {
			libCode =vo.getLibCode();
			if(libCode !=null && isbn13 !=null) {
				url = makeUrl(appKey, libCode, isbn13);
				System.out.println("url : "+url);
				try {
					rq =new RequestEntity<String>(HttpMethod.GET, new URI(url));
					//RequestEntity<String> rq = new RequestEntity<String>(headers, HttpMethod.GET, new URI(url1));
					response = template.exchange(rq, String.class);
					System.out.println(response.getBody());
					
					Object obj=parser.parse(response.getBody());
					JsonObject jsonObj = (JsonObject)obj;
					jsonObj = jsonObj.getAsJsonObject("response");
					jsonObj.get("result").toString();
					String hasBook = jsonObj.get("result").toString();
					System.out.println("Lib : "+ libCode + ", hasBook : "+hasBook);
					if(hasBook.equals("Y")) {//책을 갖고 있는 경우
						list.add(vo);
					}
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
		}
		LibraryVO[] hasLibs = new LibraryVO[list.size()];
		list.toArray(hasLibs);
		map.put("ar", hasLibs);
		
		return map;
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
	//jsonArray 객체의 정보를 하나의 String 으로 변환
	public String jsarToString(JsonArray jr) {
		StringBuffer sb = new StringBuffer();
		for(int i =0; i<jr.size(); i++) {
			sb.append(jr.get(i).getAsString());
			if(i != jr.size()-1)
				sb.append(", ");				
		}
		return sb.toString();
	}
	
}
