<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="dto.Restaurant" %>
<%@ page import="dao.RestaurantRepository" %>
<%@ page import="java.util.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 실제 서버 저장 경로 (application 객체 사용 권장)
    String realFolder = application.getRealPath("/resources/images");
    int maxSize = 5 * 1024 * 1024; // 5MB
    String encType = "UTF-8";

    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

    String id = multi.getParameter("id");
    String name = multi.getParameter("name");
    String priceStr = multi.getParameter("price");
    String location = multi.getParameter("location");
    String memo = multi.getParameter("memo");

    // 이미지 파일명 추출
    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    // 가격 형변환
    int price = (priceStr == null || priceStr.isEmpty()) ? 0 : Integer.parseInt(priceStr);

    RestaurantRepository dao = RestaurantRepository.getInstance();
    Restaurant newRest = new Restaurant();
    newRest.setId(id);
    newRest.setName(name);
    newRest.setPrice(price);
    newRest.setLocation(location);
    newRest.setMemo(memo);
    newRest.setFilename(fileName);

    dao.addRestaurant(newRest);

    response.sendRedirect("restaurants.jsp");
%>