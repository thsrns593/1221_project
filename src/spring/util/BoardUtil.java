package spring.util;

public class BoardUtil {
	private String nowPage, cate, searchType,searchValue;

	public BoardUtil() {}
	
	public BoardUtil(String nowPage, String cate, String searchType, String searchValue) {
		super();
		this.nowPage = nowPage;
		this.cate = cate;
		this.searchType = searchType;
		this.searchValue = searchValue;
	}

	public String getNowPage() {
		return nowPage;
	}

	public void setNowPage(String nowPage) {
		this.nowPage = nowPage;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

}
