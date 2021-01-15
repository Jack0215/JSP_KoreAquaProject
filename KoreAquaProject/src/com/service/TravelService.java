package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.TravelDAO;
import com.dto.AreaPage;
import com.dto.TravelPage;

public class TravelService {

	 public TravelPage main (int curPage, String regioncd){
			HashMap<String, String> map = new HashMap<>();
			map.put("regioncd", regioncd);
			SqlSession session = MySqlSessionFactory.getSession();
			TravelPage pDTO = null;
			TravelDAO dao = new TravelDAO();
			try {
				pDTO = dao.main(session,curPage, map);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();  
			}
			return pDTO; 
		}//end main
	 
	 
	 public TravelPage course (int curPage, String course){
		 HashMap<String, String> map = new HashMap<>(); 
			map.put("course", course);
			//System.out.println(course);
			//System.out.println("map:"+map+"curPage:"+curPage);
			
			SqlSession session = MySqlSessionFactory.getSession();
			TravelPage pDTO = null;
			try {
				TravelDAO dao = new TravelDAO();
				pDTO = dao.course(session, curPage, map);
			}catch(Exception e) { 
				e.printStackTrace();
			}finally {
				session.close();
			}
			return pDTO;
		}//end course
	 	
	
}// end class
