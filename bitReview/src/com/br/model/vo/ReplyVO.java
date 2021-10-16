package com.br.model.vo;

public class ReplyVO {
	
	private int tp_replyid;
	private int tp_boardid;
	private String r_writer;
	private String r_content;
	private String r_regdate;
	private int r_updown;
	
	
	public int getTp_replyid() {
		return tp_replyid;
	}
	public void setTp_replyid(int tp_replyid) {
		this.tp_replyid = tp_replyid;
	}
	
	public int getTp_boardid() {
		return tp_boardid;
	}
	public void setTp_boardid(int tp_boardid) {
		this.tp_boardid = tp_boardid;
	}
	
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
	}
	public int getR_updown() {
		return r_updown;
	}
	public void setR_updown(int r_updown) {
		this.r_updown = r_updown;
	}
	@Override
	public String toString() {
		return "ReplyVO [tp_replyid=" + tp_replyid + ", tp_boardid=" + tp_boardid + ", r_writer=" + r_writer
				+ ", r_content=" + r_content + ", r_regdate=" + r_regdate + ", r_updown=" + r_updown + "]";
	}
	
	
	
}
