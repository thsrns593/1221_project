package spring.control;

import java.net.URI;
import java.net.URLEncoder;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@Controller
public class SearchBookControl {

	@RequestMapping("searchbook.inc")
	public String searchbook() {
		return "searchbook";
	}

	@RequestMapping(value = "searchbook.inc", method = RequestMethod.POST)
	public String searchbook1(String bookname) throws Exception {

		RestTemplate template = new RestTemplate();
		
		String apiURL = "https://dapi.kakao.com/v3/search/book?query="+URLEncoder.encode(bookname,"utf-8");

		HttpHeaders headers = new HttpHeaders();

		headers.add("Authorization", "KakaoAK b81c7bf805c551a9e7825a553c0788cf");
		try {
			RequestEntity<String> rq = new RequestEntity<String>(headers, HttpMethod.GET, new URI(apiURL));

			ResponseEntity<String> response = template.exchange(rq, String.class);

			System.out.println(response.getHeaders());
			System.out.println(response.getBody());

			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		return "searchbook";
	}
}
