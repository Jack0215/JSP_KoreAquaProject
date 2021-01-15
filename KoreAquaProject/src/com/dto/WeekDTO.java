package com.dto;

public class WeekDTO {

	private String cltdt;
	private String bacteria;
	private String totalColi;
	private String coli;
	private String ammonia;
	private String nnitrogen;//Nitrate nitrogen
	private String evaresi;//Evaporation residue
	public String getCltdt() {
		return cltdt;
	}
	public void setCltdt(String cltdt) {
		this.cltdt = cltdt;
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
	@Override
	public String toString() {
		return "WeekDTO [cltdt=" + cltdt + ", bacteria=" + bacteria + ", totalColi=" + totalColi + ", coli=" + coli
				+ ", ammonia=" + ammonia + ", nnitrogen=" + nnitrogen + ", evaresi=" + evaresi + "]";
	}
	public WeekDTO(String cltdt, String bacteria, String totalColi, String coli, String ammonia, String nnitrogen,
			String evaresi) {
		super();
		this.cltdt = cltdt;
		this.bacteria = bacteria;
		this.totalColi = totalColi;
		this.coli = coli;
		this.ammonia = ammonia;
		this.nnitrogen = nnitrogen;
		this.evaresi = evaresi;
	}
	public WeekDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}