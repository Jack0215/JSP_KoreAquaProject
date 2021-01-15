package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.AreaDTO;
import com.dto.AreaPage;
import com.dto.TravelDTO;
import com.dto.TravelPage;

public class TravelDAO { 
	
	public int totalCount(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("TravelMapper.totalCount_course", map);
	}
	
	public TravelPage main(SqlSession session, int curPage, HashMap<String, String> map) {
		TravelPage pDTO = new TravelPage();
		int perPage = pDTO.getPerPage(); 
		int offset = (curPage-1)*perPage;
		List<TravelDTO> list = session.selectList("TravelMapper.main", map ,new RowBounds(offset, perPage));
		pDTO.setCurPage(curPage);   
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount(session, map));
		return pDTO; 
	}
	
	public TravelPage course(SqlSession session, int curPage, HashMap<String, String> map ) {
		TravelPage pDTO = new TravelPage();
		int perPage = pDTO.getPerPage(); 
		int offset = (curPage-1)*perPage; 
		List<TravelDTO> list = session.selectList("TravelMapper.course", map ,new RowBounds(offset, perPage));
		//System.out.println("TravelDAO 35 line list :" +list); 
		pDTO.setCurPage(curPage);   
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount(session, map));
		return pDTO; 
	}
	
	
}
