package com.controller.travel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.TravelPage;
import com.service.TravelService;
 
@WebServlet("/TravelServlet")  
public class TravelServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curPage = request.getParameter("curPage");
		if (curPage == null) { 
			curPage = "1";   
		}       
		TravelService service = new TravelService();
		TravelPage pDTO = service.main(Integer.parseInt(curPage), "course");
		request.setAttribute("course", pDTO);
		RequestDispatcher dis = request.getRequestDispatcher("Travel.jsp");
		dis.forward(request, response);	
	}

	//////////////////////////////실행 서블릿///////////////////////////////////
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response); 
	}

}
