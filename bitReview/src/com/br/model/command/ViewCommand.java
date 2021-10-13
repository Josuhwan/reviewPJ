package com.br.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.BoardVO;

public class ViewCommand implements Command {


	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 디비연결하고 데이터 가져오기 (글제목, 글내용, 티비프로, 작성자, 조회수, 추천수 ,이미지?
		List<BoardVO> view = BoardDAO.getView();
		
		//2. 응답페이지(TPview.jsp)에 데이터 전달
		request.setAttribute("view", view);
		
		System.out.println(view+ "ddd");
		//3. 응답페이지(TPview.jsp)로 화면 이동(전환)
		return "tvProgram/TPview.jsp";
	}
	
	

}
