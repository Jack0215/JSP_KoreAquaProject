package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.AreaDTO;
import com.dto.AreaPage;

public class AreaDAO {
	/*
	 * public List<AreaDTO> AreaMain(SqlSession session ) { List<AreaDTO> aDTO =
	 * session.selectList("TravelMapper.area_main"); System.out.println(aDTO);
	 * return aDTO; }
	 */
	
	public int totalCount (SqlSession session, HashMap<String, String> map) {
		return session.selectOne("TravelMapper.totalCount_area",map); 
	}
	
	public int totalCount_REGIONCD (SqlSession session, HashMap<String, String> map) {
		return session.selectOne("TravelMapper.totalCount_REGIONCD",map); 
	}
	
	public int totalCount_TITLE (SqlSession session, HashMap<String, String> map) {
		return session.selectOne("TravelMapper.totalCount_TITLE",map);  
	}  
	
	public AreaPage AreaMain(SqlSession session, int curPage, HashMap<String, String> map) {
		AreaPage dto = new AreaPage();
		int aperPage = dto.getPerPage();
		int offset = (curPage -1)*aperPage;
		List<AreaDTO> list = session.selectList("TravelMapper.area_main", map, new RowBounds(offset, aperPage));
		dto.setCurPage(curPage); 
		dto.setList(list);  
		dto.setTotalCount(totalCount(session,map));
		//System.out.println("AreaDAO 32 lin dto :"+ dto);
		return dto;
	}
	
	
	
	public AreaPage ATitle (SqlSession session, HashMap<String, String> map, int curPage, String REGIONCD){
		AreaPage aPage = new AreaPage();
		AreaDTO aDTO = new AreaDTO();
		int perPage = aPage.getPerPage();  
		int offset = (curPage-1)*perPage; 
		aDTO.setREGIONCD(REGIONCD);
		List<AreaDTO> list = session.selectList("TravelMapper.ATitle", map ,new RowBounds(offset, perPage));
		System.out.println(list); 
		aPage.setCurPage(curPage);
		aPage.setList(list); 
		aPage.setTotalCount(totalCount_TITLE(session, map));  
		System.out.println(totalCount_TITLE(session, map));  
		//System.out.println(map); 
		return aPage;  
	}
	
	public AreaPage ARegion (SqlSession session, HashMap<String, String> map, int curPage, String REGIONCD){
		AreaPage aPage = new AreaPage();
		AreaDTO aDTO = new AreaDTO();
		int perPage = aPage.getPerPage();  
		int offset = (curPage-1)*perPage; 
		aDTO.setREGIONCD(REGIONCD);
		List<AreaDTO> list = session.selectList("TravelMapper.ARegion", map ,new RowBounds(offset, perPage));
		aPage.setCurPage(curPage);
		aPage.setList(list);  
		aPage.setTotalCount(totalCount_REGIONCD(session, map));
		//System.out.println(totalCount_REGIONCD(session, map));
		return aPage;  
	}
}
