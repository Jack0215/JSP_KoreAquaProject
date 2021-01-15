package com.dto;

public class DictionDTO {
private String resultCode;
private String resultMsg;
private String cNm;
private String eNm;
private String explain;
private String hNm;
private String rgsdt;
private String numOfRows;
private String pageNo;
private String totalCount;
public DictionDTO() {
	super();
	// TODO Auto-generated constructor stub
}
public DictionDTO(String resultCode, String resultMsg, String cNm, String eNm, String explain, String hNm, String rgsdt,
		String numOfRows, String pageNo, String totalCount) {
	super();
	this.resultCode = resultCode;
	this.resultMsg = resultMsg;
	this.cNm = cNm;
	this.eNm = eNm;
	this.explain = explain;
	this.hNm = hNm;
	this.rgsdt = rgsdt;
	this.numOfRows = numOfRows;
	this.pageNo = pageNo;
	this.totalCount = totalCount;
}
public String getResultCode() {
	return resultCode;
}
public void setResultCode(String resultCode) {
	this.resultCode = resultCode;
}
public String getResultMsg() {
	return resultMsg;
}
public void setResultMsg(String resultMsg) {
	this.resultMsg = resultMsg;
}
public String getcNm() {
	return cNm;
}
public void setcNm(String cNm) {
	this.cNm = cNm;
}
public String geteNm() {
	return eNm;
}
public void seteNm(String eNm) {
	this.eNm = eNm;
}
public String getExplain() {
	return explain;
}
public void setExplain(String explain) {
	this.explain = explain;
}
public String gethNm() {
	return hNm;
}
public void sethNm(String hNm) {
	this.hNm = hNm;
}
public String getRgsdt() {
	return rgsdt;
}
public void setRgsdt(String rgsdt) {
	this.rgsdt = rgsdt;
}
public String getNumOfRows() {
	return numOfRows;
}
public void setNumOfRows(String numOfRows) {
	this.numOfRows = numOfRows;
}
public String getPageNo() {
	return pageNo;
}
public void setPageNo(String pageNo) {
	this.pageNo = pageNo;
}
public String getTotalCount() {
	return totalCount;
}
public void setTotalCount(String totalCount) {
	this.totalCount = totalCount;
}
@Override
public String toString() {
	return "DictionDTO [resultCode=" + resultCode + ", resultMsg=" + resultMsg + ", cNm=" + cNm + ", eNm=" + eNm
			+ ", explain=" + explain + ", hNm=" + hNm + ", rgsdt=" + rgsdt + ", numOfRows=" + numOfRows + ", pageNo="
			+ pageNo + ", totalCount=" + totalCount + "]";
}



}
