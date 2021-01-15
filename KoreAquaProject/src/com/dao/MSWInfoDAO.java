package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class MSWInfoDAO {
	public List<String> setSigun(SqlSession session, String doNm) {
		List<String> siguList = session.selectList("MSWMapper.setSigu", doNm);
		return siguList;
	}
	
	public List<String> setMnrlspNm(SqlSession session, String siGuNm) {
		List<String> mnrlspNmList = session.selectList("MSWMapper.setMnrlspNm", siGuNm);
		return mnrlspNmList;
	}
}
