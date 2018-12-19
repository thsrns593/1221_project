package spring.util;

public class Paging_main {
	
		private int nowPage, 
		rowTotal, //총 게시물 수 
		blockList, //한 페이지에 표현될 게시물 수
		blockPage, //한 블럭당 표현할 페이지 수 
		totalPage, startPage, 
		endPage, begin, end;
	
	private String value;
	
	private boolean isPrePage;//이전 기능 가능여부
	private boolean isNextPage;
	
	//JSP에서 표현할 페이징 HTML코드를 저장할 곳!
	private StringBuffer sb;	
	
	public Paging_main(int nowPage, int rowTotal, 
		int blockList, int blockPage, String value) {
	super();
	
	this.nowPage = nowPage;
	this.rowTotal = rowTotal;
	this.blockList = blockList;
	this.blockPage = blockPage;
	this.value = value;
	
	
	//이전 기능과 다음기능을 초기화
	isPrePage = false;
	isNextPage = false;
	
	//입력된 전체 게시물의 수를 통해
	// 전체 페이지 수를 구한다.
	totalPage = (int)Math.ceil((double)rowTotal/blockList);
	
	//현재 페이지의 값이 전체 페이지의 값보다 크다면
	//전체 페이지의 값을 현재 페이지 값으로 사용하자!
	if(nowPage > totalPage)
		nowPage = totalPage;
	
	
	//현재 블럭의 시작페이지 값과 마지막페이지의 값을 구한다.
	startPage = (int)((nowPage-1)/blockPage) * blockPage + 1;
	endPage = startPage + blockPage - 1;
	
	//마지막페이지 값이 전체페이지 값보다 크지 않도록 한다.
	if(endPage > totalPage)
		endPage = totalPage;
	
	//표현할 시작 게시물의 행번호와 마지막 게시물의 행번호를
	//구한다.(bbs2테이블에서 게시물들을 추출하는 행번호)
	begin = (nowPage - 1) * blockList + 1;
	end = begin + blockList - 1;
	
	if(end >rowTotal)
		end = rowTotal;
	//이전 기능이 가능한지를 알아보자!
	if(startPage > 1)
		isPrePage = true;
	
	//다음 기능이 가능한지를 알아보자!
	if(endPage < totalPage)
		isNextPage = true;
	
	// 이제 현재페이지 값도 알고, 시작페이지와 마지막페이지 값을
	// 알았으니 페이징 기법에 사용할 코드를 작성하여
	// StringBuffer에 저장하자!
	sb = new StringBuffer("<ul class='pagination justify-content-center'>");
	sb.append("<li class='page-item'>");
	if(isPrePage) {
			sb.append("<a class='page-link' href='javascript:exe(");
			sb.append(value);
			sb.append(",");
			//sb.append(nowPage - blockPage);
			sb.append(nowPage - 1);
			sb.append(")'aria-label='Previous'>");
			sb.append("<span aria-hidden='true'><</span>");
			sb.append( "<span class='sr-only'>Previous</span></a></li>");
		
	}else {
		//이전기능 비활성화
		sb.append("<li class='disable page-link'>");
		sb.append("<span aria-hidden='false'><</span>");
		sb.append("<span class='sr-only'>Previous</span></li>");
	}
	
	//페이지 번호 출력하는 반복문
	for(int i=startPage ; i<=endPage ; i++) {
		
		//i의 값이 현재페이지의 값과 같을 때는
		// a태그를 지정하지 않고 숫자만 출력한다.
		if(i == nowPage) {
			sb.append("<li class='page-item'>");
			sb.append("<li class='page-link disable'>");
			sb.append(i);
			sb.append("</li>");
			sb.append("</li>");
		}else {
			/*sb.append("<li><a href='popular_book.inc?nowPage=");*/
			//sb.append(i);//파라미터 값
			//sb.append("'>");// <li><a href='list.inc?nowPage=1'>
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:exe(");
			sb.append(value);
			sb.append(",");
			sb.append(i);
			sb.append(")'>");
			sb.append(i); //화면에 출력되는 페이지 번호
			sb.append("</a></li>");
		
		}			
	}//for문의 끝!!
	
	//다음기능 가능여부를 확인한다.
	if(isNextPage) {
		sb.append("<li class='page-item'>");
		sb.append("<a class='page-link' href='javascript:exe(");
		sb.append(value);
		sb.append(",");
		//sb.append(nowPage + blockPage);
		sb.append(nowPage + 1);
		sb.append(")'aria-label='Next'>");
		sb.append("<span aria-hidden='true'>></span>");
		sb.append("<span class='sr-only'>Next</span></a></li>");
		
	}else {
		sb.append("<li class='page-link disable'>");
		sb.append("<span aria-hidden='true'>></span>");
		sb.append("<span class='sr-only'>Previous</span></li>");
	}
	sb.append("</ul>");
	}//생성자의 끝!
	
	public int getNowPage() {
	return nowPage;
	}
	
	public void setNowPage(int nowPage) {
	this.nowPage = nowPage;
	}
	
	public int getRowTotal() {
	return rowTotal;
	}
	
	public void setRowTotal(int rowTotal) {
	this.rowTotal = rowTotal;
	}
	
	public int getBlockList() {
	return blockList;
	}
	
	public void setBlockList(int blockList) {
	this.blockList = blockList;
	}
	
	public int getBlockPage() {
	return blockPage;
	}
	
	public void setBlockPage(int blockPage) {
	this.blockPage = blockPage;
	}
	
	public int getTotalPage() {
	return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
	this.totalPage = totalPage;
	}
	
	public int getStartPage() {
	return startPage;
	}
	
	public void setStartPage(int startPage) {
	this.startPage = startPage;
	}
	
	public int getEndPage() {
	return endPage;
	}
	
	public void setEndPage(int endPage) {
	this.endPage = endPage;
	}
	
	public int getBegin() {
	return begin;
	}
	
	public void setBegin(int begin) {
	this.begin = begin;
	}
	
	public int getEnd() {
	return end;
	}
	
	public void setEnd(int end) {
	this.end = end;
	}
	
	public boolean isPrePage() {
	return isPrePage;
	}
	
	public void setPrePage(boolean isPrePage) {
	this.isPrePage = isPrePage;
	}
	
	public boolean isNextPage() {
	return isNextPage;
	}
	
	public void setNextPage(boolean isNextPage) {
	this.isNextPage = isNextPage;
	}
	
	public StringBuffer getSb() {
	return sb;
	}
	
	public void setSb(StringBuffer sb) {
	this.sb = sb;
	}
	public String getValue() {
	return value;
	}
	
	public void setValue(String value) {
	this.value = value;
	}
}
