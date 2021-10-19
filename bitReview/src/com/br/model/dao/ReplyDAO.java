package com.br.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


import com.br.model.vo.ReplyVO;
import com.br.mybatis.DBService;

public class ReplyDAO {
	
		// 댓글 쓰기
		public static int replyInsert(ReplyVO rvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("br.replyInsert", rvo);
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
		
		// 댓글 삭제하기
		public static int delete(int tp_replyid) {
			SqlSession ss = DBService.getFactory().openSession();
			int result = ss.delete("br.deleteReply", tp_replyid);
			ss.commit();
			ss.close();
			
			return result;
		}
		
		// 기존 댓글정보 가져오기 (수정시)
		public static ReplyVO oneReply(int tp_replyid) {
			SqlSession ss = DBService.getFactory().openSession();
			ReplyVO oneR = ss.selectOne("br.oneReply", tp_replyid);
			ss.close();
			
			return oneR;
			
			
		}
		// 댓글 수정하기
		public static int replyUpdate(ReplyVO rvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("br.rupdate", rvo);
			ss.close();
			
			return result;
		}
}
