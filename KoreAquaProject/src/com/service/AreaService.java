package com.service;

import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.AreaDAO;
import com.dto.AreaDTO;
import com.dto.AreaPage;

public class AreaService {

	/*
	 * public List<AreaDTO> AreaMain() { SqlSession session =
	 * MySqlSessionFactory.getSession(); List<AreaDTO> aDTO = null; try { AreaDAO
	 * aDAO = new AreaDAO(); aDTO = aDAO.AreaMain(session); }catch(Exception e) {
	 * e.printStackTrace(); }finally { session.close(); } return aDTO; }
	 */
	
	 public AreaPage area_main(int curPage, String area) {
		 HashMap<String, String> map = new HashMap<String, String>();
		 map.put("area", area);
		 SqlSession session = MySqlSessionFactory.getSession();
		 AreaPage pDTO = null;
		 try { 
			 AreaDAO dao = new AreaDAO();
				pDTO = dao.AreaMain(session, curPage, map);
		 } catch(Exception e) {
			 e.printStackTrace(); 
		 }finally {
			 session.close();
		 }
		 //System.out.println("AreaService 37 line pDTO:"+pDTO);  
		return pDTO;
	 }
		
	public AreaPage AInitial (String TITLE, int curPage, String REGIONCD) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("check", "check");
		//if else문으로 title, regioncd가 있는 경우 dao에 두가지 정보를 가지고 select
		//title만 있는경우 , dao에서 title로 select하는 mapper
		//sql문 2개 사용
		map.put("TITLE", TITLE ); 
		map.put("REGIONCD", REGIONCD);
		//System.out.println(TITLE); 
		//System.out.println(REGIONCD);
		if(TITLE== "") { 
			SqlSession session = MySqlSessionFactory.getSession();
			AreaPage list = null;
			try {
				AreaDAO dao = new AreaDAO();
				list = dao.ARegion(session,map,curPage,REGIONCD);
			}finally {
				session.close();
			} 
			return list;   
		}else {
			SqlSession session = MySqlSessionFactory.getSession();
			AreaPage list = null;
			try {
				AreaDAO dao = new AreaDAO();
				list = dao.ATitle(session, map, curPage, REGIONCD);
			}finally { 
				session.close();
			} 
			return list;   
		}
		
	 }  
	 
	 
}// end class
