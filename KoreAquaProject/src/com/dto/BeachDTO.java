package com.dto;

public class BeachDTO {

   private String sidoNm; //시도명
   private String gugunNm; //구군명
   private String staNm; //정점명
   private String resNum; //조사차수
   private String resLoc; //조사지점
   private String res1; //대장균
   private String res2; //장구균
   private String resYn; //적합여부
   private String resYear; // 검사년도
   private String resDate; //검사일자
   private String resKnd;//검사종류
   private String resLocDetail; //조사지점 설명
   private String lat; //위도
   private String lon; //경도
   public BeachDTO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public BeachDTO(String sidoNm, String gugunNm, String staNm, String resNum, String resLoc, String res1, String res2,
         String resYn, String resYear, String resDate, String resKnd, String resLocDetail, String lat, String lon) {
      super();
      this.sidoNm = sidoNm;
      this.gugunNm = gugunNm;
      this.staNm = staNm;
      this.resNum = resNum;
      this.resLoc = resLoc;
      this.res1 = res1;
      this.res2 = res2;
      this.resYn = resYn;
      this.resYear = resYear;
      this.resDate = resDate;
      this.resKnd = resKnd;
      this.resLocDetail = resLocDetail;
      this.lat = lat;
      this.lon = lon;
   }
   public String getSidoNm() {
      return sidoNm;
   }
   public void setSidoNm(String sidoNm) {
      this.sidoNm = sidoNm;
   }
   public String getGugunNm() {
      return gugunNm;
   }
   public void setGugunNm(String gugunNm) {
      this.gugunNm = gugunNm;
   }
   public String getStaNm() {
      return staNm;
   }
   public void setStaNm(String staNm) {
      this.staNm = staNm;
   }
   public String getResNum() {
      return resNum;
   }
   public void setResNum(String resNum) {
      this.resNum = resNum;
   }
   public String getResLoc() {
      return resLoc;
   }
   public void setResLoc(String resLoc) {
      this.resLoc = resLoc;
   }
   public String getRes1() {
      return res1;
   }
   public void setRes1(String res1) {
      this.res1 = res1;
   }
   public String getRes2() {
      return res2;
   }
   public void setRes2(String res2) {
      this.res2 = res2;
   }
   public String getResYn() {
      return resYn;
   }
   public void setResYn(String resYn) {
      this.resYn = resYn;
   }
   public String getResYear() {
      return resYear;
   }
   public void setResYear(String resYear) {
      this.resYear = resYear;
   }
   public String getResDate() {
      return resDate;
   }
   public void setResDate(String resDate) {
      this.resDate = resDate;
   }
   public String getResKnd() {
      return resKnd;
   }
   public void setResKnd(String resKnd) {
      this.resKnd = resKnd;
   }
   public String getResLocDetail() {
      return resLocDetail;
   }
   public void setResLocDetail(String resLocDetail) {
      this.resLocDetail = resLocDetail;
   }
   public String getLat() {
      return lat;
   }
   public void setLat(String lat) {
      this.lat = lat;
   }
   public String getLon() {
      return lon;
   }
   public void setLon(String lon) {
      this.lon = lon;
   }
   @Override
   public String toString() {
      return "BeachDTO [sidoNm=" + sidoNm + ", gugunNm=" + gugunNm + ", staNm=" + staNm + ", resNum=" + resNum
            + ", resLoc=" + resLoc + ", res1=" + res1 + ", res2=" + res2 + ", resYn=" + resYn + ", resYear="
            + resYear + ", resDate=" + resDate + ", resKnd=" + resKnd + ", resLocDetail=" + resLocDetail + ", lat="
            + lat + ", lon=" + lon + "]";
   }


}
