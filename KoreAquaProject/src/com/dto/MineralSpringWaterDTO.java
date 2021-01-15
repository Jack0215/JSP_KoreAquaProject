package com.dto;

public class MineralSpringWaterDTO {
	//약수터명
	private String mnrlspNm;
	//도로명 주소
	private String rdnmadr;
	//지명 주소
	private String lnmadr;
	//위도
	private String latitude;
	//경도
	private String longitude;
	//지정일자
	private String appnDate;
	//일평균이용인구수
	private String dayUseCn;
	//수질검사일자
	private String qltwtrInspctDate;
	//수질검사결과구분
	private String qltwtrInspctResultType;
	//부적합항목
	private String improptIem;
	//관리기관전화번호
	private String phoneNumber;
	//관리기관명
	private String institutionNm;
	//데이터기준일자
	private String referenceDate;
	//제공기관코드
	private String insttCode;
	public MineralSpringWaterDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MineralSpringWaterDTO(String mnrlspNm, String rdnmadr, String lnmadr, String latitude, String longitude,
			String appnDate, String dayUseCn, String qltwtrInspctDate, String qltwtrInspctResultType, String improptIem,
			String phoneNumber, String institutionNm, String referenceDate, String insttCode) {
		super();
		this.mnrlspNm = mnrlspNm;
		this.rdnmadr = rdnmadr;
		this.lnmadr = lnmadr;
		this.latitude = latitude;
		this.longitude = longitude;
		this.appnDate = appnDate;
		this.dayUseCn = dayUseCn;
		this.qltwtrInspctDate = qltwtrInspctDate;
		this.qltwtrInspctResultType = qltwtrInspctResultType;
		this.improptIem = improptIem;
		this.phoneNumber = phoneNumber;
		this.institutionNm = institutionNm;
		this.referenceDate = referenceDate;
		this.insttCode = insttCode;
	}
	public String getMnrlspNm() {
		return mnrlspNm;
	}
	public void setMnrlspNm(String mnrlspNm) {
		this.mnrlspNm = mnrlspNm;
	}
	public String getRdnmadr() {
		return rdnmadr;
	}
	public void setRdnmadr(String rdnmadr) {
		this.rdnmadr = rdnmadr;
	}
	public String getLnmadr() {
		return lnmadr;
	}
	public void setLnmadr(String lnmadr) {
		this.lnmadr = lnmadr;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getAppnDate() {
		return appnDate;
	}
	public void setAppnDate(String appnDate) {
		this.appnDate = appnDate;
	}
	public String getDayUseCn() {
		return dayUseCn;
	}
	public void setDayUseCn(String dayUseCn) {
		this.dayUseCn = dayUseCn;
	}
	public String getQltwtrInspctDate() {
		return qltwtrInspctDate;
	}
	public void setQltwtrInspctDate(String qltwtrInspctDate) {
		this.qltwtrInspctDate = qltwtrInspctDate;
	}
	public String getQltwtrInspctResultType() {
		return qltwtrInspctResultType;
	}
	public void setQltwtrInspctResultType(String qltwtrInspctResultType) {
		this.qltwtrInspctResultType = qltwtrInspctResultType;
	}
	public String getImproptIem() {
		return improptIem;
	}
	public void setImproptIem(String improptIem) {
		this.improptIem = improptIem;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getInstitutionNm() {
		return institutionNm;
	}
	public void setInstitutionNm(String institutionNm) {
		this.institutionNm = institutionNm;
	}
	public String getReferenceDate() {
		return referenceDate;
	}
	public void setReferenceDate(String referenceDate) {
		this.referenceDate = referenceDate;
	}
	public String getInsttCode() {
		return insttCode;
	}
	public void setInsttCode(String insttCode) {
		this.insttCode = insttCode;
	}
	@Override
	public String toString() {
		return "MineralSpringWaterDTO [mnrlspNm=" + mnrlspNm + ", rdnmadr=" + rdnmadr + ", lnmadr=" + lnmadr
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", appnDate=" + appnDate + ", dayUseCn="
				+ dayUseCn + ", qltwtrInspctDate=" + qltwtrInspctDate + ", qltwtrInspctResultType="
				+ qltwtrInspctResultType + ", improptIem=" + improptIem + ", phoneNumber=" + phoneNumber
				+ ", institutionNm=" + institutionNm + ", referenceDate=" + referenceDate + ", insttCode=" + insttCode
				+ "]";
	}
	
}
