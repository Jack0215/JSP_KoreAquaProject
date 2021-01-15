package com.controller.beach;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.dto.BeachDTO;
import com.sun.org.apache.xpath.internal.axes.HasPositionalPredChecker;

/**
 * Servlet implementation class BeachServlet
 */
@WebServlet("/BeachServlet")
public class BeachServlet extends HttpServlet {
   private static String getTagValue(String tag, Element eElement) {
         NodeList nlList = eElement.getElementsByTagName(tag);
//          System.out.println("출력1"+nlList);
//          System.out.println("출력2"+nlList.item(0));
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
            String sidoNm=(String)request.getParameter("sidoNm");
            String encoded = URLEncoder.encode(sidoNm, "utf-8");
            System.out.println("euc-kr:"+sidoNm+encoded);
            String num="500";
            String numOfRows=URLEncoder.encode(num, "utf-8");
            String url="http://apis.data.go.kr/1192000/service/OceansBeachSeawaterService1/getOceansBeachSeawaterInfo1?serviceKey=3Md9YXyRjKEN438TPDzd8itwECgi8TBe%2Bwou4UlrGSG%2Bng6GKCD42ROverxTkZzBT3sNFPWBxIHzQSBu7TQIKw%3D%3D&pageNo=1&numOfRows="+numOfRows+"&SIDO_NM="+encoded+"&resultType=xml&RES_YEAR=2019";
            System.out.println(url.toString());
            DocumentBuilderFactory dbFactory=DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder=dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(url);
            doc.getDocumentElement().normalize();
            Element element=doc.getDocumentElement();
            System.out.println(doc.getDocumentElement().getNodeName());
            
            NodeList nList=doc.getElementsByTagName("item");
            System.out.println("파싱할 갯수:"+nList.getLength());
            
         
            System.out.println("=================================================================");
            PrintWriter out = response.getWriter();
            String s = "";
            JSONArray jsonArr = new  JSONArray();
            HashMap<String, String> map=new HashMap<String, String>();
            map.put("staNm", "비교시작");
            for (int temp = 0; temp < nList.getLength(); temp++) {
               Node nNode=nList.item(temp);
               
               if(nNode.getNodeType()==Node.ELEMENT_NODE) {
                  Element eElement=(Element)nNode;
                  
//                  System.out.println("시도명:"+getTagValue("sidoNm", eElement));
//                  System.out.println("구군명:"+getTagValue("gugunNm", eElement));
//                  System.out.println("정점명:"+getTagValue("staNm", eElement));
//                  System.out.println("조사차수:"+getTagValue("resNum", eElement));
//                  System.out.println("조사지점:"+getTagValue("resLoc", eElement));
//                  System.out.println("대장균:"+getTagValue("res1", eElement));
//                  System.out.println("장구균:"+getTagValue("res2", eElement));
//                  System.out.println("적합여부:"+getTagValue("resYn", eElement));
//                  System.out.println("검사년도:"+getTagValue("resYear", eElement));
//                  System.out.println("검사일자:"+getTagValue("resDate", eElement));
//                  System.out.println("검사종류:"+getTagValue("resLocDetail", eElement));
//                  System.out.println("위도:"+getTagValue("lat", eElement));
//                  System.out.println("경도:"+getTagValue("lon", eElement));
               
                  

                  JSONObject jsonObj = new JSONObject();
                  
                  String staNm=getTagValue("staNm", eElement);
                  String staNmC=map.get("staNm");
                  System.out.println("비교결과:"+!staNmC.equals(staNm));
                  if(temp==0||!staNmC.equals(staNm)) {
                  jsonObj.put("gugunNm", getTagValue("gugunNm", eElement));
                  jsonObj.put("staNm", getTagValue("staNm", eElement));
                  jsonObj.put("resNum", getTagValue("resNum", eElement));
                  jsonObj.put("resLoc", getTagValue("resLoc", eElement));
                  jsonObj.put("res1", getTagValue("res1", eElement));
                  jsonObj.put("res2", getTagValue("res2", eElement));
                  jsonObj.put("resYn", getTagValue("resYn", eElement));
                  jsonObj.put("resYear", getTagValue("resYear", eElement));
                  jsonObj.put("resDate", getTagValue("resDate", eElement).substring(0, 10));
                  jsonObj.put("lat", getTagValue("lat", eElement));
                  jsonObj.put("lon", getTagValue("lon", eElement));
                  map.put("staNm", staNm);
                  System.out.println("json에 담았음");
                  System.out.println(jsonObj);
                  jsonArr.add(jsonObj);
                  
                  BeachDTO dto=new BeachDTO();
                  dto.setSidoNm(sidoNm);
                  dto.setGugunNm(getTagValue("gugunNm", eElement));
                  dto.setStaNm(getTagValue("staNm", eElement));
                  dto.setResNum(getTagValue("resNum", eElement));
                  dto.setResLoc(getTagValue("resLoc", eElement));
                  dto.setRes1(getTagValue("res1", eElement));
                  dto.setRes2(getTagValue("res2", eElement));
                  dto.setResYn(getTagValue("resYn", eElement));
                  dto.setResYear(getTagValue("resYear", eElement));
                  dto.setLat(getTagValue("lat", eElement));
                  dto.setLon(getTagValue("lon", eElement));
                  System.out.println("담은 beachdto 값"+dto);
                  HttpSession session=request.getSession();
                  
                  session.setAttribute(staNm,dto);
                  }
               
                  
                  System.out.println("===================");               
                  System.out.println("for end");
         

               }
               
            }
            System.out.println("jsonArr값");
            System.out.println(jsonArr);
            out.print(jsonArr);
//         
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}