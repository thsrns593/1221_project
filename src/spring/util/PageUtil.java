package spring.util;

public class PageUtil {
	private int nowPage, //어느 페이지를 보고 있었는지
	rowTotal, //출력할 전체 게시물 수 
	blockList, //한페이지에 보여질 게시물 수
	blockPage, //한번에 보여질 페이지세트 
	totalPage, //총 페이지 수 
	startPage, //페이지세트의 처음페이지
	endPage, //페이지세트의 마지막페이지
	begin, end; //몇개를 검색해 올 것인지 begin부터 end까지

	private boolean isPrePage; //이전 페이지세트가 존재하는지
	private boolean isNextPage; // 다음 페이지 세트가 존재하는지
	
	private StringBuffer sb; //페이지세트 HTML코드를 만들어서 보내준다
	
	public PageUtil(int nowPage, int rowTotal, 
			int blockList, int blockPage) {
		this.nowPage = nowPage;
		this.rowTotal = rowTotal;
		this.blockList = blockList;
		this.blockPage = blockPage;
		isPrePage = false;
		isNextPage = false;
		totalPage = (int)Math.ceil((double)rowTotal/blockList);
		if(nowPage > totalPage)
			nowPage = totalPage;
		startPage = (int)((nowPage-1)/blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
		if(endPage > totalPage)
			endPage = totalPage;
		begin = (nowPage - 1) * blockList + 1;
		end = begin + blockList - 1;
		if(startPage > 1)
			isPrePage = true;
		if(endPage < totalPage)
			isNextPage = true;
		//페이지세트 부분을 HTML코드로 생성하여 스트링버퍼에 저장한다.
		sb = new StringBuffer("<div id='page_num_area'><ol class='page_area'>");
		
		if(isPrePage) { //이전 페이지 세트가 존재하면
			sb.append("<li class='page_button'><a href='javascript:goPage(");
			sb.append(nowPage - blockPage);
			sb.append(")'> &lt; </a></li>");
		}else { //이전 페이지세트로 못가는 경우
			sb.append("<li class='page_button page_disable'>  &lt; </li>");
		}
		
		// 페이지세트의 숫자페이지를 만든다
		for(int i=startPage ; i<=endPage ; i++) {
			if(i == nowPage) {//현재 선택한 페이지이면
				sb.append("<li class='page_button page_selected'>");
			}else {//선택하지 않은 페이지
				sb.append("<li class='page_button'>");
			}			
			sb.append("<a href='javascript:goPage(");
			sb.append(i);
			sb.append(")'>");
			sb.append(i);
			sb.append("</a></li>");
		}
		//다음페이지세트가 존재하는 경우
		if(isNextPage) {
			sb.append("<li class='page_button'><a href='javascript:goPage(");
			sb.append(nowPage + blockPage);
			sb.append(")'> &gt; </a></li>");
		}else {
			sb.append("<li class='page_button page_disable'> &gt; </li>");
		}
		sb.append("</ol></div>");
		
	}

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
	
}
