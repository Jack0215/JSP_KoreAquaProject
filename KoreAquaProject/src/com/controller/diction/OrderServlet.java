
  package com.controller.diction;
  
  import java.io.IOException; import java.util.List;
  
  import javax.servlet.RequestDispatcher; import
  javax.servlet.ServletException; import javax.servlet.annotation.WebServlet;
  import javax.servlet.http.HttpServlet; import
  javax.servlet.http.HttpServletRequest; import
  javax.servlet.http.HttpServletResponse;
  
  import com.dto.DictionDTO; import com.dto.PageDTO; import
  com.service.DictionService;
  
 /**
	 * Servlet implementation class dictionSearchServlet
	 */
		  @WebServlet("/OrderServlet") public class OrderServlet extends
		  HttpServlet {
		  
		  
		  protected void doGet(HttpServletRequest request, HttpServletResponse
		  response) throws ServletException, IOException {
		  
		  String initial = request.getParameter("initial");
		  String curPage = request.getParameter("curPage"); 
		  if(curPage == null) curPage = "1";
		  DictionService service = new DictionService(); 
		  PageDTO pDTO = (PageDTO)  service.initial(initial,Integer.parseInt(curPage));
		  request.setAttribute("SearchList", pDTO); 
		  request.setAttribute("initial", initial);
		  RequestDispatcher dis = request.getRequestDispatcher("Order.jsp");
		  dis.forward(request, response);
		  
		  }
		  
		  protected void doPost(HttpServletRequest request, HttpServletResponse
		  response) throws ServletException, IOException {
		  
		  } }
		 