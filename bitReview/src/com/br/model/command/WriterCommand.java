package com.br.model.command;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriterCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 파라미터 값 가져오기
		
		ServletContext context= request.getSession().getServletContext();
		String f_path = context.getRealPath("/resources/upload");
		System.out.println(f_path +"경로값");
		
		MultipartRequest mr = new MultipartRequest(request, f_path, 10 * 1024 * 1024, "UTF-8");
		
		String f_name = mr.getOriginalFileName("tpfile");
		System.out.println(f_name +"파일네임");
		String writer = mr.getParameter("writer");
		String title = mr.getParameter("title");
		String b_content = mr.getParameter("b_content");
	
		
		//2. 가져온 값 vo에 저장"
		BoardVO bvo = new BoardVO();
		bvo.setTitle(title);
		bvo.setB_content(b_content);
		bvo.setWriter(writer);
//		bvo.setTp_id(2);
		bvo.setF_name(f_name);
		bvo.setF_path(f_path);
		
		BoardDAO.insert(bvo);
		
		System.out.println(bvo);
		
		
		//3. DB연결하고 데이터 가져오기
		List<BoardVO> list = BoardDAO.getList();
		
		//4. 응답페이지(TPmain.jsp)로 데이터 전달
		request.setAttribute("list", list);
		
		//5. 응답페이지(TPmain.jsp)로 화면 이동(전환)
		return "tvProgram/TPmain.jsp";
	}

}
