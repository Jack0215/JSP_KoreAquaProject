package com.dto;

public class TravelDTO {

	
	private String resultcode;
	private String resultmsg;
	private String course;
	private String intro;
	private String region;
	private String regionCd;
	private String searchType;
	private String searchTypeCd;
	private String title;
	private String numofrows;
	private String pageno;
	private String totalcount;
	private String rImage;
	
	public TravelDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TravelDTO(String resultcode, String resultmsg, String course, String intro, String region, String regionCd,
			String searchType, String searchTypeCd, String title, String numofrows, String pageno, String totalcount,
			String rImage) {
		super();
		this.resultcode = resultcode;
		this.resultmsg = resultmsg;
		this.course = course;
		this.intro = intro;
		this.region = region;
		this.regionCd = regionCd;
		this.searchType = searchType;
		this.searchTypeCd = searchTypeCd;
		this.title = title;
		this.numofrows = numofrows;
		this.pageno = pageno;
		this.totalcount = totalcount;
		this.rImage = rImage;
	}

	public String getResultcode() {
		return resultcode;
	}

	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}

	public String getResultmsg() {
		return resultmsg;
	}

	public void setResultmsg(String resultmsg) {
		this.resultmsg = resultmsg;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getRegionCd() {
		return regionCd;
	}

	public void setRegionCd(String regionCd) {
		this.regionCd = regionCd;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchTypeCd() {
		return searchTypeCd;
	}

	public void setSearchTypeCd(String searchTypeCd) {
		this.searchTypeCd = searchTypeCd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNumofrows() {
		return numofrows;
	}

	public void setNumofrows(String numofrows) {
		this.numofrows = numofrows;
	}

	public String getPageno() {
		return pageno;
	}

	public void setPageno(String pageno) {
		this.pageno = pageno;
	}

	public String getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
	}

	public String getrImage() {
		return rImage;
	}

	public void setrImage(String rImage) {
		this.rImage = rImage;
	}

	@Override
	public String toString() { 
		return " searchTypeCd=" + searchTypeCd + "\r";
	}

	
	
	
	
}
