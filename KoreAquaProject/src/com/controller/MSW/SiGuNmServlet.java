package com.controller.MSW;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.JusoService;
import com.service.MSWInfoService;

/**
 * Servlet implementation class SiGuNmServlet
 */
@WebServlet("/SiGuNmServlet")
public class SiGuNmServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		MSWInfoService service = new MSWInfoService();
		HttpSession session = request.getSession();
		
		String doNm = request.getParameter("doNm");
		System.out.println("검색할 시도 이름==: " + doNm);
		
			List<String> sigunList = service.setSigu(doNm);
			System.out.println("도 이름 넣어서 나온 시군구");
			System.out.println(sigunList.toString());
			PrintWriter out = response.getWriter();
			out.print(sigunList);
			System.out.println(sigunList);
			
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
