package spring.control;

import java.net.URI;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import mybatis.vo.LibraryVO;

@Controller
public class LibraryControl {

	@Autowired
	private LibDAO lib_dao;

	@RequestMapping("addlib.inc")
	public ModelAndView addlib(String page) {
		
		if(page == null)
			page = "1";

		RestTemplate template = new RestTemplate();

		String apiURL = "http://data4library.kr/api/libSrch?authKey=b04eff4b086e9b0502ac17bf55bdf725e21d3bffabc915362b7ddbf05f2bb67e&pageNo="
				+ page+ "&pageSize=200&format=json";

		try {
			RequestEntity<String> rq = new RequestEntity<String>(HttpMethod.GET, new URI(apiURL));
			ResponseEntity<String> response = template.getForEntity(new URI(apiURL), String.class);

			JsonObject jobj = null;
			JsonParser parser = new JsonParser();
			Object obj = parser.parse(response.getBody());
			jobj = (JsonObject) obj;

			JsonArray jar = jobj.getAsJsonObject("response").getAsJsonArray("libs");

			String libCode = null;
			String libName = "";
			String address = "";
			String tel = "";
			String fax = "";
			String latitude = "";
			String longitude = "";
			String homepage = "";
			String closed = "";
			String operationTime = "";
			String bookcount = "";

			for (JsonElement vo : jar) {
				obj = parser.parse(vo.toString());
				jobj = (JsonObject) obj;

				if (jobj.get("lib").getAsJsonObject().get("libCode") != null)
					libCode = jobj.get("lib").getAsJsonObject().get("libCode").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("libName") != null)
					libName = jobj.get("lib").getAsJsonObject().get("libName").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("address") != null)
					address = jobj.get("lib").getAsJsonObject().get("address").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("tel") != null)
					tel = jobj.get("lib").getAsJsonObject().get("tel").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("fax") != null)
					fax = jobj.get("lib").getAsJsonObject().get("fax").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("latitude") != null)
					latitude = jobj.get("lib").getAsJsonObject().get("latitude").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("longitude") != null)
					longitude = jobj.get("lib").getAsJsonObject().get("longitude").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("homepage") != null)
					homepage = jobj.get("lib").getAsJsonObject().get("homepage").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("closed") != null)
					closed = jobj.get("lib").getAsJsonObject().get("closed").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("operatingTime") != null)
					operationTime = jobj.get("lib").getAsJsonObject().get("operatingTime").getAsString();

				if (jobj.get("lib").getAsJsonObject().get("BookCount") != null)
					bookcount = jobj.get("lib").getAsJsonObject().get("BookCount").getAsString();

				LibraryVO lvo = new LibraryVO(libCode, libName, address, tel, fax, latitude, longitude, homepage,
						closed, operationTime, bookcount);

				lib_dao.insertLib(lvo);

			}
			//System.out.println("페이지 :" +page+"끝");
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("page",page);
		mv.setViewName("pagecomplete");
		
		return mv;
	}
}
