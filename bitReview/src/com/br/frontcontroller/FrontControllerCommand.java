package com.br.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.command.Command;
import com.br.model.command.TPMainCommand;
import com.br.model.command.ViewCommand;
import com.br.model.command.WriterCommand;



@WebServlet("/tpcontroller")
public class FrontControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행~~");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		Command command = null;
		if ("writer".equals(type)) {
			command = new WriterCommand();
		} else if ("view".equals(type)) {
			command = new ViewCommand();
		} else if ("main".equals(type)) {
			command = new TPMainCommand();
		}
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doPost() 실행-----------------");
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
	
}
