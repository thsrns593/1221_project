package spring.control;

import java.io.Console;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Case;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;

import mybatis.vo.DataVO;
import spring.util.Paging_popular;

/*import mybatis.dao.BoardDAO;
import mybatis.vo.BoardVO;*/

@Controller
public class Popular_BookControl {
	
	//페이징 기법을 위한 상수들
	
	public static final int BLOCK_LIST = 12;
	public static final int BLOCK_PAGE = 5; //한 블럭당 페이지 수 

	int nowPage; //현재 페이지 값
	int rowTotal; //전체 게시물 수 
	String pageCode; //페이징 처리된 HTML코드가 저장될 곳!
	
	@RequestMapping("popular_book.inc")
	public ModelAndView popular_book(HttpServletRequest request, 
			HttpServletResponse response) {
		
/*		String c_page =  request.getParameter("nowPage");
		
		if(c_page == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(c_page);
		
		//탭의 종류를 구별?
		
		//종 게시물의 수를 얻어낸다.
		rowTotal = 100;
		
		//페이징 처리를 하는 객체 생성
		Paging_popular page = new Paging_popular(nowPage, rowTotal, BLOCK_LIST,BLOCK_PAGE);
		nowPage = page.getNowPage();
		pageCode = page.getSb().toString(); //페이징 HTML코드
		
		//목록을 받아오기 위해 begin과 end값을 얻어낸다.
		int begin = page.getBegin();
		int end = page.getEnd();*/
		
/*		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));*/
		
		ModelAndView mv = new ModelAndView();
/*		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("pageCode", pageCode);*/
		mv.setViewName("popular_book");
		return mv;
	}
	
/*	public Map<String, Object> bookTitle() {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		List<String> list = new ArrayList<String>();
		list.add("동구밭");
		list.add("과수원길");
		
		map.put("b_list", list);
		return map;
	}*/
	
	@RequestMapping(value="/popular_book.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> bookList(String value, String nowPage, String value2) throws Exception {
		if(nowPage ==null)
			nowPage ="1";
		else if(Integer.parseInt(nowPage) >17) {
			nowPage = String.valueOf(17);
		}
		System.out.println(value+nowPage+value2);
		
		String url_str ="";
		
		if(value == null) {
			url_str = "http://data4library.kr/api/loanItemSrch?authKey=28976a95aa52c5becbaa99d9c166f26e15331ad5d1c5546b7b97c4ddca00609d&startDt=2018-12-10&endDt=2018-12-16&pageSize=12&pageNo="+nowPage;	
		}
		else if(value != null && value2.equals("3")){	
			url_str = "http://data4library.kr/api/loanItemSrch?authKey=28976a95aa52c5becbaa99d9c166f26e15331ad5d1c5546b7b97c4ddca00609d&startDt=2018-12-10&endDt=2018-12-16&pageSize=12&pageNo="+nowPage+"&region="+value;
		}
		else if(value !=null && value2.equals("4")){
			url_str = "http://data4library.kr/api/loanItemSrch?authKey=28976a95aa52c5becbaa99d9c166f26e15331ad5d1c5546b7b97c4ddca00609d&startDt=2018-12-10&endDt=2018-12-16&pageSize=12&pageNo="+nowPage+"&age="+value;
		}
		else if(value !=null && (value2.equals("0") || value2.equals("1"))) {
			url_str = "http://data4library.kr/api/loanItemSrch?authKey=28976a95aa52c5becbaa99d9c166f26e15331ad5d1c5546b7b97c4ddca00609d&startDt=2018-12-10&endDt=2018-12-16&pageSize=12&pageNo="+nowPage+"&age="+value+"&gender="+value2;
		}
		
		

		//URL 생성!
			URL url = new URL(url_str);
		
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
		List<Element> b_list =  docs.getChildren("doc"); //이름이 item인 아이들만 온다.
		
		Paging_popular pg = null;
			
			if(value == null) {
				pg = new Paging_popular(Integer.parseInt(nowPage), 200, 12, 5,null,value2); //페이징 객체 생성
			}else if(value !=null && value2 !=null) {
				pg = new Paging_popular(Integer.parseInt(nowPage), 200, 12, 5, value, value2); //페이징 객체 생성
			}
		
		System.out.println("b_list의 사이즈:"+b_list.size());
		DataVO[] ar = new DataVO[b_list.size()]; // b_list사이즈만큼의 DataVO를 생성만 해놓음!!
		
		//e_list의 길이만큼 반복문을 수행 하면서 DataVO를 하나씩 생성하여 item의 값을 저장한 후 배열인 ar에 DataVO를 저장한다.
		
		int i =0;
		for(Element item : b_list) {
			//e_list에 있는 item이 하나씩 검출되어 item이라는 변수에 대입된 후 반복문을 수행한다.
			
			//선택된 item의 자식들 중 titl이라는 요소의 문자값을 얻어낸다.
			String no = item.getChildText("no");
			String bookname = item.getChildText("bookname");
			String authors = item.getChildText("authors");
			String publisher = item.getChildText("publisher");
			String publication_year = item.getChildText("publication_year");
			String isbn13 = item.getChildText("isbn13");
			String bookImageURL = item.getChildText("bookImageURL");
		
			//받은 자원들을 DataVO를 생성하여 저장한다.
			DataVO vo= new DataVO(no, bookname, authors, publisher, publication_year, isbn13, bookImageURL);
			
		/*	System.out.println(vo.getRanking()+vo.getBookname());*/
			
			//생성된 vo를 배열에 저장!
			ar[i++] = vo;
		}
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("b_list", ar);
		String pageCode =pg.getSb().toString();
		map.put("pageCode", pageCode);
		return map;
	}
}
