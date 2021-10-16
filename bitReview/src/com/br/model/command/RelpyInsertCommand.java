package com.br.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;

import com.br.model.vo.ReplyVO;

public class RelpyInsertCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));
		String r_content = request.getParameter("r_content");
		
		System.out.println(r_content + " ----- " + tp_boardid );
		
		//2. 가져온 값 vo에 저장"
		ReplyVO rvo = new ReplyVO();
		rvo.setTp_boardid(tp_boardid);
		rvo.setR_content(r_content);
		//로그인되어 있는 멤버 rvo.setWriter();
		rvo.setR_writer("뽀로로");
		
		BoardDAO.replyInsert(rvo);
		
		return "tvProgram/TPview.jsp";
	}

}
