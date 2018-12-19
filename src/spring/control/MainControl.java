package spring.control;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.vo.DataVO;
import spring.util.PageUtil;
import spring.util.Paging_main;
import spring.util.Paging_popular;

@Controller
public class MainControl {
	int maxSize = 30;
	int block_list = 6;
	int block_page =3;
	
	@Autowired
	HttpSession session;
	@RequestMapping("main.inc")
	public String main() {
		System.out.println("메인시작!");
		return "main";
	}
	
	

	 //추천도서
	@RequestMapping(value="/main_recommend.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> bookList(String value, String nowPage) throws Exception {
		if(nowPage ==null)
			nowPage ="1";
		System.out.println(value+"  "+nowPage);
		List<Element> b_list = null;
		Object obj = session.getAttribute("b_list");
		if(obj == null) {
			//URL 생성!
			URL url = new URL("http://data4library.kr/api/recommandList?authKey=b04eff4b086e9b0502ac17bf55bdf725e21d3bffabc915362b7ddbf05f2bb67e&isbn13="+value+"&pageNo="+nowPage+"&pageSize=6");	
		
			//URL url = new URL("http://data4library.kr/api/loanItemSrch?authKey=b04eff4b086e9b0502ac17bf55bdf725e21d3bffabc915362b7ddbf05f2bb67e&startDt=2018-12-10&endDt=2018-12-16&pageSize=6&pageNo="+nowPage+"&region="+value);
			
			//접속을 하기 위해 연결통로(Connection)을 연다.
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			//응답 받을 형식을 지정한다.
			conn.setRequestProperty("Content-Type", "application/xml"); //xml로 받을 거다.
			
			conn.connect();//요청 - 접속
			
			//응답이 xml형식으로 넘어오는 것을 파싱하기 위해 우린 JDOM파서를 설치했다. (읽을때는 싹스파서, 재사용은 DOM구조로 이루어져 있다.)
			//싹스파서는 문서하나를 딱 읽을때는 빠른데 재사용 하려면 다시 또 읽어들인다.
			
			SAXBuilder builder = new SAXBuilder();
			
			//응답 자원인 xml문서를 DOM구조화 시킨다.
			Document document = builder.build(conn.getInputStream()); //xml문서경로는 conn이 준다!! 즉 conn이 inputstream을 통해 읽어온다!
	 		
			//루트 엘리먼트 얻기
			Element root = document.getRootElement(); //response
			
			//루트 안에 있는 docs요소를 검색한다.
			Element docs =  root.getChild("docs");
			
	
			//docs가 가지는 doc이라는 자식들을 검색한다.
			//List<Element> b_list =  docs.getChildren("doc"); //이름이 doc
			b_list =  docs.getChildren("book"); //이름이 book
			session.setAttribute("b_list", b_list );
			
		}else {
			b_list = (List<Element>)session.getAttribute("b_list");
		}
		
		//PageUtil pu = new PageUtil(Integer.parseInt(nowPage), maxSize, 6, 3);
		Paging_main pm = new Paging_main(Integer.parseInt(nowPage), maxSize, block_list, block_page, value);
		
		
		//Paging_main pg = new Paging_main(Integer.parseInt(nowPage), 30, 6, 3,value); //페이징 객체 생성;
				
		System.out.println("b_list의 사이즈:"+b_list.size());
		
		DataVO[] ar = new DataVO[block_list]; // 사이즈만큼의 DataVO를 생성만 해놓음!!
		
		//e_list의 길이만큼 반복문을 수행 하면서 DataVO를 하나씩 생성하여 item의 값을 저장한 후 배열인 ar에 DataVO를 저장한다.
		int offset = (Integer.parseInt(nowPage)-1) * block_list;
		for(int i=0; i<block_list; i++) {
			//e_list에 있는 item이 하나씩 검출되어 item이라는 변수에 대입된 후 반복문을 수행한다.
			Element item = b_list.get(i + offset);
			//선택된 item의 자식들 중 titl이라는 요소의 문자값을 얻어낸다.
			String no = item.getChildText("no");
			String bookname = item.getChildText("bookname");
			String authors = item.getChildText("authors");
			String publisher = item.getChildText("publisher");
			String publication_year = item.getChildText("publication_year");
			String isbn13 = item.getChildText("isbn13");
			String bookImageURL = item.getChildText("bookImageURL");
			System.out.println("no: "+no+" bookname : "+bookname);
			DataVO vo= new DataVO(no, bookname, authors, publisher, publication_year, isbn13, bookImageURL);
			ar[i] = vo;
		}
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("b_list", ar);
		String pageCode =pm.getSb().toString();
		map.put("pageCode", pageCode);
		return map;
	}
}
