package com.br.model.command;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;

public class ModifyOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));

		// 1. 파라미터 값 가져오기

		ServletContext context = request.getSession().getServletContext();
		String f_path = context.getRealPath("/resources/upload");

		MultipartRequest mr = new MultipartRequest(request, f_path, 10 * 1024 * 1024, "UTF-8");

		String f_name = mr.getOriginalFileName("tpfile");
		String writer = mr.getParameter("writer");
		String title = mr.getParameter("title");
		String b_content = mr.getParameter("b_content");

		// 2. 가져온 값 vo에 저장"
		
		BoardVO bvo = new BoardVO();
		bvo.setTp_boardid(tp_boardid);
		bvo.setTitle(title);
		bvo.setB_content(b_content);
		bvo.setWriter(writer);
//				bvo.setTp_id(2);
		bvo.setF_name(f_name);
		bvo.setF_path(f_path);

		BoardDAO.update(bvo);
		BoardVO one = BoardDAO.selectOne(tp_boardid);
		request.setAttribute("one", one);
		
		return "tvProgram/TPview.jsp";
	}

}
