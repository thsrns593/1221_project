package mybatis.vo;

public class NreplyVO {
	private String nreply_num,	nb_num,	m_id,nreply_to,	nreply_group, nreply_content,
            nreply_cdate,nreply_ip,nreply_status;
	
	private int nowPage, begin, end;
	
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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

	public String getNreply_num() {
		return nreply_num;
	}

	public void setNreply_num(String nreply_num) {
		this.nreply_num = nreply_num;
	}

	public String getNb_num() {
		return nb_num;
	}

	public void setNb_num(String nb_num) {
		this.nb_num = nb_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getNreply_to() {
		return nreply_to;
	}

	public void setNreply_to(String nreply_to) {
		this.nreply_to = nreply_to;
	}

	public String getNreply_group() {
		return nreply_group;
	}

	public void setNreply_group(String nreply_group) {
		this.nreply_group = nreply_group;
	}

	public String getNreply_content() {
		return nreply_content;
	}

	public void setNreply_content(String nreply_content) {
		this.nreply_content = nreply_content;
	}

	public String getNreply_cdate() {
		return nreply_cdate;
	}

	public void setNreply_cdate(String nreply_cdate) {
		this.nreply_cdate = nreply_cdate;
	}

	public String getNreply_ip() {
		return nreply_ip;
	}

	public void setNreply_ip(String nreply_ip) {
		this.nreply_ip = nreply_ip;
	}

	public String getNreply_status() {
		return nreply_status;
	}

	public void setNreply_status(String nreply_status) {
		this.nreply_status = nreply_status;
	}
}
