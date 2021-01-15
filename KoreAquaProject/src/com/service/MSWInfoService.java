package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.JusoDAO;
import com.dao.MSWInfoDAO;

public class MSWInfoService {
MSWInfoDAO dao;
	
	public MSWInfoService() {
		super();
		dao = new MSWInfoDAO();
	}

public List<String> setSigu(String doNm) {
		
		SqlSession session = MySqlSessionFactory.getSession();
		List<String> siguList = null;
		try {
			siguList = dao.setSigun(session, doNm);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return siguList;
	}

	public List<String> setMnrlspNm(String siGuNm) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<String> mnrlspNmList = null;
		try {
			mnrlspNmList = dao.setMnrlspNm(session, siGuNm);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return mnrlspNmList;
	}

}
