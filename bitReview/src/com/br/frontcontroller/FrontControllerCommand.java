package com.br.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.command.Command;
import com.br.model.command.DeleteBoardCommand;
import com.br.model.command.ListRelpyCommand;
import com.br.model.command.ModifyCommand;
import com.br.model.command.ModifyOkCommand;
import com.br.model.command.RelpyInsertCommand;
import com.br.model.command.TPListCommand;
import com.br.model.command.TPMainCommand;
import com.br.model.command.ViewCommand;
import com.br.model.command.WriteCommand;



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
		if ("write".equals(type)) {
			command = new WriteCommand();
		} else if ("view".equals(type)) {
			command = new ViewCommand();
		} else if ("main".equals(type)) {
			command = new TPMainCommand();
		} else if ("reply".equals(type)) {
			command = new RelpyInsertCommand();
		} else if ("modify".equals(type)) {
			command = new ModifyCommand();
		} else if ("modifyok".equals(type)) {
			command = new ModifyOkCommand();
		}  else if ("tplist".equals(type)) {
			command = new TPListCommand();
		} else if ("delete".equals(type)) {
			command = new DeleteBoardCommand();
		}
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doPost() 실행-----------------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
