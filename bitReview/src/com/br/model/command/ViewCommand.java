package com.br.model.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.BoardVO;
import com.br.model.vo.ReplyVO;


public class ViewCommand implements Command {


	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));
		
		//1. 디비연결하고 데이터 가져오기 (글제목, 글내용, 티비프로, 작성자, 조회수, 추천수 ,이미지?
		BoardVO one = BoardDAO.selectOne(tp_boardid);
		List<ReplyVO> rlist = BoardDAO.replyList(tp_boardid);
		
		request.setAttribute("one", one);
		request.setAttribute("rlist", rlist);
		
		System.out.println(rlist);
	
		
		//3. 응답페이지(TPview.jsp)로 화면 이동(전환)
		return "tvProgram/TPview.jsp";
	}
	
	

}
