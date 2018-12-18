package spring.control;

import java.net.URI;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import spring.util.PageUtil;



@Controller
public class SearchBookControl {
	
	public static final int BLOCK_LIST = 20;
	public static final int BLOCK_PAGE = 5;

	String pageCode;

	@RequestMapping("searchbook.inc")
	public String searchbook() {
		return "searchbook";
	}

	@RequestMapping(value = "searchbook.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchbook1(String bookname, String nowPage, HttpSession session) throws Exception {
		//RestTemplate
		RestTemplate template = new RestTemplate();
		
		String apiURL = "https://dapi.kakao.com/v3/search/book?query="+URLEncoder.encode(bookname,"utf-8")+"&sort=accuracy&page="+nowPage+"&size=20";

		HttpHeaders headers = new HttpHeaders();

		headers.add("Authorization", "KakaoAK b81c7bf805c551a9e7825a553c0788cf");
		
		ResponseEntity<String> response = null;
		try {
			RequestEntity<String> rq = new RequestEntity<String>(headers, HttpMethod.GET, new URI(apiURL));
			ResponseEntity<Map> mapresponse= template.exchange(rq, Map.class);
			
			 
			LinkedHashMap<String, Integer> map = (LinkedHashMap<String, Integer>)mapresponse.getBody().get("meta");

			if(nowPage == null || nowPage.equals("0"))
				nowPage = "0";

			int rowTotal = map.get("pageable_count");
			
			PageUtil pvo = new PageUtil(Integer.parseInt(nowPage), rowTotal, BLOCK_LIST, BLOCK_PAGE);
			
			pageCode = pvo.getSb().toString();
		
			response = template.exchange(rq, String.class);
			
			
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		Map<String, Object> mv = new HashMap<String, Object>();
		
		mv.put("booklist", response.getBody());
		mv.put("pagecode", pageCode);
		
		return mv;
	}
}
