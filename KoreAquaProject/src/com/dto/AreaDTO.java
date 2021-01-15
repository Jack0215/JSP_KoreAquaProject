package com.dto;

public class AreaDTO {
	private String RESULTCODE;
	private String RESULTMSG;
	private String INTRO;
	private String REGION;
	private String REGIONCD;
	private String SEARCHTYPE;
	private String SEARCHTYPECD;
	private String TITLE;
	private String NUMOFROWS;
	private String PAGENO;
	private String TOTALCOUNT;
	private String RIMAGE;
	public AreaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AreaDTO(String rESULTCODE, String rESULTMSG, String iNTRO, String rEGION, String rEGIONCD, String sEARCHTYPE,
			String sEARCHTYPECD, String tITLE, String nUMOFROWS, String pAGENO, String tOTALCOUNT, String rIMAGE) {
		super();
		RESULTCODE = rESULTCODE;
		RESULTMSG = rESULTMSG;
		INTRO = iNTRO;
		REGION = rEGION;
		REGIONCD = rEGIONCD;
		SEARCHTYPE = sEARCHTYPE;
		SEARCHTYPECD = sEARCHTYPECD;
		TITLE = tITLE;
		NUMOFROWS = nUMOFROWS;
		PAGENO = pAGENO;
		TOTALCOUNT = tOTALCOUNT;
		RIMAGE = rIMAGE;
	}
	public String getRESULTCODE() {
		return RESULTCODE;
	}
	public void setRESULTCODE(String rESULTCODE) {
		RESULTCODE = rESULTCODE;
	}
	public String getRESULTMSG() {
		return RESULTMSG;
	}
	public void setRESULTMSG(String rESULTMSG) {
		RESULTMSG = rESULTMSG;
	}
	public String getINTRO() {
		return INTRO;
	}
	public void setINTRO(String iNTRO) {
		INTRO = iNTRO;
	}
	public String getREGION() {
		return REGION;
	}
	public void setREGION(String rEGION) {
		REGION = rEGION;
	}
	public String getREGIONCD() {
		return REGIONCD;
	}
	public void setREGIONCD(String rEGIONCD) {
		REGIONCD = rEGIONCD;
	}
	public String getSEARCHTYPE() {
		return SEARCHTYPE;
	}
	public void setSEARCHTYPE(String sEARCHTYPE) {
		SEARCHTYPE = sEARCHTYPE;
	}
	public String getSEARCHTYPECD() {
		return SEARCHTYPECD;
	}
	public void setSEARCHTYPECD(String sEARCHTYPECD) {
		SEARCHTYPECD = sEARCHTYPECD;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getNUMOFROWS() {
		return NUMOFROWS;
	}
	public void setNUMOFROWS(String nUMOFROWS) {
		NUMOFROWS = nUMOFROWS;
	}
	public String getPAGENO() {
		return PAGENO;
	}
	public void setPAGENO(String pAGENO) {
		PAGENO = pAGENO;
	}
	public String getTOTALCOUNT() {
		return TOTALCOUNT;
	}
	public void setTOTALCOUNT(String tOTALCOUNT) {
		TOTALCOUNT = tOTALCOUNT;
	}
	public String getRIMAGE() {
		return RIMAGE;
	}
	public void setRIMAGE(String rIMAGE) {
		RIMAGE = rIMAGE;
	}
	@Override
	public String toString() {
		return "REGIONCD=" + REGIONCD ;
	}
		 
}
