package com.br.model.vo;

import java.sql.Date;

public class BoardVO {
	private int tp_boardid;
	private String writer;
	private String title;
	private String b_content;
	private Date b_regdate;
	private Date updatedate;
	private Date deletedate;
	private int hit;
	private int tp_id;
	private int b_updown;
	private int f_id;
	private String f_name;
	private String f_path;
	private String tp_name;
	
//	private ReplyVO replyvo;
	
	
	
	
//	public ReplyVO getReplyvo() {
//		return replyvo;
//	}
//
//	public void setReplyvo(ReplyVO replyvo) {
//		this.replyvo = replyvo;
//	}

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_path() {
		return f_path;
	}

	public void setF_path(String f_path) {
		this.f_path = f_path;
	}

	public BoardVO() {
		
	}
	
	public BoardVO(int tp_boardid, String writer, String title, String b_content, Date b_regdate, Date updatedate,
			Date deletedate, int hit) {
		super();
		this.tp_boardid = tp_boardid;
		this.writer = writer;
		this.title = title;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
		this.hit = hit;
		
	}

	

	public int getTp_boardid() {
		return tp_boardid;
	}

	public void setTp_boardid(int tp_boardid) {
		this.tp_boardid = tp_boardid;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Date getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public Date getDeletedate() {
		return deletedate;
	}

	public void setDeletedate(Date deletedate) {
		this.deletedate = deletedate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getTp_id() {
		return tp_id;
	}

	public void setTp_id(int tp_id) {
		this.tp_id = tp_id;
	}


	public int getB_updown() {
		return b_updown;
	}

	public void setB_updown(int b_updown) {
		this.b_updown = b_updown;
	}

	@Override
	public String toString() {
		return "BoardVO [board_id=" + tp_boardid + ", writer=" + writer + ", title=" + title + ", b_content=" + b_content
				+ ", b_regdate=" + b_regdate + ", updatedate=" + updatedate + ", deletedate=" + deletedate + ", hit="
				+ hit + ", tp_id=" + tp_id + ", b_updown=" + b_updown + ", f_id=" + f_id + ", f_name=" + f_name
				+ ", f_path=" + f_path +  "]";
	}

	public String getTp_name() {
		return tp_name;
	}

	public void setTp_name(String tp_name) {
		this.tp_name = tp_name;
	}

	
	
	
}
