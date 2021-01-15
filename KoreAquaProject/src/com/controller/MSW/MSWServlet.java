package com.controller.MSW;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.dto.MineralSpringWaterDTO;

/**
 * Servlet implementation class MSWServletNew
 */
@WebServlet("/MSWServlet")
public class MSWServlet extends HttpServlet {
	
	private static String getTagValue(String tag, Element eElement) {
		   NodeList nlList = eElement.getElementsByTagName(tag);
		    System.out.println("출력1"+nlList);
		    System.out.println("출력2"+nlList.item(0));
		    if(nlList.item(0)==null)
		    	return null;
		    NodeList nllList=nlList.item(0).getChildNodes();
		    Node nValue = (Node) nllList.item(0);
		    if(nValue == null) 
		        return null;
		    return nValue.getNodeValue();  
	}



	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
				String mnrlspNm=request.getParameter("mnrlspNm");
				System.out.println("");
				System.out.println("약수터명 받아온 값:"+mnrlspNm);
				String url="http://api.data.go.kr/openapi/tn_pubr_public_appn_mnrlsp_info_api?serviceKey=3Md9YXyRjKEN438TPDzd8itwECgi8TBe%2Bwou4UlrGSG%2Bng6GKCD42ROverxTkZzBT3sNFPWBxIHzQSBu7TQIKw%3D%3D&pageNo=0&numOfRows=100&type=xml&mnrlspNm="+mnrlspNm;
				System.out.println(url.toString());
				DocumentBuilderFactory dbFactory=DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder=dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				doc.getDocumentElement().normalize();
				Element element=doc.getDocumentElement();
				System.out.println(doc.getDocumentElement().getNodeName());
				
				NodeList nList=doc.getElementsByTagName("item");
				System.out.println("파싱할 갯수:"+nList.getLength());
				
			
				
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode=nList.item(temp);
					
					if(nNode.getNodeType()==Node.ELEMENT_NODE) {
						Element eElement=(Element)nNode;
//						
//						System.out.println("약수터명:"+getTagValue("mnrlspNm", eElement));
//						System.out.println("도로명 주소:"+getTagValue("rdnmadr", eElement));
//						System.out.println("지명 주소:"+getTagValue("lnmadr", eElement));
//						System.out.println("위도:"+getTagValue("latitude", eElement));
//						System.out.println("경도:"+getTagValue("longitude", eElement));
//						System.out.println("지정일자:"+getTagValue("appnDate", eElement));
//						System.out.println("일평균이용인구수:"+getTagValue("dayUseCn", eElement));
//						System.out.println("수질검사일자:"+getTagValue("qltwtrInspctDate", eElement));
//						System.out.println("수질검사결과구분:"+getTagValue("qltwtrInspctResultType", eElement));
//						System.out.println("부적합항목:"+getTagValue("improptIem", eElement));
//						System.out.println("관리기관전화번호:"+getTagValue("phoneNumber", eElement));
//						System.out.println("관리기관명:"+getTagValue("institutionNm", eElement));
//						System.out.println("데이터기준일자:"+getTagValue("referenceDate", eElement));
//						System.out.println("제공기관코드:"+getTagValue("insttCode", eElement));
//						
						
						mnrlspNm=getTagValue("mnrlspNm", eElement);
						if(getTagValue("mnrlspNm", eElement)!=null) {
							mnrlspNm=getTagValue("mnrlspNm", eElement);
							}
							String rdnmadr="자료없음";
							if(getTagValue("rdnmadr", eElement)!=null) {
							rdnmadr=getTagValue("rdnmadr", eElement);
							}
							//
							System.out.println(rdnmadr);
							String lnmadr="자료없음";
							if(getTagValue("lnmadr", eElement)!=null) {
							lnmadr=getTagValue("lnmadr", eElement);
							}
							
							String latitude="자료없음";
							if(getTagValue("latitude", eElement)!=null) {
							latitude=getTagValue("latitude", eElement);
							}
							//
							String longitude="자료없음";
							if(getTagValue("longitude", eElement)!=null) {
							longitude=getTagValue("longitude", eElement);
							}
							//
							String appnDate="자료없음";
							if(getTagValue("appnDate", eElement)!=null) {
							appnDate=getTagValue("appnDate", eElement);
							}
							//
							String dayUseCn="자료없음";
							if(getTagValue("dayUseCn", eElement)!=null) {
							dayUseCn=getTagValue("dayUseCn", eElement);
							}
							//
							String qltwtrInspctDate="자료없음";
							if(getTagValue("qltwtrInspctDate", eElement)!=null) {
							//
							qltwtrInspctDate=getTagValue("qltwtrInspctDate", eElement);
							}
							//
							String qltwtrInspctResultType="자료없음";
							if(getTagValue("qltwtrInspctResultType", eElement)!=null) {
							qltwtrInspctResultType=getTagValue("qltwtrInspctResultType", eElement);
							}
							//
							String improptIem="부적합 항목없음";
							if(getTagValue("improptIem", eElement)!=null) {
							improptIem=getTagValue("improptIem", eElement);
							}
							//
							String phoneNumber="자료없음";
							if(getTagValue("phoneNumber", eElement)!=null) {
							phoneNumber=getTagValue("phoneNumber", eElement);
							}
							//
							String institutionNm="자료없음";
							if(getTagValue("institutionNm", eElement)!=null) {
							institutionNm=getTagValue("institutionNm", eElement);
							}//
							String referenceDate="자료없음";
							if(getTagValue("referenceDate", eElement)!=null) {
							referenceDate=getTagValue("referenceDate", eElement);
							}
							//
							String insttCode="자료없음";
							if(getTagValue("insttCode", eElement)!=null) {
							insttCode=getTagValue("insttCode", eElement);
							}
							
							
//						String rdnmadr=getTagValue("rdnmadr", eElement);
//						//
//						System.out.println(rdnmadr);
//						String lnmadr=getTagValue("lnmadr", eElement);
//						//
//						String latitude=getTagValue("latitude", eElement);
//						//
//						String longitude=getTagValue("longitude", eElement);
//						//
//						String appnDate=getTagValue("appnDate", eElement);
//						//
//						String dayUseCn=getTagValue("dayUseCn", eElement);
//						//
//						String qltwtrInspctDate=getTagValue("qltwtrInspctDate", eElement);
//						//
//						String qltwtrInspctResultType=getTagValue("qltwtrInspctResultType", eElement);
//						//
//						String improptIem=getTagValue("improptIem", eElement);
//						//
//						String phoneNumber=getTagValue("phoneNumber", eElement);
//						//
//						String institutionNm=getTagValue("institutionNm", eElement);
//						//
//						String referenceDate=getTagValue("referenceDate", eElement);
//						//
//						String insttCode=getTagValue("insttCode", eElement);
						
						MineralSpringWaterDTO dto=new MineralSpringWaterDTO(mnrlspNm,null,null,latitude,longitude,appnDate,dayUseCn,qltwtrInspctDate,qltwtrInspctResultType,improptIem,phoneNumber,institutionNm,referenceDate,insttCode);
						System.out.println("jsp로 보내줄값들"+dto);
						request.setAttribute("dto", dto);
						RequestDispatcher dis=request.getRequestDispatcher("MineralSWMark.jsp");
						dis.forward(request, response);
					}
					
				}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
