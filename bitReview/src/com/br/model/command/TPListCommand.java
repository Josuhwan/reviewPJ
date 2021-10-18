package com.br.model.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.br.model.dao.TvProgramDAO;

import com.br.model.vo.TvProgramVO;


public class TPListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 디비연결하고 데이터 가져오기
		List<TvProgramVO> tplist = TvProgramDAO.getList();
		
		// 2. 응답페이지(TPview.jsp)에 데이터 전달
		request.setAttribute("tplist", tplist);
		System.out.println(tplist + "이거인가");
		
		
		// 3. 응답페이지로 화면 이동(전환)
		return "tvProgram/TPList.jsp";
	}
	

}
