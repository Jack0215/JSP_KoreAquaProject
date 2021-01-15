package com.service;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.DictionDAO;
import com.dto.PageDTO;

public class DictionService {
	
	public PageDTO searchAll(int curPage, String hnm) {
		HashMap<String, String> map = new HashMap<>();
		map.put("hnm", hnm);
		DictionDAO dao = new DictionDAO();
		SqlSession session = MySqlSessionFactory.getSession();
		PageDTO pDTO  = null;
		try {
			pDTO = dao.searchAll(session, curPage, map);   
		}finally { 
			session.close();
		}  
		return pDTO;
	}  
	
	public PageDTO search(String hnm, int curPage) {
		HashMap<String, String> map = new HashMap<>();
		map.put("check", "check");
		map.put("hnm", hnm);
		SqlSession session = MySqlSessionFactory.getSession();
		PageDTO list = null;
		try {
			DictionDAO dao = new DictionDAO();
			list = dao.search(session, map, curPage);
		}finally { 
			session.close();
		}  
		return list;
	} 
	
	public PageDTO initial(String initial, int curPage) {
		HashMap<String, String> map = new HashMap<>();
		map.put("initial", initial);
		DictionDAO dao = new DictionDAO();
		SqlSession session = MySqlSessionFactory.getSession();
		PageDTO pDTO = null;
		try {
			pDTO = dao.initial(session, map, curPage);
		}finally {
			session.close();
		}
		return pDTO;
	}
}
