package com.br.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.br.model.vo.BoardVO;
import com.br.model.vo.ReplyVO;
import com.br.mybatis.DBService;

public class BoardDAO {
	
	// 글 작성
	public static int insert(BoardVO bvo) {	
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("br.insert", bvo);
		ss.close();
		return result;
	}
	
	// 메인페이지 글 목록 보여주기
	public static List<BoardVO> getList(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("br.list", idx);
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
	
	// 글 수정
	public static int update(BoardVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("br.update", bvo);
		ss.close();
		
		return result;
	}
	
	// 조회수 증가
	public static int updateViewCnt(int tp_boardid) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("br.viewcnt", tp_boardid);
		ss.close();
		
		return result;
	}

	public static int delete(int tp_boardid) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("br.delete", tp_boardid);
		ss.close();
		
		return result;
	} 
	
	
}
