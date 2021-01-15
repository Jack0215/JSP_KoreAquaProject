package com.controller.travel;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.TravelPage;
import com.dto.TravelDTO;
import com.service.TravelService;

@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String curPage = request.getParameter("curPage"); 
		if (curPage == null) { 
			curPage = "1";  
		}    
		String course = request.getParameter("course"); 
		String word = request.getParameter("word"); 
		
		TravelService service = new TravelService();
		TravelPage pDTO = service.course(Integer.parseInt(curPage), course);
		//System.out.println(pDTO);
		//System.out.println(curPage);
		request.setAttribute("course", pDTO);
		request.setAttribute("word",word);
		RequestDispatcher dis = request.getRequestDispatcher("Course.jsp"); 
		dis.forward(request, response);
 
	}  

		  protected void doPost(HttpServletRequest request, HttpServletResponse
		  response) throws ServletException, IOException { 
		  doGet(request, response); }

}
