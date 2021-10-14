package com.br.model.vo;

public class ReplyVO {
	
	private int reply_id;
	private int board_id;
	private String r_writer;
	private String r_content;
	private String r_regdate;
	private int r_updown;
	
	
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
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
	
	
}
