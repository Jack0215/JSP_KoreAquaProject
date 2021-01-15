package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.DictionDTO;
import com.dto.PageDTO;

public class DictionDAO {
	
	public int totalCount(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("DictionMapper.totalCount", map);
	}
	
	public PageDTO searchAll (SqlSession session, int curPage, HashMap<String, String> map){
		PageDTO pDTO = new PageDTO();
		int perPage = pDTO.getPerPage(); 
		int offset = (curPage-1)*perPage;
		List<DictionDTO> list = session.selectList("DictionMapper.searchAll", map ,new RowBounds(offset, perPage));
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount(session, map));
		return pDTO;
		
	}

	public PageDTO search (SqlSession session, HashMap<String, String> map, int curPage){
		PageDTO pDTO = new PageDTO();
		int perPage = pDTO.getPerPage(); 
		int offset = (curPage-1)*perPage;
		List<DictionDTO> list = session.selectList("DictionMapper.search", map ,new RowBounds(offset, perPage));
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount(session, map));
		return pDTO; 
	}
	
	public PageDTO initial (SqlSession session, HashMap<String, String> map, int curPage){
		PageDTO pDTO = new PageDTO();
		int perPage = pDTO.getPerPage(); 
		int offset = (curPage-1)*perPage;
		List<DictionDTO> list = session.selectList("DictionMapper.initial", map ,new RowBounds(offset, perPage));
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount(session, map));
		return pDTO; 
	}
	
	
}
