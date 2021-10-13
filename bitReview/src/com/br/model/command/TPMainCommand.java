package com.br.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.BoardVO;

public class TPMainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("메인커맨드~~");
		//1. 디비연결하고 데이터 가져오기 
		List<BoardVO> list = BoardDAO.getList();
		System.out.println("메인커맨드~~11");		
		//2. 응답페이지(TPview.jsp)에 데이터 전달
		request.setAttribute("list", list);
		System.out.println("메인커맨드~~33");	
		System.out.println(list);
		//3. 응답페이지(TPview.jsp)로 화면 이동(전환)
		return "tvProgram/TPmain.jsp";
	}

}
