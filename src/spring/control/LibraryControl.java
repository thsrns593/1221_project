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
	@ResponseBody
	public void addlib() {
		
		RestTemplate template = new RestTemplate();
		String apiURL = "http://data4library.kr/api/libSrch?authKey=28976a95aa52c5becbaa99d9c166f26e15331ad5d1c5546b7b97c4ddca00609d&pageNo=1&pageSize=830&format=json";

		try {
			System.out.println("보내기");
			RequestEntity<String> rq = new RequestEntity<String>(HttpMethod.GET, new URI(apiURL));
			ResponseEntity<String> response= template.getForEntity(new URI(apiURL), String.class);
			
			JsonObject jobj = null;
			JsonParser parser = new  JsonParser();
			Object obj = parser.parse(response.getBody());
			jobj = (JsonObject)obj;

			JsonArray jar =  jobj.getAsJsonObject("response").getAsJsonArray("libs");
			
			String libCode = null;
			String libName = null;
			String address = null;
			String tel = null;
			String fax = null;
			String latitude = null;
			String longitude = null;
			String homepage = null;
			String closed = null; 
			String operationTime = null;
			String bookcount = null;

			for(JsonElement vo : jar) {
				obj = parser.parse(vo.toString());
				jobj = (JsonObject)obj;
				
				if(jobj.get("lib").getAsJsonObject().get("libCode") != null)
					libCode = jobj.get("lib").getAsJsonObject().get("libCode").toString().replaceAll("\"", "");
				
				if(jobj.get("lib").getAsJsonObject().get("libName") != null)
					libName = jobj.get("lib").getAsJsonObject().get("libName").toString().replaceAll("\"", "");;
				
				if(jobj.get("lib").getAsJsonObject().get("address") != null)
					address = jobj.get("lib").getAsJsonObject().get("address").toString().replaceAll("\"", "");;
				
				if(jobj.get("lib").getAsJsonObject().get("tel") != null)
					tel = jobj.get("lib").getAsJsonObject().get("tel").toString().replaceAll("\"", "");;
				
				if(jobj.get("lib").getAsJsonObject().get("fax") != null)			
					fax = jobj.get("lib").getAsJsonObject().get("fax").toString().replaceAll("\"", "");;
				
				if(jobj.get("lib").getAsJsonObject().get("latitude") != null)					
					latitude = jobj.get("lib").getAsJsonObject().get("latitude").toString().replaceAll("\"", "");;
				
				if(jobj.get("lib").getAsJsonObject().get("longitude") != null)					
					longitude = jobj.get("lib").getAsJsonObject().get("longitude").toString().replaceAll("\"", "");;
				
				if(jobj.get("lib").getAsJsonObject().get("homepage") != null)					
					homepage = jobj.get("lib").getAsJsonObject().get("homepage").toString().replaceAll("\"", "");;
				
				if(jobj.get("lib").getAsJsonObject().get("closed") != null)					
					closed = jobj.get("lib").getAsJsonObject().get("closed").toString().replaceAll("\"", "");;
				
				if(jobj.get("lib").getAsJsonObject().get("operatingTime") != null)					
					operationTime = jobj.get("lib").getAsJsonObject().get("operatingTime").toString().replaceAll("\"", "");;
				
				if(jobj.get("lib").getAsJsonObject().get("BookCount") != null)					
					bookcount = jobj.get("lib").getAsJsonObject().get("BookCount").toString().replaceAll("\"", "");;
			
				LibraryVO lvo = new LibraryVO(libCode, libName, address, tel, fax, latitude, longitude, homepage, closed, operationTime, bookcount);
				
				lib_dao.insertLib(lvo);
			}
			

			
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
