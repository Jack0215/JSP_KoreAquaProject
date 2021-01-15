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
 * Servlet implementation class dictionSearchServlet
 */
@WebServlet("/DInitialServlet")
public class DInitialServlet extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hnm = request.getParameter("searchValue"); 
		String curPage = request.getParameter("curPage");
		if(curPage == null) curPage = "1"; 
		DictionService service = new DictionService();
		PageDTO pDTO  = (PageDTO) service.search(hnm,Integer.parseInt(curPage));
		request.setAttribute("SearchList", pDTO); 
		request.setAttribute("hnm", hnm);
		RequestDispatcher dis = request.getRequestDispatcher("Initial.jsp");
		dis.forward(request, response);
		System.out.println(hnm); 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
