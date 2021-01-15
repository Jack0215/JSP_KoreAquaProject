package com.controller.diction;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.PageDTO;
import com.service.DictionService;

/**
 * Servlet implementation class DictionServlet
 */
@WebServlet("/DictionServlet")
public class DictionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		 
		String hnm = request.getParameter("searchValue");
		String curPage = request.getParameter("curPage"); //처음엔 null값이 들어감
		if(curPage == null) curPage = "1";
		DictionService service = new DictionService(); 
		PageDTO pDTO = service.searchAll(Integer.parseInt(curPage), hnm);
		request.setAttribute("pDTO", pDTO); 		
		RequestDispatcher dis = request.getRequestDispatcher("Diction.jsp");
		dis.forward(request, response);		  	
	}  
////////////////////////////////////실행 서블릿///////////////////////////////////////////
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}
}
