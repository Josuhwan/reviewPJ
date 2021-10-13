package com.br.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.br.model.vo.BoardVO;
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

	public static List<BoardVO> getView() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> view = ss.selectList("br.view");
		ss.close();
		
		return view;
	}
}
