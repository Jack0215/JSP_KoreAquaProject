package com.dto;

public class MonthDTO {
	private String site;// 정수장명
	private String date;// 채수일자
	private String bacteria;// 일반세균
	private String totalColi;// 총대장균군
	private String coli;// 대장균/분원성대장균군
	private String ammonia;// 암모니아성 질소
	private String nnitrogen;// 질산성질소
	private String evaresi;// 증발잔류물
	private String taste; //맛
	private String smell; //냄새
	private String chromaticity; //색도
	private String pH; //pH
	private String turbidity; //탁도
	private String residualCI; //잔류염소
	public MonthDTO() {
		super();
	}
	public MonthDTO(String site, String date, String bacteria, String totalColi, String coli, String ammonia,
			String nnitrogen, String evaresi, String taste, String smell, String chromaticity, String pH,
			String turbidity, String residualCI) {
		super();
		this.site = site;
		this.date = date;
		this.bacteria = bacteria;
		this.totalColi = totalColi;
		this.coli = coli;
		this.ammonia = ammonia;
		this.nnitrogen = nnitrogen;
		this.evaresi = evaresi;
		this.taste = taste;
		this.smell = smell;
		this.chromaticity = chromaticity;
		this.pH = pH;
		this.turbidity = turbidity;
		this.residualCI = residualCI;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getBacteria() {
		return bacteria;
	}
	public void setBacteria(String bacteria) {
		this.bacteria = bacteria;
	}
	public String getTotalColi() {
		return totalColi;
	}
	public void setTotalColi(String totalColi) {
		this.totalColi = totalColi;
	}
	public String getColi() {
		return coli;
	}
	public void setColi(String coli) {
		this.coli = coli;
	}
	public String getAmmonia() {
		return ammonia;
	}
	public void setAmmonia(String ammonia) {
		this.ammonia = ammonia;
	}
	public String getNnitrogen() {
		return nnitrogen;
	}
	public void setNnitrogen(String nnitrogen) {
		this.nnitrogen = nnitrogen;
	}
	public String getEvaresi() {
		return evaresi;
	}
	public void setEvaresi(String evaresi) {
		this.evaresi = evaresi;
	}
	public String getTaste() {
		return taste;
	}
	public void setTaste(String taste) {
		this.taste = taste;
	}
	public String getSmell() {
		return smell;
	}
	public void setSmell(String smell) {
		this.smell = smell;
	}
	public String getChromaticity() {
		return chromaticity;
	}
	public void setChromaticity(String chromaticity) {
		this.chromaticity = chromaticity;
	}
	public String getpH() {
		return pH;
	}
	public void setpH(String pH) {
		this.pH = pH;
	}
	public String getTurbidity() {
		return turbidity;
	}
	public void setTurbidity(String turbidity) {
		this.turbidity = turbidity;
	}
	public String getResidualCI() {
		return residualCI;
	}
	public void setResidualCI(String residualCI) {
		this.residualCI = residualCI;
	}
	@Override
	public String toString() {
		return "MonthDTO [site=" + site + ", date=" + date + ", bacteria=" + bacteria + ", totalColi=" + totalColi
				+ ", coli=" + coli + ", ammonia=" + ammonia + ", nnitrogen=" + nnitrogen + ", evaresi=" + evaresi
				+ ", taste=" + taste + ", smell=" + smell + ", chromaticity=" + chromaticity + ", pH=" + pH
				+ ", turbidity=" + turbidity + ", residualCI=" + residualCI + "]";
	}
}