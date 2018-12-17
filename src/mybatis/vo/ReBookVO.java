package mybatis.vo;

public class ReBookVO {
				   //응답결과건수,목록,도서,순번,도서명,	저자명,  출판사,     출판년도,       13 자리  ISBN,  부가기호    ,   권 , 주제분류, 도서  이미지  URL
	private String resultNum,docs,book,no,bookname,authors,publisher,publication_year,isbn13,addition_symbol,vol,class_no,bookImageURL;

				public ReBookVO() {
					super();
				}

				public ReBookVO(String resultNum, String docs, String book, String no, String bookname, String authors,
						String publisher, String publication_year, String isbn13, String addition_symbol, String vol,
						String class_no, String bookImageURL) {
					super();
					this.resultNum = resultNum;
					this.docs = docs;
					this.book = book;
					this.no = no;
					this.bookname = bookname;
					this.authors = authors;
					this.publisher = publisher;
					this.publication_year = publication_year;
					this.isbn13 = isbn13;
					this.addition_symbol = addition_symbol;
					this.vol = vol;
					this.class_no = class_no;
					this.bookImageURL = bookImageURL;
				}

				public String getResultNum() {
					return resultNum;
				}

				public void setResultNum(String resultNum) {
					this.resultNum = resultNum;
				}

				public String getDocs() {
					return docs;
				}

				public void setDocs(String docs) {
					this.docs = docs;
				}

				public String getBook() {
					return book;
				}

				public void setBook(String book) {
					this.book = book;
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

				public String getAddition_symbol() {
					return addition_symbol;
				}

				public void setAddition_symbol(String addition_symbol) {
					this.addition_symbol = addition_symbol;
				}

				public String getVol() {
					return vol;
				}

				public void setVol(String vol) {
					this.vol = vol;
				}

				public String getClass_no() {
					return class_no;
				}

				public void setClass_no(String class_no) {
					this.class_no = class_no;
				}

				public String getBookImageURL() {
					return bookImageURL;
				}

				public void setBookImageURL(String bookImageURL) {
					this.bookImageURL = bookImageURL;
				}
	
	
}
