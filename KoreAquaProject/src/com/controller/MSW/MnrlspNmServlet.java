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
 * Servlet implementation class MnrlspNmServlet
 */
@WebServlet("/MnrlspNmServlet")
public class MnrlspNmServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String siGuNm = request.getParameter("siGuNm");
		siGuNm = siGuNm.trim();
		
		HttpSession session = request.getSession();
		MSWInfoService service = new MSWInfoService();
		
		System.out.println("검색할 시군구 값==: " + siGuNm);
		
	
			List<String> mnrlspNmList = service.setMnrlspNm(siGuNm);
			System.out.println(mnrlspNmList.toString());
			PrintWriter out = response.getWriter();
			out.print(mnrlspNmList);
			System.out.println(mnrlspNmList);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
