package com.br.model.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.ReplyDAO;
import com.br.model.vo.ReplyVO;


@WebServlet("/modifyreply")
public class ModifyRCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;      
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html:charset=UTP-8");
		response.setCharacterEncoding("UTF-8");
		
		
		int tp_replyid = Integer.parseInt(request.getParameter("tp_replyid"));
		
		
		System.out.println(tp_replyid + "ddddd");
		ReplyVO rvo = ReplyDAO.oneReply(tp_replyid);
		
		System.out.println("수정완료??");
		
		
		String result = makeJson(rvo);
		System.out.println("응답 JSON 문자열: " + rvo);
		
		//JOSN 문자열 출력
		PrintWriter out = response.getWriter();
		out.print(result);	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private String makeJson(ReplyVO rvo) {
		
		//JSON 형태 문자열로 바꾸기
		StringBuilder result = new StringBuilder();
		
		result.append("{");
		result.append("\"tp_boardid\" : " + rvo.getTp_boardid() + ",");
		result.append("\"tp_replyid\" : " + rvo.getTp_replyid() + ",");
		result.append("\"r_writer\" : \"" + rvo.getR_writer() + "\",");
		result.append("\"r_content\" : \"" + rvo.getR_content() + "\"");			
		result.append("}");
		
		return result.toString();
	}
}	
