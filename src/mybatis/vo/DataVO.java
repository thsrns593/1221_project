package mybatis.vo;

//응답메시지
public class DataVO {
					//순위	도서명	  저자명		출판사		출판년도			isbn	도서 이미지 URL
	private String no, bookname, authors, publisher, publication_year, isbn13, bookImageURL;

	
	public DataVO() {}; //기본 생성자
	
	public DataVO(String no, String bookname, String authors, String publisher, String publication_year,
			String isbn13, String bookImageURL) {
		super();
		this.no = no;
		this.bookname = bookname;
		this.authors = authors;
		this.publisher = publisher;
		this.publication_year = publication_year;
		this.isbn13 = isbn13;
		this.bookImageURL = bookImageURL;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPublication_year() {
		return publication_year;
	}

	public void setPublication_year(String publication_year) {
		this.publication_year = publication_year;
	}

	public String getIsbn13() {
		return isbn13;
	}

	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}

	public String getBookImageURL() {
		return bookImageURL;
	}

	public void setBookImageURL(String bookImageURL) {
		this.bookImageURL = bookImageURL;
	}
			


}
