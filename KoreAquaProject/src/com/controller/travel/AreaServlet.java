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

/**
 * Servlet implementation class AreaServlet
 */
@WebServlet("/AreaServlet")
public class AreaServlet extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curPage = request.getParameter("curPage");
		if(curPage == null) { 
			curPage = "1";
		}
		//String area = request.getParameter("area"); 
		//System.out.println("AreaServlet:"+area); 
		AreaService service = new AreaService();
		AreaPage pDTO = service.area_main(Integer.parseInt(curPage), "area"); 
		
		request.setAttribute("pdto", pDTO);  
		RequestDispatcher dis = request.getRequestDispatcher("Area.jsp");
		dis.forward(request, response); 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
