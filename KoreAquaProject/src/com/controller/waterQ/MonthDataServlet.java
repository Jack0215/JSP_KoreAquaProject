package com.controller.waterQ;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.dto.MonthDTO;
import com.dto.JusoDTO;
import com.dto.MonthDTO;
import com.service.JusoService;

@WebServlet("/MonthDataServlet")
public class MonthDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MonthDataServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("MonthServlet ==========");
		String searchMonth = request.getParameter("searchMonth");
		System.out.println("searchMonth===" + searchMonth);
		String year = searchMonth.substring(0, 4);
		String month = searchMonth.substring(6, 7);
		if(month.length() == 1) {
			month = "0" + month;
		}
		String stdt = year + month;
		String eddt = year + month;
		if(stdt instanceof String) {
			System.out.println("String");
		}else  {
			System.out.println("String 아님");
		}
		System.out.println("stdt === " + stdt + "\t" + "eddt === " + eddt); 
		System.out.println("년도: " + year + " / 월: " + month);
		String sido = request.getParameter("sido");
		String sigun = request.getParameter("sigun");
		String dong = request.getParameter("dong");
		
		String nextPage = null;
		
		//시도, 시군, 동이 모두 입력된 경우(dong != null) 아래 코드를 수행
		if(dong != null) {
			JusoService service = new JusoService();
			//API 호출을 위한 필수 변수값을 설정
			Map<String, String> map = new HashMap<>();
			map.put("sigun", sigun);
			map.put("dong", dong);
			
			List<JusoDTO> codeList = service.searchCode(map);
			
			String sgccd = codeList.get(0).getSgccd();
			String sitecd = codeList.get(0).getSitecd();
			System.out.println("지자체코드==" + sgccd);
			System.out.println("정수장코드==" + sitecd);
			String numOfRows = "100";
			String pageNo = "1";
			
			StringBuilder sb = new StringBuilder();
			List<MonthDTO> mList = new ArrayList<>();
			JSONParser parser = new JSONParser();
			
			if(sgccd == null) { //환경부 API 호출
				if(sido.length() >= 5) sigun = "";
				System.out.println(sido + "\t" + sigun);
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552584/qltWtrSvc/MonPurification"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=xUaCQjbwxEcfxfh7/HktyNRhuSsKDSauOvqlvcPI01iUuOpKUc/O0cvLrIHqa5DCB/1oYsEj1Y6nqvssEstEWg=="); /*Service Key*/
		        //urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("xUaCQjbwxEcfxfh7/HktyNRhuSsKDSauOvqlvcPI01iUuOpKUc/O0cvLrIHqa5DCB/1oYsEj1Y6nqvssEstEWg==", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("viewType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답타입구분(xml or json)*/
		        urlBuilder.append("&" + URLEncoder.encode("year","UTF-8") + "=" + URLEncoder.encode(year, "UTF-8")); /*검사년도 (ex) 2019*/
		        urlBuilder.append("&" + URLEncoder.encode("month","UTF-8") + "=" + URLEncoder.encode(month, "UTF-8")); /*검사월 (ex) 01*/
//		        urlBuilder.append("&" + URLEncoder.encode("BSI","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); /*수도사업자 광역시도 검색어(ex) 서울특별시, 강원도)*/
//		        urlBuilder.append("&" + URLEncoder.encode("SIGUN","UTF-8") + "=" + URLEncoder.encode(sigun, "UTF-8")); /*수도사업자 시군 검색어(ex) 청주시)*/
		        urlBuilder.append("&" + URLEncoder.encode("BSI","UTF-8") + "=" + sido); /*수도사업자 광역시도 검색어(ex) 서울특별시, 강원도)*/
		        urlBuilder.append("&" + URLEncoder.encode("SIGUN","UTF-8") + "=" + sigun); /*수도사업자 시군 검색어(ex) 청주시)*/
		        System.out.println(urlBuilder);
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		        	System.out.println("if =================");
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		            
		        } else {
		        	System.out.println("else ===========");
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		            
		            request.setAttribute("mesg", "공공데이터 호출 오류입니다. 다시 시도해 주세요.");
		            nextPage = "MonthSearch.jsp";
		        }
		        String line;
		        while ((line = rd.readLine()) != null) {
		        	System.out.println("rd.readLine() === " + rd.readLine());
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        System.out.println(sb.toString());
		        System.out.println("환경부 API 호출 ===== ");
		        
		        try {
			        JSONObject obj = (JSONObject) parser.parse(sb.toString());
					JSONObject parseResponse = (JSONObject)obj.get("response");
					JSONObject parseBody = (JSONObject)parseResponse.get("body");
					String totalCount = (String) parseBody.get("totalCount").toString();
					System.out.println("totalCount===="+totalCount);
					JSONObject monthWaterQlt = null;
					
					if(totalCount.equals("0")) {
						request.setAttribute("mesg", "오류로 정보 조회에 실패하였습니다. 다시 조회하세요.");
						nextPage = "MonthSearch.jsp";
					} else {
							JSONArray parseItems = (JSONArray)parseBody.get("items");
							JSONObject item = null;
							for(int i = 0; i < parseItems.size(); i++) {
								item = (JSONObject) parseItems.get(i);
								String fcltName = (String)item.get("FCLT_NAM").toString();
								if(fcltName.equals(sitecd)) break;
							}
							monthWaterQlt = item;
							System.out.println("item === " + item.toJSONString());
							MonthDTO mDTO = new MonthDTO();
							String site = (String)monthWaterQlt.get("FCLT_NAM").toString();
							String date = (String)monthWaterQlt.get("COLL_DAT").toString();
							String taste = (String)monthWaterQlt.get("TW").toString();
							String smell = (String)monthWaterQlt.get("ODOR").toString();
							String chromaticity = (String)monthWaterQlt.get("CW").toString();
							String pH = (String)monthWaterQlt.get("PH").toString();
							String turbidity = (String)monthWaterQlt.get("TU").toString();
							String residualCI = (String)monthWaterQlt.get("RC").toString();
							String bacteria = (String)monthWaterQlt.get("TCC").toString();// 일반세균
							String totalColi = (String)monthWaterQlt.get("TC").toString();// 총대장균군
							String coli = (String)monthWaterQlt.get("EFC").toString();// 대장균/분원성대장균군
							String ammonia = (String)monthWaterQlt.get("NHN").toString();// 암모니아성 질소
							String nnitrogen = (String)monthWaterQlt.get("NON").toString();// 질산성질소
							String evaresi = (String)monthWaterQlt.get("RE").toString();// 증발잔류물
							
							mDTO.setDate(date);
							mDTO.setSite(site);
							mDTO.setTaste(taste);
							mDTO.setSmell(smell);
							mDTO.setChromaticity(chromaticity);
							mDTO.setpH(pH);
							mDTO.setTurbidity(turbidity);
							mDTO.setResidualCI(residualCI);
							mDTO.setBacteria(bacteria);
							mDTO.setTotalColi(totalColi);
							mDTO.setColi(coli);
							mDTO.setAmmonia(ammonia);
							mDTO.setNnitrogen(nnitrogen);
							mDTO.setEvaresi(evaresi);
							
							mList.add(mDTO);
			    		}
				} catch (Exception e) {
					e.printStackTrace();
				}
				nextPage = "Month.jsp";
			} else if(sgccd.equals("1")) { //광역 정수장 API 호출
				StringBuilder urlBuilder = new StringBuilder("http://opendata.kwater.or.kr/openapi-data/service/pubd/waterways/wdr/dmntwater/list"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=xUaCQjbwxEcfxfh7%2FHktyNRhuSsKDSauOvqlvcPI01iUuOpKUc%2FO0cvLrIHqa5DCB%2F1oYsEj1Y6nqvssEstEWg%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("fcode","UTF-8") + "=" + URLEncoder.encode(sitecd, "UTF-8")); /*정수장 코드 조회 서비스 참조*/
		        urlBuilder.append("&" + URLEncoder.encode("stdt","UTF-8") + "=" + URLEncoder.encode(year + "-" + month, "UTF-8")); /*조회시작일*/
		        urlBuilder.append("&" + URLEncoder.encode("eddt","UTF-8") + "=" + URLEncoder.encode(year + "-" + month, "UTF-8")); /*조회종료일*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /*줄수*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&_type=json");
		        System.out.println(urlBuilder);
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		            request.setAttribute("mesg", "공공데이터 호출 오류입니다. 다시 시도해 주세요.");
		            nextPage = "MonthSearch.jsp";
		        }
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        System.out.println(sb.toString());
		        System.out.println("광역정수장 API 호출 ===== ");
		        try {
			        JSONObject obj = (JSONObject) parser.parse(sb.toString());
					JSONObject parseResponse = (JSONObject)obj.get("response");
					JSONObject parseBody = (JSONObject)parseResponse.get("body");
					
					String totalCount = (String) parseBody.get("totalCount").toString();
					System.out.println("totalCount===="+totalCount);
					JSONObject monthWaterQlt = null;
					if(totalCount.equals("0")) {
						request.setAttribute("mesg", "현재 서비스를 제공하고 있지 않습니다.");
						nextPage = "MonthSearch.jsp";
					} else {
		    			JSONObject parseItems = (JSONObject)parseBody.get("items");
		    			monthWaterQlt = (JSONObject) parseItems.get("item");
		    			
						MonthDTO mDTO = new MonthDTO();
						String date = (String)monthWaterQlt.get("mesurede").toString();
						String taste = (String)monthWaterQlt.get("item47").toString();
						String smell = (String)monthWaterQlt.get("item46").toString();
						String chromaticity = (String)monthWaterQlt.get("item49").toString();
						String pH = (String)monthWaterQlt.get("item51").toString();
						String turbidity = (String)monthWaterQlt.get("item57").toString();
						String residualCI = (String)monthWaterQlt.get("item33").toString();
						String bacteria = (String)monthWaterQlt.get("item1").toString();// 일반세균
						String totalColi = (String)monthWaterQlt.get("item2").toString();// 총대장균군
						String coli = (String)monthWaterQlt.get("item3").toString();// 대장균/분원성대장균군
						String ammonia = (String)monthWaterQlt.get("item12").toString();// 암모니아성 질소
						String nnitrogen = (String)monthWaterQlt.get("item13").toString();// 질산성질소
						String evaresi = (String)monthWaterQlt.get("item54").toString();// 증발잔류물
						
						mDTO.setDate(date);
						mDTO.setTaste(taste);
						mDTO.setSmell(smell);
						mDTO.setChromaticity(chromaticity);
						mDTO.setpH(pH);
						mDTO.setTurbidity(turbidity);
						mDTO.setResidualCI(residualCI);
						mDTO.setBacteria(bacteria);
						mDTO.setTotalColi(totalColi);
						mDTO.setColi(coli);
						mDTO.setAmmonia(ammonia);
						mDTO.setNnitrogen(nnitrogen);
						mDTO.setEvaresi(evaresi);
						
						mList.add(mDTO);
						
						nextPage = "MonthSearch.jsp";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else { //지방 정수장 API 호출
				//API url 생성
				StringBuilder urlBuilder = new StringBuilder("http://opendata.kwater.or.kr/openapi-data/service/pubd/waterinfos/waterquality/monthwater/list"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=xUaCQjbwxEcfxfh7%2FHktyNRhuSsKDSauOvqlvcPI01iUuOpKUc%2FO0cvLrIHqa5DCB%2F1oYsEj1Y6nqvssEstEWg%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("sgccd","UTF-8") + "=" + URLEncoder.encode(sgccd, "UTF-8")); /*지자체코드*/
		        urlBuilder.append("&" + URLEncoder.encode("sitecd","UTF-8") + "=" + URLEncoder.encode(sitecd, "UTF-8")); /*정수장코드*/
		        urlBuilder.append("&" + URLEncoder.encode("stdt","UTF-8") + "=" + URLEncoder.encode(stdt.replaceAll("-", ""), "UTF-8")); /*조회시작일*/
		        urlBuilder.append("&" + URLEncoder.encode("eddt","UTF-8") + "=" + URLEncoder.encode(eddt.replaceAll("-", ""), "UTF-8")); /*조회종료일*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /*줄수*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&_type=json");
		        System.out.println(urlBuilder);
		        
		        //URL 객체 생성하기
		        URL url = new URL(urlBuilder.toString());
		        
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        System.out.println("Response code: " + conn.getResponseCode());
		        
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		            request.setAttribute("mesg", "공공데이터 호출 오류입니다. 다시 시도해 주세요.");
		            nextPage = "MonthSearch.jsp";
		        }
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        System.out.println(sb.toString());
		        System.out.println("지방정수장 API 호출 ===== ");
		        try {
			        JSONObject obj = (JSONObject) parser.parse(sb.toString());
					JSONObject parseResponse = (JSONObject)obj.get("response");
					JSONObject parseBody = (JSONObject)parseResponse.get("body");
					String totalCount = (String) parseBody.get("totalCount").toString();
					System.out.println("totalCount===" + totalCount);
					JSONObject monthWaterQlt = null;
					
					if(totalCount.equals("0")) {
						request.setAttribute("mesg", "현재 서비스를 제공하고 있지 않습니다.");
						nextPage = "MonthSearch.jsp";
					} else {
						JSONObject parseItems = (JSONObject)parseBody.get("items");
						monthWaterQlt = (JSONObject) parseItems.get("item");
						
						MonthDTO mDTO = new MonthDTO();
						String date = (String)monthWaterQlt.get("cltdt").toString();
						String taste = (String)monthWaterQlt.get("data42").toString();
						String smell = (String)monthWaterQlt.get("data41").toString();
						String chromaticity = (String)monthWaterQlt.get("data44").toString();
						String pH = (String)monthWaterQlt.get("data46").toString();
						String turbidity = (String)monthWaterQlt.get("data52").toString();
						String residualCI = (String)monthWaterQlt.get("data33").toString();
						String bacteria = (String)monthWaterQlt.get("data1").toString();// 일반세균
						String totalColi = (String)monthWaterQlt.get("data2").toString();// 총대장균군
						String coli = (String)monthWaterQlt.get("data3").toString();// 대장균/분원성대장균군
						String ammonia = (String)monthWaterQlt.get("data11").toString();// 암모니아성 질소
						String nnitrogen = (String)monthWaterQlt.get("data12").toString();// 질산성질소
						String evaresi = (String)monthWaterQlt.get("data49").toString();// 증발잔류물
						
						mDTO.setDate(date);
						mDTO.setTaste(taste);
						mDTO.setSmell(smell);
						mDTO.setChromaticity(chromaticity);
						mDTO.setpH(pH);
						mDTO.setTurbidity(turbidity);
						mDTO.setResidualCI(residualCI);
						mDTO.setBacteria(bacteria);
						mDTO.setTotalColi(totalColi);
						mDTO.setColi(coli);
						mDTO.setAmmonia(ammonia);
						mDTO.setNnitrogen(nnitrogen);
						mDTO.setEvaresi(evaresi);
						
						mList.add(mDTO);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		        
			}
			response.setContentType("text/html;charset=utf-8");
			request.setAttribute("mList", mList);
			nextPage = "MonthSearch.jsp";
		//dong == null인 경우
		} else {
			request.setAttribute("mesg", "조회할 지역을 모두 선택하세요.");
			nextPage = "MonthSearch.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
