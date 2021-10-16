package com.br.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.br.model.vo.BoardVO;
import com.br.model.vo.ReplyVO;
import com.br.mybatis.DBService;

public class BoardDAO {
	
	// 글 작성
	public static int insert(BoardVO bvo) {
		System.out.println("여기일단 오고");
		
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("br.insert", bvo);
		ss.close();
		return result;
	}
	
	// 메인페이지 글 목록 보여주기
	public static List<BoardVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("br.list");
	
		ss.close();
		
		return list;
	}
	
	// 글 보기
	public static BoardVO selectOne(int b_id) {
		SqlSession ss = DBService.getFactory().openSession();
		BoardVO one = ss.selectOne("br.one", b_id);
		ss.close();
		
		return one;
	}
	
	// 댓글 쓰기
	public static int replyInsert(ReplyVO rvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("br.replyInsert", rvo);
		ss.close();
		
		return result;

	}
	// 댓글목록 가져오기
	public static List<ReplyVO> replyList(int tp_boardid) {
		System.out.println(tp_boardid + "id");
		SqlSession ss = DBService.getFactory().openSession();
		List<ReplyVO> rlist = ss.selectList("br.rlist", tp_boardid);
		System.out.println(rlist.toString());
		ss.close();
		
		return rlist;
	}
}
