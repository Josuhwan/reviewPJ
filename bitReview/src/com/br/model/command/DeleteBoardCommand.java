package com.br.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.BoardVO;

public class DeleteBoardCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));
		
		System.out.println(tp_boardid);
		
		BoardDAO.delete(tp_boardid);
		
		String idx = request.getParameter("idx");
		System.out.println(idx + " 값");
		
		if (idx == null) {
			idx = "0";
		}
		System.out.println(idx + " 값좀주세요");
		//1. 디비연결하고 데이터 가져오기 
		List<BoardVO> list = BoardDAO.getList(idx);
		System.out.println("list" + list);
		//2. 응답페이지(TPview.jsp)에 데이터 전달
		request.setAttribute("list", list);
		return "tvProgram/TPmain.jsp";
	}

}
