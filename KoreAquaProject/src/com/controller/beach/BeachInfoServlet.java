package com.controller.beach;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BeachInfoServlet
 */
@WebServlet("/BeachInfoServlet")
public class BeachInfoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String staNm=(String)request.getParameter("staNm");
		System.out.println("받아온 해수욕장 이름:"+staNm);
		
		request.setAttribute("staNm", staNm);
		RequestDispatcher dis=request.getRequestDispatcher("beachMapPresent.jsp");
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
