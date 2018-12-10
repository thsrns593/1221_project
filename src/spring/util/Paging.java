package spring.util;

public class Paging {
	
	private int nowPage, 
			rowTotal, //�� �Խù� �� 
			blockList, //�� �������� ǥ���� �Խù� ��
			blockPage, //�� ���� ǥ���� ������ �� 
			totalPage, startPage, 
			endPage, begin, end;
	
	private boolean isPrePage;//���� ��� ���ɿ���
	private boolean isNextPage;
	
	//JSP���� ǥ���� ����¡ HTML�ڵ带 ������ ��!
	private StringBuffer sb;	

	public Paging(int nowPage, int rowTotal, 
			int blockList, int blockPage,String board_name) {
		super();
		this.nowPage = nowPage;
		this.rowTotal = rowTotal;
		this.blockList = blockList;
		this.blockPage = blockPage;
		
		//���� ��ɰ� ��������� �ʱ�ȭ
		isPrePage = false;
		isNextPage = false;
		
		//�Էµ� ��ü �Խù��� ���� ����
		// ��ü ������ ���� ���Ѵ�.
		totalPage = (int)Math.ceil((double)rowTotal/blockList);
		
		//���� �������� ���� ��ü �������� ������ ũ�ٸ�
		//��ü �������� ���� ���� ������ ������ �������!
		if(nowPage > totalPage)
			nowPage = totalPage;
		
		//���� ���� ���������� ���� �������������� ���� ���Ѵ�.
		startPage = (int)((nowPage-1)/blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
		
		//������������ ���� ��ü������ ������ ũ�� �ʵ��� �Ѵ�.
		if(endPage > totalPage)
			endPage = totalPage;
		
		//ǥ���� ���� �Խù��� ���ȣ�� ������ �Խù��� ���ȣ��
		//���Ѵ�.(bbs2���̺��� �Խù����� �����ϴ� ���ȣ)
		begin = (nowPage - 1) * blockList + 1;
		end = begin + blockList - 1;
		
		//���� ����� ���������� �˾ƺ���!
		if(startPage > 1)
			isPrePage = true;
		
		//���� ����� ���������� �˾ƺ���!
		if(endPage < totalPage)
			isNextPage = true;
		
		/*<div id="page_num_area">
			<ul class="page_area">
				<li class="page_button page_disable" id="previous_btn">이전</li>
				<li class="page_button page_selected"><a href="#">1</a></li>
				<li class="page_button" ><a href="#">2</a></li>
				<li class="page_button" ><a href="#">3</a></li>
				<li class="page_button" ><a href="#">4</a></li>
				<li class="page_button" ><a href="#">5</a></li>
				<li class="page_button" id="next_btn"><a href="#">다음</a></li>
			</ul>
		</div>*/
		sb = new StringBuffer("<div id='page_num_area'><ol class='page_area'>");
		
		if(isPrePage) {
			sb.append("<li class='page_button'><a href='"+board_name+".inc?nowPage=");
			sb.append(nowPage - blockPage);
			sb.append("'> &lt; </a></li>");
		}else {
			//������� ��Ȱ��ȭ
			sb.append("<li class='page_button page_disable'>  &lt; </li>");
		}
		
		//������ ��ȣ ����ϴ� �ݺ���
		for(int i=startPage ; i<=endPage ; i++) {
			
			//i�� ���� ������������ ���� ���� ����
			// a�±׸� �������� �ʰ� ���ڸ� ����Ѵ�.
			if(i == nowPage) {
				sb.append("<li class='page_button page_selected'><a href='"+board_name+".inc?nowPage=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a></li>");
				
			}else {
				sb.append("<li class='page_button'><a href='"+board_name+".inc?nowPage=");
				sb.append(i);//�Ķ���� ��
				sb.append("'>");// <li><a href='list.inc?nowPage=1'>
				sb.append(i); //ȭ�鿡 ��µǴ� ������ ��ȣ
				sb.append("</a></li>");
			}			
		}//for���� ��!!
		
		
		if(isNextPage) {
			sb.append("<li class='page_button'><a href='"+board_name+".inc?nowPage=");
			sb.append(nowPage + blockPage);
			sb.append("'> &gt; </a></li>");
		}else {
			sb.append("<li class='page_disable'> &gt; </li>");
		}
		sb.append("</ol></div>");
	}//�������� ��!

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
