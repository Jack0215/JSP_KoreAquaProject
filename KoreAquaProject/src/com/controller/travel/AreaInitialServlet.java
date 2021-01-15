package com.controller.travel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.AreaPage;
import com.service.AreaService; 


@WebServlet("/AreaInitialServlet")
public class AreaInitialServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String REGIONCD = request.getParameter("AInit");
		System.out.println(REGIONCD); 
		String TITLE = request.getParameter("searchValue");
		if(TITLE == null) TITLE = "";   
		
		 
		String curPage = request.getParameter("curPage"); //처음엔 null값이 들어감
		if(curPage == null) curPage = "1";
		AreaService service = new AreaService();  
		AreaPage aDTO = service.AInitial(TITLE,Integer.parseInt(curPage),REGIONCD);
		request.setAttribute("pdto", aDTO);  
		request.setAttribute("TITLE", TITLE);  
		request.setAttribute("REGIONCD", REGIONCD);
		RequestDispatcher dis = request.getRequestDispatcher("AInit.jsp");
		dis.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
