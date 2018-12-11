package mybatis.vo;

import org.springframework.web.multipart.MultipartFile;

public class NormalVO {
	
	private String nb_num, nb_title, m_id, nb_category, nb_hit, nb_content, nb_fname,nb_oname,nb_cdate,nb_edate,nb_ip,nb_status;
	
	private String cate,searchType,searchValue;
	private int nowPage, begin, end;
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

	private MultipartFile upload;
	
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

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getNb_num() {
		return nb_num;
	}

	public void setNb_num(String nb_num) {
		this.nb_num = nb_num;
	}

	public String getNb_title() {
		return nb_title;
	}

	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getNb_category() {
		return nb_category;
	}

	public void setNb_category(String nb_category) {
		this.nb_category = nb_category;
	}

	public String getNb_hit() {
		return nb_hit;
	}

	public void setNb_hit(String nb_hit) {
		this.nb_hit = nb_hit;
	}

	public String getNb_content() {
		return nb_content;
	}

	public void setNb_content(String nb_content) {
		this.nb_content = nb_content;
	}

	public String getNb_fname() {
		return nb_fname;
	}

	public void setNb_fname(String nb_fname) {
		this.nb_fname = nb_fname;
	}

	public String getNb_oname() {
		return nb_oname;
	}

	public void setNb_oname(String nb_oname) {
		this.nb_oname = nb_oname;
	}

	public String getNb_cdate() {
		return nb_cdate;
	}

	public void setNb_cdate(String nb_cdate) {
		this.nb_cdate = nb_cdate;
	}

	public String getNb_edate() {
		return nb_edate;
	}

	public void setNb_edate(String nb_edate) {
		this.nb_edate = nb_edate;
	}

	public String getNb_ip() {
		return nb_ip;
	}

	public void setNb_ip(String nb_ip) {
		this.nb_ip = nb_ip;
	}

	public String getNb_status() {
		return nb_status;
	}

	public void setNb_status(String nb_status) {
		this.nb_status = nb_status;
	}
	
}
