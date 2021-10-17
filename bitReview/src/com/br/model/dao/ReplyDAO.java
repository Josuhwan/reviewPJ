package com.br.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.br.model.vo.ReplyVO;
import com.br.mybatis.DBService;

public class ReplyDAO {
	
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
