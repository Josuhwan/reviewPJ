package com.br.model.vo;

import java.sql.Date;

public class BoardVO {
	private int board_id;
	private String writer;
	private String title;
	private String b_content;
	private Date b_regdate;
	private Date updatedate;
	private Date deletedate;
	private int hit;
	private int tp_id;
	private String fild_id;
	private String fild_name;
	private int b_updown;
	
	
	

	public BoardVO() {
		
	}
	
	public BoardVO(int board_id, String writer, String title, String b_content, Date b_regdate, Date updatedate,
			Date deletedate, int hit) {
		super();
		this.board_id = board_id;
		this.writer = writer;
		this.title = title;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
		this.hit = hit;
		
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
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

	public String getFild_id() {
		return fild_id;
	}

	public void setFild_id(String fild_id) {
		this.fild_id = fild_id;
	}

	public String getFild_name() {
		return fild_name;
	}

	public void setFild_name(String fild_name) {
		this.fild_name = fild_name;
	}

	@Override
	public String toString() {
		return "BoardVO [board_id=" + board_id + ", writer=" + writer + ", title=" + title + ", b_content=" + b_content
				+ ", b_regdate=" + b_regdate + ", updatedate=" + updatedate + ", deletedate=" + deletedate + ", hit="
				+ hit + ", tp_id=" + tp_id + ", fild_id=" + fild_id + ", fild_name=" + fild_name + ", getBoard_id()="
				+ getBoard_id() + ", getWriter()=" + getWriter() + ", getTitle()=" + getTitle() + ", getB_content()="
				+ getB_content() + ", getB_regdate()=" + getB_regdate() + ", getUpdatedate()=" + getUpdatedate()
				+ ", getDeletedate()=" + getDeletedate() + ", getHit()=" + getHit() + ", getTp_id()=" + getTp_id()
				+ ", getFild_id()=" + getFild_id() + ", getFild_name()=" + getFild_name() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public int getB_updown() {
		return b_updown;
	}

	public void setB_updown(int b_updown) {
		this.b_updown = b_updown;
	}

	
	
	
}
