package com.br.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.ReplyDAO;
import com.br.model.vo.ReplyVO;

public class ListRelpyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));
		
		System.out.println(tp_boardid + "sh222222222");

		//1. 디비연결하고 데이터 가져오기
		List<ReplyVO> rlist = ReplyDAO.replyList(tp_boardid);
		
		request.setAttribute("rlist", rlist);
		
		//3. 응답페이지(TPview.jsp)로 화면 이동(전환)
		return "tvProgram/TPview.jsp";
	}	
}
