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
		List<TvProgramVO> list = TvProgramDAO.getList();
		String result = makeJson(list);
		System.out.println("응답 JSON 문자열: " + result);
		
		// 2. 응답페이지(TPview.jsp)에 데이터 전달
		request.setAttribute("list", list);
		System.out.println(list);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
		// 3. 응답페이지로 화면 이동(전환)
		return "tvProgram/TPList.jsp";
	}
	
	private String makeJson(List<TvProgramVO> list) {
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");	
		
		for (TvProgramVO vo : list) {
			result.append("{");
			result.append("\"idx\" : " + vo.getTp_name() + ",");
			result.append("\"name\" : \"" + vo.getTp_country() + "\",");
			result.append("\"age\" : " + vo.getTp_country() + ",");
			result.append("\"addr\" : \"" + vo.getTp_brdcs() + "\",");
			result.append("\"regdate\" : \"" + vo.getTp_member() + "\"");
			result.append("},");
		}
		result.delete(result.length() - 1, result.length());
		result.append("]}");
		
		return result.toString();
	}

}
